import 'package:flutter/material.dart';
import 'package:todo/insert.dart';
import 'httpd/http_service.dart';
import 'httpd/post_module.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var dayData = ["", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];
  var monthData = ["", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
  DateTime now = DateTime.now();
  final HttpService httpService = HttpService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          color: const Color.fromRGBO(105, 94, 237, 1.0),
          shape: const CircularNotchedRectangle(),
          elevation: 0,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(icon: const Icon(Icons.home_outlined, size: 30, color: Color.fromRGBO(243, 243, 252, 1.0),), onPressed: () {}),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    icon: const Icon(
                      Icons.search,
                        size: 30,
                        color: Color.fromRGBO(243, 243, 252, 1.0)
                    )
                    , onPressed: () {}
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(icon: const Icon(Icons.archive, size: 30, color: Color.fromRGBO(243, 243, 252, 1.0)), onPressed: () {}),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromRGBO(105, 94, 237, 1.0),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const InsertPage()),
              );
            },
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50.0))
            ),
            child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: SafeArea(
          child: Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(243, 243, 252, 1.0)
              ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 25,
                        horizontal: 25
                      ),
                      child: Row(
                        children: [
                          Text(
                              dayData.elementAt(now.weekday),
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold
                              ),
                          ),
                          Text(
                            ", ${now.day}",
                            style: const TextStyle(
                                fontSize: 25
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 25,
                        horizontal: 25
                      ),
                      child: Text(
                          monthData.elementAt(now.month).toString(),
                          style: const TextStyle(
                              fontSize: 25
                          ),
                      ),
                    )
                  ],
                ),
                FutureBuilder(
                  future: httpService.getPosts(),
                  builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
                    if (snapshot.hasData) {
                      List<Post>? posts = snapshot.data;

                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 25
                          ),
                          child: ListView(
                            children: posts!
                                .map((Post post) => Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(

                              decoration: const BoxDecoration(
                                  color: Color.fromRGBO(226, 226, 234, 1.0),
                                    borderRadius: BorderRadius.all(Radius.circular(15.0))
                              ),
                                    child: ListTile(
                              title: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 15,
                                    horizontal: 20
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              post.Title,
                                            style: TextStyle(
                                              fontSize: 30
                                            ),
                                          ),
                                          IconButton(
                                              onPressed: (){
                                                // if(post.Completed == "0")
                                                //     post.Completed = "1";
                                                // else
                                                //   post.Completed = "0";
                                              },
                                              icon: (post.Completed == "0") ? Icon(Icons.check_box_outline_blank_rounded) : Icon(Icons.check_box)
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 15,
                                          horizontal: 10
                                        ),
                                        child: Container(
                                          height: 3,
                                          decoration: BoxDecoration(
                                            color: Color.fromRGBO(105, 94, 237, 1.0)
                                          ),
                                        ),
                                      ),
                                      Text(
                                        post.Description,
                                        style: TextStyle(
                                            fontSize: 25
                                        ),
                                      )
                                    ],
                                  ),
                              ),
                              onTap: (){},
                            ),
                                  ),
                                ))
                                .toList(),
                          ),
                        ),
                      );
                    }
                    return CircularProgressIndicator();
                  },
                ),
              ],
            ),
          ),
        ),
    );
  }
}
