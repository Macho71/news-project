abstract class ResponseHandlar {
  ResponseHandlar();
}

class SuccessResponse<T> extends ResponseHandlar {
  T? model;
  SuccessResponse(this.model);
}

class NetworOrHttpError extends ResponseHandlar {
 String networkError;
  NetworOrHttpError(this.networkError);
}

class Expandition extends ResponseHandlar {
 Expandition exception;
  Expandition(this.exception);
}
