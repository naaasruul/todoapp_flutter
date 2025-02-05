import 'package:flutter/material.dart';

class AddPage extends StatelessWidget {

  var nameEditingController = TextEditingController();
  var placeEditingController = TextEditingController();
  var descEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new item'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Text('Add new Item'),
          TextField(
            controller: nameEditingController,
            decoration: InputDecoration(hintText: 'Enter item name: '),
          ),
          TextField(
            controller: placeEditingController,
            decoration: InputDecoration(hintText: 'Enter item place: '),
          ),
          TextField(
            controller: descEditingController,
            decoration: InputDecoration(hintText: 'Enter item name: '),
          ),
          ElevatedButton(
              onPressed: () {
                print(nameEditingController.text);
                print(placeEditingController.text);
                print(descEditingController.text);

                // untuk pass dari sini ke page sebelum.
                var itemToPass = {
                  'name':nameEditingController.text,
                  'desc':descEditingController.text,
                  'place':placeEditingController.text,
                  'status':false,
                };
                Navigator.pop(context,itemToPass);
              },
              child: Text(
                'Add new item',
                style: TextStyle(color: Colors.black),
              ))
        ],
      ),
    );
  }
}
