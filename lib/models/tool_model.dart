class ToolModel {
  final int id;
  final String title;
  final String image;
  final String description;
  final bool isAvailable;
  final bool needsTransport;
  final bool maybeFree;
  final int rating;
  final int cost;

  //final bool askWithFee;
  //final int startDate;
  //final int endDate;
  //final int estimatedValue;
  //final int height;
  //final int width;
  //final int length;
  //fina int maxDays;
  //List <int> categoryIds ?
  //List<CategoryModel>categories;
  //List<TransportNeeded>transport; ?
  //WeightRange weightRange;
  //DistanceRange distanceRange;

  const ToolModel({
    required this.needsTransport,
    required this.maybeFree,
    required this.cost,
    required this.id,
    required this.title,
    required this.description,
    this.image = "",
    this.rating = 0,
    this.isAvailable = true,
  });

  ToolModel copy({
    int? id,
    String? title,
    String? image,
    String? description,
    bool? isAvailable,
    bool? needsTransport,
    bool? maybeFree,
    int? rating,
    int? cost,
  }) =>
      ToolModel(
        needsTransport: needsTransport ?? this.needsTransport,
        maybeFree: maybeFree ?? this.maybeFree,
        cost: cost ?? this.cost,
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
      );

  static ToolModel fromJson(Map<String, dynamic> json) => ToolModel(
        needsTransport: json['needsTransport'],
        maybeFree: json['maybeFree'],
        cost: json['cost'],
        id: json['id'],
        title: json['title'],
        description: json['description'],
      );

  Map<String, dynamic> toJson() => {
        'needsTransport': needsTransport,
        'maybeFree': maybeFree,
        'cost': cost,
        'id': id,
        'title': title,
        'description': description,
      };
}
