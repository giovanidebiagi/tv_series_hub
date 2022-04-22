abstract class IHttpService {
  Future get({required String url, var headers, var queryParameters});
}
