import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test_databases/create.dart';
import 'package:test_databases/database_instance.dart';
import 'package:test_databases/product_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DatabaseInstance databaseInstance = DatabaseInstance();


Future _refresh() async{
  setState(() {
    
  });
}

  void _initState() {
    databaseInstance.database();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Simple App'), actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (builder) {
                  return CreateScreen();
                }));
              },
              icon: Icon(Icons.add))
        ]),
        body: RefreshIndicator(
          onRefresh: _refresh,
          child: FutureBuilder<List<ProductModel>>(
              future: databaseInstance.all(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.length == 0) {
                    return Center(
                      child: Text('data masih kosong.'),
                    );
                  }
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(snapshot.data![index].name ?? ''),
                        subtitle: Text(snapshot.data![index].category ?? ''),
                      
                      );
                    },
                  );
                } else {
                  return Center(
                      child: CircularProgressIndicator(color: Colors.green));
                }
              }),
        ));
  }
}
