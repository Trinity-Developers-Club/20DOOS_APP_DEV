import 'package:flutter/material.dart';
import 'package:tasker/helpers/dbHelper.dart';
import 'package:tasker/models/taskModel.dart';
import 'package:tasker/widgets/taskCard.dart';

class Screen1 extends StatefulWidget {
  final String categoryName;
  const Screen1(this.categoryName);

  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  List<TaskModel> taskList = [];
  bool isLoading = true;

  void fetchData() async {
    taskList = await DBHelper.getTaskData(widget.categoryName);
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void deleteItem(TaskModel selectedElement) async {
    await DBHelper.deleteTask(selectedElement.id);
    fetchData();
  }

  void updatefavoriteStatusOfItem(TaskModel updatedElement) async {
    final currentStatus = taskList[taskList.indexOf(updatedElement)].isFavorite;
    var newStatus;
    if (currentStatus == 0) {
      newStatus = 1;
    } else {
      newStatus = 0;
    }
    await DBHelper.updateTask({
      'id': updatedElement.id,
      'name': updatedElement.name,
      'desc': updatedElement.desc ?? 'null',
      'isFavorite': newStatus,
      'categoryName': updatedElement.categoryName
    });
    fetchData();
  }

  void showNewTransactionSheet(BuildContext ctx) {
    var nametextFieldController = TextEditingController();
    var desctextFieldController = TextEditingController();

    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 10,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Add Task',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    controller: nametextFieldController,
                    decoration: InputDecoration(labelText: 'Name'),
                  ),
                  SizedBox(height: 5),
                  TextField(
                    controller: desctextFieldController,
                    decoration: InputDecoration(labelText: 'Description'),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () async {
                            var itemMap = {
                              'id': DateTime.now().toString(),
                              'name': nametextFieldController.text,
                              'desc': desctextFieldController.text,
                              'isFavorite': 0,
                              'categoryName': widget.categoryName
                            };
                            await DBHelper.insertTask('tasks_table', itemMap);

                            fetchData();

                            Navigator.of(ctx).pop();
                          },
                          child: Text('Add')),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(ctx).pop();
                          },
                          child: Text('Cancel'))
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.categoryName} tasks'),
        actions: [
          TextButton(
              onPressed: () async {
                await DBHelper.resetTasks(widget.categoryName);
                fetchData();
              },
              child: Text('Reset'),
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.white))),
        ],
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              height: MediaQuery.of(context).size.height,
              margin: const EdgeInsets.all(20),
              child: taskList.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('You don\'t have any tasks. Add some!'),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text('Click on  \' + \' to add.'),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: taskList.length,
                      itemBuilder: (ctx, index) => TaskCard(
                            taskItem: taskList[index],
                            deleteItem: deleteItem,
                            toggleFavoriteStatus: updatefavoriteStatusOfItem,
                            isFavoritesScreen: false,
                          ))),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showNewTransactionSheet(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
