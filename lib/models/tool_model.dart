class ToolModel {
  final String id; //int?
  final String title;
  final String image;
  final String description;
  final bool isAvailable;
  final int rating; //num?
  //final List < int > categoryIds ?

  const ToolModel({
    required this.id,
    required this.title,
    required this.description,
    this.image = "",
    this.rating = 0,
    this.isAvailable = true,
  });
}