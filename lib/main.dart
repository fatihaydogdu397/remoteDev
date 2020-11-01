import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Image(
                        image: NetworkImage(
                            "https://www.bytagig.com/wp-content/uploads/2020/07/code-coding-computer-data-574071.jpg"),
                        fit: BoxFit.fitWidth,
                      ),
                      TextFormField(
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                          focusColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                                BorderSide(color: Colors.black, width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                                BorderSide(color: Colors.black, width: 1),
                          ),
                          hintText: 'Search Job',
                        ),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        JobCategories(),
                        JobCategories(),
                        JobCategories(),
                        JobCategories(),
                        JobCategories(),
                        JobCategories(),
                        JobCategories(),
                        JobCategories(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Center(
                        child: Text("New Jobs",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Comic-Sans"))),
                  ),
                  Column(
                    children: [
                      JobListItem(),
                      JobListItem(),
                      JobListItem(),
                      JobListItem(),
                      JobListItem(),
                      JobListItem(),
                      JobListItem(),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              top: 20,
              right: 20,
              child: FlatButton(
                height: 50,
                child: Text('Post a Job'),
                color: Colors.blueGrey,
                textColor: Colors.white,
                onPressed: () {},
              ),
            ),
            Positioned(
              top: 20,
              left: 20,
              child: Icon(
                Icons.menu,
                size: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//https://assets.hongkiat.com/uploads/psd-text-svg/logo-example.jpg

class JobCategories extends StatelessWidget {
  const JobCategories({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blueGrey[100],
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Icon(
                Icons.work,
                size: 20,
              ),
              Text(
                "REMOTE JOBS",
                style: TextStyle(fontSize: 10),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class JobListItem extends StatelessWidget {
  const JobListItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Container(
        color: Colors.indigoAccent[200],
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Image(
                image: NetworkImage(
                    "https://assets.hongkiat.com/uploads/psd-text-svg/logo-example.jpg"),
                fit: BoxFit.cover,
                width: 50,
                height: 50,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(3.0),
                  child: Text("Senior Developer",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: EdgeInsets.all(3.0),
                  child: Text("WORLDWIDE",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w300)),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white)),
                          child: Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Text(
                              "FRONT END",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white)),
                          child: Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Text(
                              "BACK END",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white)),
                          child: Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Text(
                              "APP",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white)),
                          child: Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Text(
                              "DEVOPS",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                    ),
                  ],
                )
              ],
            ),
            Container(),
            Container(),
            Container(),
            Container(),
            Column(
              children: [
                Text("5d",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.normal))
              ],
            )
          ],
        ),
      ),
    );
  }
}
