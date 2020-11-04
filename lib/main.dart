import 'package:flutter/cupertino.dart';
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
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Material(
            borderRadius: BorderRadius.circular(8),
            elevation: 12,
            color: Color.fromRGBO(9, 170, 65, 1),
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                height: 48,
                child: Center(
                  child: Text(
                    'Post a job',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            expandedHeight: 220,
            pinned: true,
            collapsedHeight: 64,
            flexibleSpace: Stack(
              children: [
                Image.network(
                  'https://www.bytagig.com/wp-content/uploads/2020/07/code-coding-computer-data-574071.jpg',
                  fit: BoxFit.fitWidth,
                  width: w,
                ),
                Positioned(
                  bottom: 120,
                  left: 24,
                  right: 24,
                  child: Container(
                    child: Center(
                        child: Text(
                      'Jobs',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                Positioned(
                  bottom: 18,
                  left: 24,
                  right: 24,
                  child: CupertinoTextField(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 12,
                    ),
                    cursorColor: Colors.black,
                    placeholder: 'Search Job',
                    prefix: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Icon(Icons.search),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              child: SingleChildScrollView(
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
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, i) {
              return JobListItem();
            }, childCount: 12),
          ),
          /*  SliverFillRemaining(
            child: Container(
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                 
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        "New Jobs",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Comic-Sans"),
                      ),
                    ),
                    Column(
                      children: [
                        JobListItem(
                          tags: ['Frontend', 'Devops'],
                        ),
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
            ),
          ),
       */
        ],
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
        width: 72,
        height: 72,
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
            color: Colors.blueGrey[100],
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.work,
                size: 20,
              ),
              SizedBox(height: 4),
              Expanded(
                child: Text(
                  "REMOTE JOBS",
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.fade,
                  style: TextStyle(fontSize: 10),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class JobListItem extends StatelessWidget {
  final List<String> tags;

  const JobListItem({Key key, this.tags = const []}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(4),
        color: Colors.blueGrey.shade400,
        elevation: 4,
        shadowColor: Colors.black,
        child: InkWell(
          borderRadius: BorderRadius.circular(4),
          onTap: () {
            showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                )),
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Başlık',
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.left,
                        ),
                        Text('Bişeyler...'),
                        SizedBox(
                          height: 12,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Material(
                              borderRadius: BorderRadius.circular(12),
                              color: Color.fromRGBO(9, 170, 65, 1),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(12),
                                onTap: () {},
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 16, horizontal: 12),
                                  child: Center(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          Icons.check,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          'Apply Now',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Material(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey.shade300,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(12),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 16, horizontal: 12),
                                  child: Center(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          Icons.close,
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          'Cancel',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                });
          },
          child: Container(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                    Text(
                      "Senior Developer",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "WORLDWIDE",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w300),
                    ),
                    SizedBox(height: 4),
                    Row(
                        children: tags.map((e) {
                      return Container(
                        margin: EdgeInsets.only(right: 4),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                        ),
                        padding: EdgeInsets.all(2.0),
                        child: Text(
                          "$e",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }).toList())
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
        ),
      ),
    );
  }
}
