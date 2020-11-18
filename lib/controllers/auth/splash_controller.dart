import 'dart:convert';

import 'package:remotedev/core/init/network_manager.dart';
import 'package:remotedev/models/remote_model.dart';
import 'package:remotedev/views/main_page.dart';
import 'package:get/get.dart';
import 'package:remotedev/core/constansts.dart';

class SplashController extends GetxController {
  bool _isLoading = true;
  bool _hasError = false;
  String _errorMessage = '';
  List<RemoteModel> _response = [];
  List<RemoteModel> _search = [];

  bool get isLoading => _isLoading;
  bool get hasError => _hasError;
  String get errorMsg => _errorMessage;
  List<RemoteModel> get res => _response ?? [];

  @override
  void onReady() async {
    getData();
    super.onReady();
  }



  Future<void> getData({bool navigate=true}) async {

    setLoading = true;
    setError = false;
    try {
      await NetworkManager.instance.dio.get('$API',).then((res) {
        List data = res.data;
        data.remove(data.first);
        data.forEach((element) {

          _response.add(RemoteModel.fromJson(element));
        });
        _search=_response;
        if (navigate) Get.offAll(MainPage());
      });
      // super.onReady();
    } catch (e, s) {
      print('$e, $s');
      _errorMessage = '$e';
      setError = true;
    }
    setLoading = false;
  }

void search(String query){
 _response= _search.where((element) => element.position.toString().toLowerCase().contains(query.toLowerCase())).toList();
 update(["page"]);
}
  set setLoading(bool val) {
    if (val == _isLoading) return;
    _isLoading = val;
    update(["page"]);
  }

  set setError(bool val) {
    if (val == _hasError) return;
    _hasError = val;
    update(["page"]);
  }

}
