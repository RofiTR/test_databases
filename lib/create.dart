import 'package:flutter/material.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({Key? key}) : super(key:key);


  @override
  State<CreateScreen> createState() => _CreateScreenState ();
}
class _CreateScreenState extends State<CreateScreen> {
  TextEditingController nameController = TextEditingController()
  TextEditingController categoryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Create')),
      body: Column(
        children: [

        ],
      ),
    );
  }
}