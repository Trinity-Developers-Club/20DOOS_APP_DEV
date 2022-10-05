import 'package:flutter/material.dart';
import 'package:tasker/helpers/dbHelper.dart';
import 'package:tasker/models/categoryModel.dart';
import 'package:tasker/screens/favoriteScreen.dart';
import '/screens/taskListScreen.dart';

class Categories extends StatefulWidget {
  Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  Icon _currentFace = Icon(Icons.radio_button_unchecked);
  List<CategoryModel> categories = [];
  bool isLoading = true;

  void fetchData() async {
    categories = await DBHelper.getCategoryData();
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void deleteCategory(CategoryModel category) async {
    await DBHelper.deleteCategory(category.id, category.name);
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    var textFieldController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (ctx) => Screen2()));
            },
          ),
          title: Center(
            child: const Text(
              'Choose Category',
            ),
          ),
          actions: [
            IconButton(
                onPressed: () async {
                  showDialog(
                    context: context,
                    builder: (dialogContext) => AlertDialog(
                      title: Center(child: const Text('Enter Category')),
                      content: TextField(
                        decoration: InputDecoration(
                          hintText: 'Type Here',
                        ),
                        controller: textFieldController,
                      ),
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  DBHelper.insertCategory({
                                    'id': DateTime.now().toString(),
                                    'name': textFieldController.text
                                  });

                                  fetchData();

                                  Navigator.of(dialogContext).pop();
                                },
                                child: Text('Add')),
                            SizedBox(
                              width: 10.0,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.of(dialogContext).pop();
                                },
                                child: Text('Cancel'))
                          ],
                        ),
                      ],
                    ),
                  );
                },
                icon: Icon(Icons.add)),
          ]),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : categories.isEmpty
              ? Column(
                  children: [
                    Image.asset(
                      'assets/icon/123.png',
                      height: 330.0,
                      width: 400.0,
                    ),
                    Text('No categories. Add a new one!'),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text('Click on  \' + \' to add.'),
                  ],
                )
              : ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (ctx, index) => Card(
                        child: ListTile(
                          title: Text(categories[index].name),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              deleteCategory(categories[index]);
                            },
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) =>
                                        Screen1(categories[index].name)));
                          },
                        ),
                      )),
    );
  }
}
