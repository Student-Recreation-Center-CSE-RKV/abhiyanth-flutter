class DepartmentEventModel {
  final List<Event> ongoingEvents;
  final List<String> ? departmentCarousel;

  DepartmentEventModel({
    required this.ongoingEvents,
     this.departmentCarousel,
  });

  factory DepartmentEventModel.fromList(List<Map<String, dynamic>> eventDataList, List<String> departmentCarousel) {
    List<Event> ongoing = [];

    for (var data in eventDataList) {
        final event = Event.fromMap(data['id'], data, data['date']);
          ongoing.add(event);
    }

    return DepartmentEventModel(
      ongoingEvents: ongoing,
      departmentCarousel: departmentCarousel,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ongoingEvents': ongoingEvents.map((event) => event.toMap()).toList(),
      'departmentCarousel': departmentCarousel,
    };
  }
}

class Event {
  final String id;
  final String description;
  final String short_description;
  final String image;
  final String venue;
  final List<dynamic> prizes;
  final String registration_link;
  final List<dynamic> result;
  final List<dynamic> sponsors;
  final DateTime date;
  final String title;
  final int amount;

  Event({
    required this.id,
    required this.description,
    required this.image,
    required this.prizes,
    required this.registration_link,
    required this.result,
    required this.sponsors,
    required this.date,
    required this.title,
    required this.venue,
    required this.short_description,
   required this.amount
  });

  factory Event.fromMap(String id, Map<String, dynamic> eventData, String eventDate) {
    return Event(
      id: id,
      description: eventData['description']?.toString() ?? 'No Description',
      image: eventData['image']?.toString() ?? 'https://via.placeholder.com/150',
      prizes: List<dynamic>.from(eventData['prizes'] ?? []),
      registration_link: eventData['registration_link']?.toString() ?? '',
      result: List<dynamic>.from(eventData['result'] ?? []),
      sponsors: List<dynamic>.from(eventData['sponsors'] ?? []),
      date: DateTime.parse(eventData['date']),
      venue: eventData['venue']?.toString()??"",
      title: eventData['title']?.toString() ?? 'CSE tech',
      short_description: eventData['short_description']?.toString()??'',
      amount: eventData['amount']??0,

    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'image': image,
      'prizes': prizes,
      'registration_link': registration_link,
      'result': result,
      'sponsors': sponsors,
      'date': date,
      'title': title,
      'short_description':short_description,
      'amount':amount
    };
  }
}