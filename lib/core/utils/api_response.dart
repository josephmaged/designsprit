/// status : true
/// message : "Success"
/// data : []

class ApiResponse<T> {
  ApiResponse({
    bool? status,
    String? message,
    T? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  ApiResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = json['data'];
    }
  }

  bool? _status;
  String? _message;
  T? _data;

  bool? get status => _status;

  String? get message => _message;

  T? get data => _data;
}
