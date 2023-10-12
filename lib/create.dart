import 'package:flutter/material.dart';
import 'package:test_databases/database_instance.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({Key? key}) : super(key:key);


  @override
  State<CreateScreen> createState() => _CreateScreenState ();
}
class _CreateScreenState extends State<CreateScreen> {
  DatabaseInstance databaseInstance = DatabaseInstance();
  TextEditingController nameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  @override
  void initState() {
    databaseInstance.database();
    super.initState();  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Create')),
      body: Padding(padding: const EdgeInsets.all(8.0),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Nama Produk'),
          TextField(
            controller: nameController,
          ),
          SizedBox(
            height: 15,
          ),
          Text('Kategori'),
          TextField(
          controller: categoryController,),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
            onPressed: ()async{ 
            await databaseInstance.insert({
              'nama' : nameController.text,
              'category' : categoryController.text,
              'created_at' : DateTime.now ().toString(),
              'update_at' : DateTime.now ().toString(),
            }
            );
            Navigator.pop(context);
          }, child: Text ('Submit'))
        ],
      ))
    );
  }
}