import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculatorController extends GetxController {
  final txtAngka1 = TextEditingController();
  final txtAngka2 = TextEditingController();
  var hasil = ''.obs;

  /// Method bantu untuk parsing angka (menghindari error kosong/null)
  double _toDouble(String value) {
    if (value.isEmpty) return 0;
    return double.tryParse(value) ?? 0;
  }

  void tambah() {
    final angka1 = _toDouble(txtAngka1.text);
    final angka2 = _toDouble(txtAngka2.text);
    hasil.value = (angka1 + angka2).toString();
  }

  void kurang() {
    final angka1 = _toDouble(txtAngka1.text);
    final angka2 = _toDouble(txtAngka2.text);
    hasil.value = (angka1 - angka2).toString();
  }

  void kali() {
    final angka1 = _toDouble(txtAngka1.text);
    final angka2 = _toDouble(txtAngka2.text);
    hasil.value = (angka1 * angka2).toString();
  }

  void bagi() {
    final angka1 = _toDouble(txtAngka1.text);
    final angka2 = _toDouble(txtAngka2.text);
    if (angka2 == 0) {
      hasil.value = "∞"; // biar ga error divide by zero
    } else {
      hasil.value = (angka1 / angka2).toString();
    }
  }

  void clear() {
    txtAngka1.clear();
    txtAngka2.clear();
    hasil.value = '';
  }
}
