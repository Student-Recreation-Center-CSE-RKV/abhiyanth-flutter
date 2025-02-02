import 'package:cloud_firestore/cloud_firestore.dart';

// Model for Culturals
class CulturalsModel {
  final String id;
  final String name;
  final String description;
  final String mainDescription;
  final String secondaryDescription;
  final DateTime date;
  final String time;
  final String venue;
  final String status;
  final String registerLink;
  final Images images;
  final List<String> link;
  final List<Organizer> organizers;  // Updated to List<Organizer>
  final List<String> results;

  CulturalsModel({
    required this.id,
    required this.name,
    required this.description,
    required this.mainDescription,
    required this.secondaryDescription,
    required this.date,
    required this.time,
    required this.venue,
    required this.status,
    required this.registerLink,
    required this.images,
    required this.link,
    required this.organizers,  // Updated to List<Organizer>
    required this.results,
  });

  factory CulturalsModel.fromJson(Map<String, dynamic> json) {
    return CulturalsModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      mainDescription: json['mainDescription'] ?? '',
      secondaryDescription: json['secondaryDescription'] ?? '',
      date: json['date'] != null ? (json['date'] as Timestamp).toDate() : DateTime.now(),
      time: json['time'] ?? '',
      venue: json['venue'] ?? '',
      status: json['status'] ?? '',
      registerLink: json['register_link'] ?? '',
      images: json['images'] != null
          ? Images.fromJson(json['images'])
          : Images(descImageLeft: '', descImageRight: '', mainImage: '', lastImage: null),
      link: List<String>.from(json['link'] ?? []),
      organizers: (json['organizers'] as List<dynamic>?)
          ?.map((organizerJson) => Organizer.fromJson(organizerJson as Map<String, dynamic>))
          .toList() ??
          [],  // Parse the array of organizers into a list of Organizer objects
      results: List<String>.from(json['results'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'mainDescription': mainDescription,
      'secondaryDescription': secondaryDescription,
      'date': date,
      'time': time,
      'venue': venue,
      'status': status,
      'register_link': registerLink,
      'images': images.toJson(),
      'link': link,
      'organizers': organizers.map((organizer) => organizer.toJson()).toList(),  // Convert organizers to JSON
      'results': results,
    };
  }
}

// Model for Images
class Images {
  final String descImageLeft;
  final String descImageRight;
  final String mainImage;
  final String? lastImage;

  Images({
    required this.descImageLeft,
    required this.descImageRight,
    required this.mainImage,
    this.lastImage,
  });

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      descImageLeft: json['descImageLeft'] ?? '',
      descImageRight: json['descImageRight'] ?? '',
      mainImage: json['mainImage'] ?? '',
      lastImage: json['lastImage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'descImageLeft': descImageLeft,
      'descImageRight': descImageRight,
      'mainImage': mainImage,
      'lastImage': lastImage,
    };
  }
}

// Model for Organizer
class Organizer {
  final String name;
  final String mobile;

  Organizer({
    required this.name,
    required this.mobile,
  });

  factory Organizer.fromJson(Map<String, dynamic> json) {
    return Organizer(
      name: json['name'] ?? '', // Default to empty string if missing
      mobile: json['mobile'] ?? '', // Default to empty string if missing
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'mobile': mobile,
    };
  }
}
