class ErrorModel {
  final String message;
  final int? statusCode;
  final Map<String, dynamic> error;
  final String? stack;

  ErrorModel({
    required this.message,
    this.statusCode,
    required this.error,
    this.stack,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      message: jsonData["message"] ?? "An unexpected error occurred",
      statusCode: jsonData["status_code"], // Nullable
      error: jsonData["error"] ?? {},
      stack: jsonData["stack"], // Nullable
    );
  }

  @override
  String toString() {
    return "ErrorModel: $message (Status: $statusCode)";
  }
}
