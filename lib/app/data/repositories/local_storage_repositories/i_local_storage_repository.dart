abstract class ILocalStorageRepository {
  Future init({dynamic directory});

  Future get(dynamic id);

  Future put(dynamic object);

  Future delete(dynamic id);

  Future close();

  var contents;
}
