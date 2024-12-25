class Failure implements Error{
  final String message;

  Failure([this.message = 'An unexpected error occurred']);
  
  @override
  StackTrace? get stackTrace => StackTrace.fromString(message);
}