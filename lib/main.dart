import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tv_series_hub/app/app_widget.dart';
import 'package:tv_series_hub/app/data/repositories/local_storage_repositories/hive_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final directory = await getApplicationDocumentsDirectory();
  final hiveRepository = HiveRepository();
  await hiveRepository.init(directory: directory);

  runApp(
    // DevicePreview(
    // enabled: !kReleaseMode,
    // builder: (context) =>

    AppWidget(iLocalStorageRepository: hiveRepository),
    // ),
  );
}
