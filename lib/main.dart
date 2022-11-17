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
      title: 'Shopping List App',
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
        title: Text("Shopping List App"),
      ),
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

  addComponent() {
    setState(() {
      todoList.add(textEditingController.text);
      textEditingController.clear();
    });
  }

  removeComponent() {
    setState(() {
      todoList.remove(textEditingController.text);
      textEditingController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/vegetabşe.jpeg"), fit: BoxFit.cover)),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text("Add your items to buy.."),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: TextField(
              controller: textEditingController,
            ),
          ),
          Flexible(
              child: ListView.builder(
            itemCount: todoList.length,
            itemBuilder: (context, indexNum) => ListTile(
              subtitle: Text("Market Items"),
              title: Text(todoList[indexNum]),
            ),
          )),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: SizedBox(
                width: 100.0,
                height: 40.0,
                child: ElevatedButton(
                    onPressed: addComponent, child: Text("Add"))),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              width: 100.0,
              height: 40.0,
              child: ElevatedButton(
                  onPressed: removeComponent, child: Text("Remove")),
            ),
          ),
        ],
      ),
    );
  }
}
