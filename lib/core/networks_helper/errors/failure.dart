class FailureException implements Exception {
  final String errMessage;
  final int? statusCode;
  final Map<String, dynamic>? error;

  FailureException({
    required this.errMessage,
    this.statusCode,
    this.error,
  });

  @override
  String toString() {
    return "FailureException: $errMessage (Status: $statusCode)";
  }
}
