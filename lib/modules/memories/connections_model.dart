class ConnectionsResponse {
  final bool success;
  final String message;
  final ConnectionsData data;

  ConnectionsResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ConnectionsResponse.fromJson(Map<String, dynamic> json) {
    return ConnectionsResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: ConnectionsData.fromJson(json['data']),
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

class ConnectionsData {
  final List<Connection> connections;
  final int count;

  ConnectionsData({
    required this.connections,
    required this.count,
  });

  factory ConnectionsData.fromJson(Map<String, dynamic> json) {
    return ConnectionsData(
      connections: (json['connections'] as List?)
              ?.map((e) => Connection.fromJson(e))
              .toList() ??
          [],
      count: json['count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'connections': connections.map((e) => e.toJson()).toList(),
      'count': count,
    };
  }
}

class Connection {
  final String connectionId;
  final ConnectedUser user;
  final String connectedAt;

  Connection({
    required this.connectionId,
    required this.user,
    required this.connectedAt,
  });

  factory Connection.fromJson(Map<String, dynamic> json) {
    return Connection(
      connectionId: json['connectionId'] ?? '',
      user: ConnectedUser.fromJson(json['user']),
      connectedAt: json['connectedAt'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'connectionId': connectionId,
      'user': user.toJson(),
      'connectedAt': connectedAt,
    };
  }
}

class ConnectedUser {
  final String email;
  final String name;
  final String photoURL;
  final String status;
  final String lastOnline;
  final String id;

  ConnectedUser({
    required this.email,
    required this.name,
    required this.photoURL,
    required this.status,
    required this.lastOnline,
    required this.id,
  });

  factory ConnectedUser.fromJson(Map<String, dynamic> json) {
    return ConnectedUser(
      email: json['email'] ?? '',
      name: json['name'] ?? '',
      photoURL: json['photoURL'] ?? '',
      status: json['status'] ?? '',
      lastOnline: json['lastOnline'] ?? '',
      id: json['id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'photoURL': photoURL,
      'status': status,
      'lastOnline': lastOnline,
      'id': id,
    };
  }
}