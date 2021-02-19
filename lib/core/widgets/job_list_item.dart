import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:remotedev/controllers/auth/splash_controller.dart';
import 'package:url_launcher/url_launcher.dart';

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

    return Container(
      // decoration: BoxDecoration(border:Border.all(color:Colors.grey[400]),
      // borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(8),
        borderOnForeground: true,
        color: Colors.grey[100],
        elevation: 7,
        shadowColor: Colors.black,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {
            showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                )),
                builder: (context) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '$position',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Html(
                              data: """$description""",

                              // customRender: (node, children) {
                              //   if (node is dom.Element) {
                              //     switch (node.localName) {
                              //       case "custom_tag": // using this, you can handle custom tags in your HTML
                              //         return Column(children: children);
                              //     }
                              //   }
                              // },
                            ),
                            // Text("$description"),
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
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "$location",
                        style: TextStyle(
                            color: Colors.black,
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
                              border: Border.all(color: Colors.grey),
                            ),
                            padding: EdgeInsets.all(2.0),
                            child: Text(
                              "$e",
                              style: TextStyle(
                                color: Colors.black,
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
                                color: Colors.black,
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