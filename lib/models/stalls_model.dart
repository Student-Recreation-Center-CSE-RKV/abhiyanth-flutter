class StallModel {
  final String? belongTo;
  final Map<String, String>? contact;
  final String? id;
  final String? image;
  final String? imageLeft;
  final String? imageRight;
  final String? items;
  final String? mainDescription;
  final String? menuCard;
  final String? name;
  final List<String>? offers;
  final String? shortDescription;
  final String? timings;

  StallModel({
    this.belongTo,
    this.contact,
    this.id,
    this.image,
    this.imageLeft,
    this.imageRight,
    this.items,
    this.mainDescription,
    this.menuCard,
    this.name,
    this.offers,
    this.shortDescription,
    this.timings,
  });

  factory StallModel.fromJson(Map<String, dynamic> json) {
    return StallModel(
      belongTo: json['belongTo'] as String?,
      contact: Map<String, String>.from(json['contact'] ?? {}),
      id: json['id'] as String?,
      image: json['image'] as String?,
      imageLeft: json['imageLeft'] as String?,
      imageRight: json['imageRight'] as String?,
      items: json['items'] as String?,
      mainDescription: json['main_description'] as String?,
      menuCard: json['menu_card'] as String?,
      name: json['name'] as String?,
      offers: List<String>.from(json['offers'] ?? []),
      shortDescription: json['short_description'] as String?,
      timings: json['timings'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'belongTo': belongTo,
      'contact': contact,
      'id': id,
      'image': image,
      'imageLeft': imageLeft,
      'imageRight': imageRight,
      'items': items,
      'main_description': mainDescription,
      'menu_card': menuCard,
      'name': name,
      'offers': offers,
      'short_description': shortDescription,
      'timings': timings,
    };
  }

  @override
  String toString() {
    return 'StallModel(belongTo: $belongTo, contact: $contact, id: $id, image: $image, imageLeft: $imageLeft, imageRight: $imageRight, items: $items, mainDescription: $mainDescription, menuCard: $menuCard, name: $name, offers: $offers, shortDescription: $shortDescription, timings: $timings)';
  }
}