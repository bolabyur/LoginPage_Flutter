import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testflutter/models/player.dart';

class FootballEditController extends GetxController {
  // Text controllers
  final TextEditingController name = TextEditingController();
  final TextEditingController position = TextEditingController();
  final TextEditingController nomorpunggung = TextEditingController();
  final TextEditingController imageUrl = TextEditingController();

  // Data pemain yang sedang diedit
  FootballModel? currentPlayer;

  /// 🔁 Load data dari player yang dipilih ke form edit
  void loadPlayer(FootballModel player) {
    currentPlayer = player;
    name.text = player.name;
    position.text = player.position;
    nomorpunggung.text = player.nomorPunggung.toString();
    imageUrl.text = player.image;
  }

  /// 💾 Simpan perubahan data pemain
  void save() {
    if (currentPlayer == null) {
      Get.snackbar("Error", "Tidak ada data pemain yang dimuat");
      return;
    }

    currentPlayer!
      ..name = name.text
      ..position = position.text
      ..nomorPunggung = int.tryParse(nomorpunggung.text) ?? 0
      ..image = imageUrl.text;

    // ✅ Kirim kembali ke halaman sebelumnya dengan data yang diperbarui
    Get.back(result: currentPlayer);

    // ✅ Notifikasi berhasil
    Get.snackbar(
      "Berhasil",
      "Data pemain berhasil diperbarui",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  @override
  void onClose() {
    name.dispose();
    position.dispose();
    nomorpunggung.dispose();
    imageUrl.dispose();
    super.onClose();
  }
}
