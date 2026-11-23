import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import "../models/login_model.dart";
import '../routes.dart';

class LoginController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  var isLoading = false.obs;

  Future<void> login () async {
    final username = usernameController.text.trim();
        final password = passwordController.text.trim();

        if (username.isEmpty || password.isEmpty) {
          Get.snackbar(
          'Peringatan',
          'Username & password tidak boleh kosong!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.orange,
          colorText: Colors.white,
          );
          return;
        }

        try{
          isLoading.value = true;

      final response = await http.post(
        Uri.parse('https://mediadwi.com/api/latihan/login'),
        body: {
          'username': username,
          'password': password,
        },
      );

      final loginModel = loginModelFromJson(response.body);

      if (loginModel.status == true) {
        Get.snackbar(
          'Sukses',
          loginModel.message,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        Get.offAllNamed(Routes.main_menu);
      } else {
        Get.snackbar(
          'Gagal',
          loginModel.message,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Terjadi kesalahan: $e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
