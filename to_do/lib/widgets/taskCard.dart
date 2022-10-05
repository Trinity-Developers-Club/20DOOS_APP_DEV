import 'package:flutter/material.dart';
import 'package:tasker/models/taskModel.dart';

class TaskCard extends StatelessWidget {
  final TaskModel taskItem;
  final Function deleteItem;
  final Function? toggleFavoriteStatus;
  final bool isFavoritesScreen;

  TaskCard(
      {required this.taskItem,
        required this.deleteItem,
        required this.toggleFavoriteStatus,
        required this.isFavoritesScreen});

  @override
  Widget build(BuildContext context) {
    Icon getFavIcon() {
      if (taskItem.isFavorite == 0) {
        return Icon(Icons.favorite_border);
      } else {
        return Icon(
          Icons.favorite,
          color: Colors.deepOrangeAccent,
        );
      }
    }

    return Card(
      elevation: 5,
      child: ListTile(
        leading: isFavoritesScreen
            ? null
            : IconButton(
          icon: getFavIcon(),
          onPressed: () {
            toggleFavoriteStatus!(taskItem);
          },
        ),
        title: Text(taskItem.name),
        subtitle: Text(isFavoritesScreen
            ? 'Category: ${taskItem.categoryName}'
            : taskItem.desc ?? ''),
        trailing: IconButton(
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
          onPressed: () {
            deleteItem(taskItem);
          },
        ),
      ),
    );
  }
}