import 'package:flutter/material.dart';
import 'package:todoapp/widget/add.dart';
import 'package:todoapp/widget/detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  dynamic _todos = [
    {
      'name': 'Navigation',
      'desc': 'Simple navigation, pass forward, pass backward data',
      'place': 'Meeting Room',
      'status' :false,
    },
    {
      'name': 'Lunch Break',
      'desc': '1h30 lunch break',
      'place': 'Own place',
      'status' :false,
    },
    {
      'name': 'ListView',
      'desc': 'Listview, ListTile, and Card',
      'place': 'Meeting Room',
      'status' :false,
    },
    {
      'name': 'Shared prferences',
      'desc': 'Save and retrive data',
      'place': 'Meeting Room',
      'status' :false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ToDo App',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            color: Colors.yellow,
            child: ListTile(
              title: Row(
                children: [
                  Text(_todos[index]['name']!),
                  Icon(_todos[index]['status'] ? Icons.check : null),
                ],
              ),
              subtitle: Text(_todos[index]['place']!),
              trailing: Icon(Icons.chevron_right),
              onTap: () async {
                var selectedItem = await Navigator.push(context, MaterialPageRoute(
                        builder: (context) => DetailPage(
                              todoItem: _todos[index],
                              itemIndex: index,
                            )));

                setState(() {
                  if(selectedItem is int){
                    _todos[index]['status'] = true;
                  }else{
                  _todos.remove(selectedItem);
                  }
                });
              },
              iconColor: Colors.red,
            ),
          );
        },
        itemCount: _todos.length,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () async {
          var item = await Navigator.push(context,
              MaterialPageRoute(builder: (context) {
            return AddPage();
          }));

          if (item != null) {
            setState(() {
              _todos.add(item);
            });
          }
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
