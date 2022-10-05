class TaskModel {
  final String id;
  final String name;
  final String? desc;
  final int isFavorite;
  final String categoryName;

  TaskModel(
      {required this.id,
      required this.name,
      this.desc,
      required this.isFavorite,
      required this.categoryName});
}
