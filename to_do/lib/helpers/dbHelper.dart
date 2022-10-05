import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:tasker/models/categoryModel.dart';
import 'package:tasker/models/taskModel.dart';

class DBHelper {
  static Future<sql.Database> setupTaskTable() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'tasks.db'),
        onCreate: (db, version) {
          return db.execute(
              'CREATE TABLE tasks_table(id TEXT PRIMARY KEY, name TEXT, desc TEXT , isFavorite INTEGER, categoryName TEXT)');
        }, version: 1);
  }

  static Future<sql.Database> setupCategoryTable() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'category.db'),
        onCreate: (db, version) {
          return db.execute(
              'CREATE TABLE category_table(id TEXT PRIMARY KEY, name TEXT)');
        }, version: 1);
  }

  static Future<void> insertTask(String table, Map<String, Object> data) async {
    final insertInDB = await DBHelper.setupTaskTable();
    insertInDB.insert('tasks_table', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<TaskModel>> getTaskData(String categoryName) async {
    final getFromDB = await DBHelper.setupTaskTable();
    final dataList = await getFromDB.query('tasks_table',
        where: 'categoryName = ?', whereArgs: [categoryName]);
    return dataList
        .map((e) => TaskModel(
        id: e['id'] as String,
        name: e['name'] as String,
        desc: e['desc'] as String,
        isFavorite: e['isFavorite'] as int,
        categoryName: e['categoryName'] as String))
        .toList();
  }

  static Future<void> insertCategory(Map<String, Object> data) async {
    final insertInDB = await DBHelper.setupCategoryTable();
    insertInDB.insert('category_table', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<CategoryModel>> getCategoryData() async {
    final getFromDB = await DBHelper.setupCategoryTable();
    final dataList = await getFromDB.query('category_table');
    return dataList
        .map((e) => CategoryModel(
      id: e['id'] as String,
      name: e['name'] as String,
    ))
        .toList();
  }

  static Future<void> deleteCategory(String id, String name) async {
    // Get a reference to the database.
    final categorydb = await DBHelper.setupCategoryTable();
    final tasksdb = await DBHelper.setupTaskTable();
    // Remove the task from the database.
    await categorydb.delete(
      'category_table',
      where: 'id = ?',
      whereArgs: [id],
    );
    await tasksdb
        .delete('tasks_table', where: 'categoryName = ?', whereArgs: [name]);
  }

  static Future<void> updateTask(Map<String, dynamic> task) async {
    // Get a reference to the database.
    final db = await DBHelper.setupTaskTable();
    // Update the given task.
    await db.update(
      'tasks_table',
      task,
      where: 'id = ?',
      whereArgs: [task['id']],
    );
  }

  static Future<void> deleteTask(String id) async {
    // Get a reference to the database.
    final db = await DBHelper.setupTaskTable();
    // Remove the task from the database.
    await db.delete(
      'tasks_table',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  static Future<void> resetTasks(String category) async {
    final db = await DBHelper.setupTaskTable();
    await db.delete('tasks_table',
        where: "categoryName = ?", whereArgs: [category]);
  }

  static Future<List<TaskModel>> fetchFavorites(int favoriteStatus) async {
    // Get a reference to the database.
    final db = await DBHelper.setupTaskTable();
    // Fetch the favorites from the database.
    final favoriteList = await db.query(
      'tasks_table',
      where: 'isFavorite = ?',
      whereArgs: [favoriteStatus],
    );
    return favoriteList
        .map((e) => TaskModel(
        id: e['id'] as String,
        name: e['name'] as String,
        desc: e['desc'] as String,
        isFavorite: e['isFavorite'] as int,
        categoryName: e['categoryName'] as String))
        .toList();
  }
}