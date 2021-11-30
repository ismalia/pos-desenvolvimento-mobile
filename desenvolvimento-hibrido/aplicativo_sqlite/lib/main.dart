import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() {
  runApp(MaterialApp(
    home: ListaTarefas(),
    debugShowCheckedModeBanner: false,)
  );
}

class ListaTarefas extends StatefulWidget {
  @override
  _ListaTarefasState createState() => _ListaTarefasState();
}

class _ListaTarefasState extends State<ListaTarefas> {
  List _tasks = [];
  final _newTaskController = TextEditingController();
  final List<int> _selectedOptions = [];

  @override
  void initState() {
    super.initState();
    _list();
  }

  @override
  void dispose() {
    _newTaskController.dispose();
    super.dispose();
  }

  _getDatabase() async {
    var databasePath = await getDatabasesPath();
    var databaseLocal = join(databasePath, "database.db");

    var database = await openDatabase(
      databaseLocal,
      version: 1,
      onCreate: (db, dbRecentVersion) {
        String sql = "CREATE TABLE tasks (id INTEGER PRIMARY KEY AUTOINCREMENT, name VARCHAR)";
        db.execute(sql);
      }
    );

    return database;
  }

  _save(String item) async {
    Database database = await _getDatabase();

    Map<String, dynamic> task = {
      "name": item
    };

    await database.insert("tasks", task);
  }

  _list() async {
    Database database = await _getDatabase();

    String sql = "SELECT * FROM tasks";
    List sqlResult = await database.rawQuery(sql);

    setState(() {
      _tasks = sqlResult.map((result) => result["name"]).toList();
    });
  }

  _delete(String item) async {
    Database database = await _getDatabase();
    
    await database.delete("tasks", where: "name = ?", whereArgs: [item]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Compras"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (context, int index) {
          return Row(
            children: [
              Checkbox(
                value: _selectedOptions.contains(index),
                onChanged: (bool value) {
                  setState(() {
                    if (_selectedOptions.contains(index)) {
                      _selectedOptions.remove(index);
                    } else {
                      _selectedOptions.add(index);
                    }
                  });
                }
              ),
              Text("${_tasks[index]}"),
              const Spacer(),
              IconButton(
                onPressed: () {
                  _delete("${_tasks[index]}");
                  _list();
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ],
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: const InputDecoration(
                        hintText: "Nova compra"
                      ),
                      controller: _newTaskController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _save(_newTaskController.text);
                        _newTaskController.clear();
                        Navigator.pop(context);
                        _list();
                      },
                      child: const Text("Adicionar"),
                    ),
                  ]
                ),
              );
            }
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}