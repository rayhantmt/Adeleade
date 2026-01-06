class ConnectionRequestResponse {
  final bool success;
  final String message;
  final ConnectionRequestData data;

  ConnectionRequestResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ConnectionRequestResponse.fromJson(Map<String, dynamic> json) {
    return ConnectionRequestResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: ConnectionRequestData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data.toJson(),
    };
  }
}

class ConnectionRequestData {
  final List<ConnectionRequest> requests;
  final int count;

  ConnectionRequestData({
    required this.requests,
    required this.count,
  });

  factory ConnectionRequestData.fromJson(Map<String, dynamic> json) {
    return ConnectionRequestData(
      requests: (json['requests'] as List?)
              ?.map((e) => ConnectionRequest.fromJson(e))
              .toList() ??
          [],
      count: json['count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'requests': requests.map((e) => e.toJson()).toList(),
      'count': count,
    };
  }
}

class ConnectionRequest {
  final RequestUser userId;
  final String connectionId;
  final String status;
  final String createdAt;
  final String updatedAt;
  final String id;

  ConnectionRequest({
    required this.userId,
    required this.connectionId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
  });

  factory ConnectionRequest.fromJson(Map<String, dynamic> json) {
    return ConnectionRequest(
      userId: RequestUser.fromJson(json['userId']),
      connectionId: json['connectionId'] ?? '',
      status: json['status'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      id: json['id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId.toJson(),
      'connectionId': connectionId,
      'status': status,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'id': id,
    };
  }
}

class RequestUser {
  final String email;
  final String name;
  final String photoURL;
  final String id;

  RequestUser({
    required this.email,
    required this.name,
    required this.photoURL,
    required this.id,
  });

  factory RequestUser.fromJson(Map<String, dynamic> json) {
    return RequestUser(
      email: json['email'] ?? '',
      name: json['name'] ?? '',
      photoURL: json['photoURL'] ?? '',
      id: json['id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'photoURL': photoURL,
      'id': id,
    };
  }
}