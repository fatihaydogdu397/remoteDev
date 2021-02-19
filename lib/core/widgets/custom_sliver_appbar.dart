import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remotedev/controllers/auth/splash_controller.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final controller = Get.put(SplashController());
    var w = MediaQuery.of(context).size.width;
    return SliverAppBar(
                    floating: true,
                    expandedHeight: 220,
                    pinned: true,
                    collapsedHeight: 64,
                    flexibleSpace: Stack(
                      children: [
                        Image.asset(
                          "assets/remote.jpg",
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
                  );
  }
}