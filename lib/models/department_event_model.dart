class DepartmentEventModel {
  final List<Event> ongoingEvents;
  final List<Event> upcomingEvents;
  final List<String> departmentCarousel;

  DepartmentEventModel({
    required this.ongoingEvents,
    required this.upcomingEvents,
    required this.departmentCarousel,
  });

  factory DepartmentEventModel.fromList(List<Map<String, dynamic>> eventDataList, List<String> departmentCarousel) {
    List<Event> ongoing = [];
    List<Event> upcoming = [];
    final now = DateTime.now();

    for (var data in eventDataList) {
      final eventDate = DateTime.tryParse(data['date'] ?? '');
      if (eventDate != null) {
        final event = Event.fromMap(data['id'], data, data['date']);
        if (eventDate.isBefore(now)) {
          ongoing.add(event);
        } else {
          upcoming.add(event);
        }
      }
    }

    return DepartmentEventModel(
      ongoingEvents: ongoing,
      upcomingEvents: upcoming,
      departmentCarousel: departmentCarousel,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ongoingEvents': ongoingEvents.map((event) => event.toMap()).toList(),
      'upcomingEvents': upcomingEvents.map((event) => event.toMap()).toList(),
      'departmentCarousel': departmentCarousel,
    };
  }
}

class Event {
  final String id;
  final String description;
  final String image;
  final String venue;
  final List<dynamic> prizes;
  final String registrationLink;
  final List<dynamic> result;
  final List<dynamic> sponsors;
  final DateTime date;
  final String title;

  Event({
    required this.id,
    required this.description,
    required this.image,
    required this.prizes,
    required this.registrationLink,
    required this.result,
    required this.sponsors,
    required this.date,
    required this.title,
    required this.venue
  });

  factory Event.fromMap(String id, Map<String, dynamic> eventData, String eventDate) {
    return Event(
      id: id,
      description: eventData['description']?.toString() ?? 'No Description',
      image: eventData['image']?.toString() ?? 'https://via.placeholder.com/150',
      prizes: List<dynamic>.from(eventData['prizes'] ?? []),
      registrationLink: eventData['registration_link']?.toString() ?? '',
      result: List<dynamic>.from(eventData['result'] ?? []),
      sponsors: List<dynamic>.from(eventData['sponsors'] ?? []),
      date: DateTime.parse(eventData['date']),
      venue: eventData['venue']?.toString()??"",
      title: eventData['title']?.toString() ?? 'CSE tech',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'image': image,
      'prizes': prizes,
      'registration_link': registrationLink,
      'result': result,
      'sponsors': sponsors,
      'date': date,
      'title': title,
    };
  }
}