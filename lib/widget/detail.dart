import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Map<String,String> todoItem ;

  DetailPage({required this.todoItem});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Detail page',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Text(todoItem['name']!),
          Text(todoItem['desc']!),
          Text(todoItem['place']!),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: null, child: Text('Mark as read')),
              ElevatedButton(onPressed: null, child: Text('Delete item')),
            ],
          )
        ],
      ),
    );
  }
}
