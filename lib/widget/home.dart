import 'package:flutter/material.dart';
import 'package:todoapp/widget/add.dart';
import 'package:todoapp/widget/detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _todos = [
    {
      'name': 'Navigation',
      'desc': 'Simple navigation, pass forward, pass backward data',
      'place': 'Meeting Room',
    },
    {
      'name': 'Lunch Break',
      'desc': '1h30 lunch break',
      'place': 'Own place',
    },
    {
      'name': 'ListView',
      'desc': 'Listview, ListTile, and Card',
      'place': 'Meeting Room',
    },
    {
      'name': 'Shared prferences',
      'desc': 'Save and retrive data',
      'place': 'Meeting Room',
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
              title: Text(_todos[index]['name']!),
              subtitle: Text(_todos[index]['place']!),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailPage(
                              todoItem: _todos[index],
                            )));
              },
            ),
          );
        },
        itemCount: _todos.length,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () async{
          var item = await Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddPage();
          }));

          if(item != null){
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
