import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:get/get.dart';
import 'package:remotedev/controllers/auth/splash_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SplashController());
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
      body: GetBuilder<SplashController>(
          id: "page",
          builder: (snapshot) {
            return RefreshIndicator(
              color: Colors.white,
              backgroundColor: Colors.transparent,
              onRefresh: () async {
                await controller.getData(navigate: false);
              },
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    floating: true,
                    expandedHeight: 220,
                    pinned: true,
                    collapsedHeight: 64,
                    flexibleSpace: Stack(
                      children: [
                        Image.asset(
                          "/assets/remote.jpg",
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
                              'Remote Jobs',
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
                            onChanged: (String val) {
                              controller.search(val);
                            },
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 12,
                            ),
                            cursorColor: Colors.black,
                            placeholder: 'Search Position',
                            prefix: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Icon(Icons.search),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // SliverToBoxAdapter(
                  //   child: Container(
                  //     child: SingleChildScrollView(
                  //       scrollDirection: Axis.horizontal,
                  //       child: Row(
                  //         children: [
                  //           JobCategories(),
                  //           JobCategories(),
                  //           JobCategories(),
                  //           JobCategories(),
                  //           JobCategories(),
                  //           JobCategories(),
                  //           JobCategories(),
                  //           JobCategories(),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),

                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return JobListItem(
                        tags: controller.res.elementAt(index).tags,
                        logo: controller.res.elementAt(index).logo,
                        location: controller.res.elementAt(index).location,
                        position: controller.res.elementAt(index).position,
                        date: controller.res.elementAt(index).date,
                        description:
                            controller.res.elementAt(index).description,
                        url: controller.res.elementAt(index).url,
                      );
                    }, childCount: controller?.res?.length ?? 0 /* */),
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
          }),
    );
  }
}

class JobListItem extends StatelessWidget {
  final List<String> tags;
  final String logo;
  final String position;
  final String location;
  final String date;
  final String description;
  final String url;
  const JobListItem({
    Key key,
    this.tags = const [],
    this.logo,
    this.position,
    this.location,
    this.date,
    this.description,
    this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var b;
    try {
      var d = DateTime.now().difference(DateTime.parse(date));
      b = d.inDays;
    } catch (e) {}

    final controller = Get.put(SplashController());

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
                          '$position',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("$description"),
                        ),
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
                                onTap: () async {
                                  if (await canLaunch("$url")) {
                                    launch("$url");
                                  }
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
                  child: CachedNetworkImage(
                    imageUrl: '$logo',
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                    progressIndicatorBuilder: (context, url, progress) =>
                        CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Placeholder(
                      fallbackHeight: 50,
                      fallbackWidth: 50,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 100,
                        child: AutoSizeText(
                          "$position",
                          maxLines: 2,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "$location",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(height: 4),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
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
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        }).toList()),
                      )
                    ],
                  ),
                ),
                if (b != null)
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 5),
                        child: Text("$b d",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.normal)),
                      )
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

// class JobCategories extends StatelessWidget {
//   const JobCategories({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(8.0),
//       child: Container(
//         width: 72,
//         height: 72,
//         padding: EdgeInsets.all(12.0),
//         decoration: BoxDecoration(
//             color: Colors.blueGrey[100],
//             borderRadius: BorderRadius.circular(10)),
//         child: Center(
//           child: Column(
//             mainAxisSize: MainAxisSize.max,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(
//                 Icons.work,
//                 size: 20,
//               ),
//               SizedBox(height: 4),
//               Expanded(
//                 child: Text(
//                   "REMOTE JOBS",
//                   textAlign: TextAlign.center,
//                   maxLines: 2,
//                   overflow: TextOverflow.fade,
//                   style: TextStyle(fontSize: 10),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
