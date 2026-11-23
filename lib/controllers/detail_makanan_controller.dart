import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/makanan_model.dart';

class DetailMakananController extends GetxController{
  final jumlahController = TextEditingController();

  late MakananModel makanan;

  var subtotal = 0.0.obs;
  var ppn = 0.0.obs;
  var totalBayar = 0.0.obs;
  var sudahDihitung = false.obs;

  @override
  void onInit () {
    super.onInit();
    makanan = Get.arguments as MakananModel; 
  }

  void hitungPembayaran() {
    final jumlah = int.tryParse(jumlahController.text.trim()) ?? 0;

    if (jumlah <= 0 ){
      Get.snackbar(
        'Peringatan',
        'Jumlah makanan tidak boleh 0!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
      return;
    }
    subtotal.value = makanan.harga * jumlah.toDouble();
    ppn.value = subtotal.value * 0.05;
    totalBayar.value = subtotal.value + ppn.value;
    sudahDihitung.value = true;
  }

  @override
  void onClose() {
    jumlahController.dispose();
    super.onClose();
  }
}