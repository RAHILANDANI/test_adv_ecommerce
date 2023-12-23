class ApiModel {
  int id;
  String title;
  var price;
  String description;
  String category;
  String image;

  ApiModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image});
}
