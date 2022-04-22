import 'package:hive_flutter/hive_flutter.dart';
import 'package:tv_series_hub/app/data/repositories/local_storage_repositories/i_local_storage_repository.dart';
import '../../models/tv_series_model.dart';

class HiveRepository implements ILocalStorageRepository {
  Box? box;

  @override
  var contents;

  @override
  Future init({dynamic directory}) async {
    await Hive.initFlutter(directory.path);

    await Hive.initFlutter(directory.path);

    Hive.registerAdapter(TvSeriesModelAdapter());

    box = await Hive.openBox('favorite');

    contents = box;
  }

  @override
  Future get(dynamic id) async {
    if (this.boxIsClosed) {
      return null;
    }

    return this.box?.get(id);
  }

  @override
  Future put(dynamic object) async {
    if (this.boxIsClosed) {
      return null;
    }

    await this.box?.put(object.id, object);
  }

  @override
  Future close() async {
    box?.close();
  }

  @override
  Future delete(id) async {
    if (this.boxIsClosed) {
      return null;
    }
    await this.box?.delete(id);
  }

  bool get boxIsClosed => this.box != null ? !(this.box!.isOpen) : true;
}
