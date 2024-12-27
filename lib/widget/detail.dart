import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Map<String, dynamic> todoItem;
  final dynamic itemIndex;

  DetailPage({required this.todoItem, required this.itemIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail page',
          style: TextStyle(color: Colors.white),
        ),
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
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context,itemIndex);
                  },
                  child: Text('Mark as read')),



              ElevatedButton(

                  onPressed: () {
                    Navigator.pop(context,todoItem);
                    print(todoItem);
                  },
                  child: Text('Delete item')),
            ],
          )
        ],
      ),
    );
  }
}
