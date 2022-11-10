import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo List App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Iskele(),

    );
  }
}

class Iskele extends StatelessWidget {
  const Iskele({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Todo List App") ,),
      body: AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {
  const AnaEkran({Key? key}) : super(key: key);

  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {

  TextEditingController textEditingController = TextEditingController();
  List todoList = [];

  addComponent(){
    setState(() {
      todoList.add(textEditingController.text);
      textEditingController.clear();
    });
  }

  removeComponent(){
    setState(() {
      todoList.remove(textEditingController.text);
      textEditingController.clear();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text("Add your items to do.."),
          Flexible(
              child: ListView.builder(
                  itemCount: todoList.length,
                  itemBuilder: (context, indexNum ) => ListTile(
                    subtitle: Text("Market Items"),
                    title: Text(todoList[indexNum]),),
              )
          ),
          TextField(
            controller: textEditingController,
          ),
          ElevatedButton(
            onPressed: addComponent,
            child: Text("Add"),),
          ElevatedButton(
              onPressed: removeComponent,
              child: Text("Remove")),

        ],
      ),
    );
  }
}



