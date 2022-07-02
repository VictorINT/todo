import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:mysql1/mysql1.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class InsertPage extends StatefulWidget {
  const InsertPage({Key? key}) : super(key: key);

  @override
  State<InsertPage> createState() => _InsertPageState();
}

class _InsertPageState extends State<InsertPage> {

  final controllerTitle = TextEditingController();
  final controllerDescription = TextEditingController();

  // var settings = new ConnectionSettings(
  //     host: 'localhost',
  //     port: 3306,
  //     user: 'victor',
  //     password: 'password',
  //     db: 'todo'
  // );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(243, 243, 252, 1.0),
        appBar: AppBar(
            backgroundColor: const Color.fromRGBO(105, 94, 237, 1.0),
            elevation: 0,
        ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0))
          ),
          color: Color.fromRGBO(226, 226, 234, 1.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
                Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 40,
                        bottom: 30
                      ),
                      child: Text(
                          "Task",
                          style: TextStyle(
                            fontSize: 40
                          ),
                      ),
                    )
                ),
              Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      child: TextFormField(
                        controller: controllerTitle,
                        decoration: const InputDecoration(
                            icon: const Icon(Icons.title_rounded)
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 50
                      ),
                      child: TextFormField(
                        controller: controllerDescription,
                        decoration: const InputDecoration(
                            icon: const Icon(Icons.description_rounded)
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Center(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(105, 94, 237, 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    child: InkWell(
                      onTap: () async {
                        final response = await http.post(Uri.parse("http://192.168.1.154/site/todo/insert.php"), body: {
                          "title": controllerTitle.text,
                          "description": controllerDescription.text,
                        });
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("New Task added"),
                        ));
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Icon(
                          Icons.add,
                          size: 40,
                          color: Color.fromRGBO(243, 243, 252, 1.0),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
