// class Event{
//   final String tittle;
//   final String date_time;
//   final String location;
//   final String maxpeople;
//   final String joinedpeople;
//   final String image;
  

//   Event({ required this.image, required this.tittle, required this.date_time, required this.location, required this.maxpeople, required this.joinedpeople});
//}// event_model.dart
class Event {
  // Required UI fields (your original model)
  final String title;
  final String dateTime;
  final String location;
  final String maxPeople;
  final String joinedPeople;
  final String image;
  
  // Additional data from API (stored for future use)
  final String id;
  final String category;
  final String details;
  final String status;
  final String geoLocation;
  final bool isDeleted;
  final String createdAt;
  final String updatedAt;
  
  // Organizer info
  final String organizerName;
  final String organizerEmail;
  final String organizerPhoto;
  final String organizerId;
  
  // Participants list (stored for future use)
  final List<Participant> participants;

  Event({
    required this.title,
    required this.dateTime,
    required this.location,
    required this.maxPeople,
    required this.joinedPeople,
    required this.image,
    required this.id,
    required this.category,
    required this.details,
    required this.status,
    required this.geoLocation,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.organizerName,
    required this.organizerEmail,
    required this.organizerPhoto,
    required this.organizerId,
    required this.participants,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    final userID = json['userID'] ?? {};
    final participantsList = json['participants'] as List? ?? [];
    
    return Event(
      // UI required fields
      title: json['name'] ?? '',
      dateTime: json['eventDate'] ?? '',
      location: json['location'] ?? '',
      maxPeople: (json['maxParticipants'] ?? 0).toString(),
      joinedPeople: participantsList.length.toString(),
      image: json['imageURL'] ?? '',
      
      // Additional data
      id: json['id'] ?? '',
      category: json['category'] ?? '',
      details: json['details'] ?? '',
      status: json['status'] ?? '',
      geoLocation: json['geoLocation'] ?? '',
      isDeleted: json['isDeleted'] ?? false,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      
      // Organizer info
      organizerName: userID['name'] ?? '',
      organizerEmail: userID['email'] ?? '',
      organizerPhoto: userID['photoURL'] ?? '',
      organizerId: userID['id'] ?? '',
      
      // Participants
      participants: participantsList
          .map((p) => Participant.fromJson(p))
          .toList(),
    );
  }

  // Helper getters for UI
  String get formattedDate {
    try {
      final date = DateTime.parse(dateTime);
      return '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
    } catch (e) {
      return dateTime;
    }
  }
  
  bool get isFull => int.parse(joinedPeople) >= int.parse(maxPeople);
  
  int get availableSlots => int.parse(maxPeople) - int.parse(joinedPeople);
}

// Participant Model (for future use)
class Participant {
  final String name;
  final String photoURL;
  final String id;

  Participant({
    required this.name,
    required this.photoURL,
    required this.id,
  });

  factory Participant.fromJson(Map<String, dynamic> json) {
    return Participant(
      name: json['name'] ?? '',
      photoURL: json['photoURL'] ?? '',
      id: json['id'] ?? '',
    );
  }
}
class Category{
  final String categories;

  Category({required this.categories});
}