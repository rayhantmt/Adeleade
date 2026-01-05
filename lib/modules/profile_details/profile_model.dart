class ProfileApiResponse {
  final bool success;
  final String message;
  final ProfileData data;

  ProfileApiResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ProfileApiResponse.fromJson(Map<String, dynamic> json) {
    return ProfileApiResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: ProfileData.fromJson(json['data']),
    );
  }
}

class ProfileData {
  final User user;
  final List<Event> createdEvents;

  ProfileData({
    required this.user,
    required this.createdEvents,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) {
    return ProfileData(
      user: User.fromJson(json['user']),
      createdEvents: (json['createdEvents'] as List?)
              ?.map((e) => Event.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class User {
  final String name;
  final String bio;
  final String profession;
  final String nationality;
  final String instagram;
  final String linkedIn;
  final String gender;
  final bool verified;
  final String photoURL;
  final String coverPhotoURL;
  final List<String> galleryPhotos;
  final String status;
  final String lastOnline;
  final String createdAt;
  final String updatedAt;
  final String id;

  User({
    required this.name,
    required this.bio,
    required this.profession,
    required this.nationality,
    required this.instagram,
    required this.linkedIn,
    required this.gender,
    required this.verified,
    required this.photoURL,
    required this.coverPhotoURL,
    required this.galleryPhotos,
    required this.status,
    required this.lastOnline,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] ?? '',
      bio: json['bio'] ?? '',
      profession: json['profession'] ?? '',
      nationality: json['nationality'] ?? '',
      instagram: json['instagram'] ?? '',
      linkedIn: json['linkedIn'] ?? '',
      gender: json['gender'] ?? '',
      verified: json['verified'] ?? false,
      photoURL: json['photoURL'] ?? '',
      coverPhotoURL: json['coverPhotoURL'] ?? '',
      galleryPhotos: (json['galleryPhotos'] as List?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      status: json['status'] ?? '',
      lastOnline: json['lastOnline'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      id: json['id'] ?? '',
    );
  }
}

class Event {
  final String userID;
  final String name;
  final String eventDate;
  final String location;
  final String geoLocation;
  final String category;
  final String imageURL;
  final String details;
  final int maxParticipants;
  final List<String> participants;
  final String status;
  final bool isDeleted;
  final String createdAt;
  final String updatedAt;
  final String id;

  Event({
    required this.userID,
    required this.name,
    required this.eventDate,
    required this.location,
    required this.geoLocation,
    required this.category,
    required this.imageURL,
    required this.details,
    required this.maxParticipants,
    required this.participants,
    required this.status,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      userID: json['userID'] ?? '',
      name: json['name'] ?? '',
      eventDate: json['eventDate'] ?? '',
      location: json['location'] ?? '',
      geoLocation: json['geoLocation'] ?? '',
      category: json['category'] ?? '',
      imageURL: json['imageURL'] ?? '',
      details: json['details'] ?? '',
      maxParticipants: json['maxParticipants'] ?? 0,
      participants: (json['participants'] as List?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      status: json['status'] ?? '',
      isDeleted: json['isDeleted'] ?? false,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      id: json['id'] ?? '',
    );
  }
}

class ProfileModel {
  final String image;

  ProfileModel({required this.image});
}