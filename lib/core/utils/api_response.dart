class ApiResponse {
  ApiResponse({
    this.success,
    this.message,
    this.data,
    this.totalRecords,
  });

  ApiResponse.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    data = json['data'];
    totalRecords = json['totalRecords'];
  }

  bool? success;
  String? message;
  dynamic data;
  dynamic totalRecords;
}
