
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remotedev/controllers/auth/splash_controller.dart';
import 'package:remotedev/core/widgets/custom_sliver_appbar.dart';
import 'package:remotedev/core/widgets/job_list_item.dart';
import 'package:url_launcher/url_launcher.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SplashController());

    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Material(
            borderRadius: BorderRadius.circular(8),
            elevation: 1,
            color: Color.fromRGBO(9, 170, 65, 1),
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () async {
                if (await canLaunch("https://remoteok.io/hire-remotely?")) {
                  launch("https://remoteok.io/hire-remotely?");
                }
              },
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
                  CustomSliverAppBar(),
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
                ],
              ),
            );
          }),
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
