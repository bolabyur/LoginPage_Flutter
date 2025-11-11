import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:testflutter/models/table_model.dart';

class PremiereTableController extends GetxController{
  var isLoading = false.obs;
  var standings = <Table>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchPremierTable();
  } 

  fetchPremierTable() async{
    const url = "https://www.thesportsdb.com/api/v1/json/3/lookuptable.php?l=4328&s=2025-2026";
    try {
        isLoading(true);
        final response = await http.get(Uri.parse(url));
        print("status code: ${response.statusCode}");
        print("json result: ${response.body}");
        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          final List standingsData = data['table'];
          standings.assignAll(standingsData.map((e) => Table.fromJson(e)).toList());
          //mengisi variabel standings dari data model standingsData (json)
        }
        else {
          Get.snackbar("Failed", "failed loading data");
        }
    } catch (e) {
        // ketika ngecrash di tangkap di catch lalu diubah jadi warning
        Get.snackbar("error", e.toString());
    }
    isLoading(false);
  }
}