class HttpError {
  String? message;

  HttpError({this.message});
}

class HttpNotFoundError extends HttpError {}

// If a CustomHttpError happens, we should retry in x seconds
class HttpCustomError extends HttpError {
  int secondsForRetry;

  // 53% of mobile website visitors will leave if a webpage doesn't load within 3 seconds
  HttpCustomError({String? message, this.secondsForRetry = 3})
      : super(message: message);
}
