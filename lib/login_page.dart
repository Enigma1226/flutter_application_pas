import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/login_controller.dart';
import 'components/custom_text.dart';
import 'components/custom_textfield.dart';
import 'components/custom_button.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.restaurant_menu,
                  size: 80,
                  color: Colors.indigo,
                ),
                const SizedBox(height: 16),
                const CustomText(
                  text: 'Welcome',
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
                const SizedBox(height: 8),
                const CustomText(
                  text: 'Silakan login untuk melanjutkan',
                  fontSize: 14,
                  color: Colors.grey,
                ),
                const SizedBox(height: 40),
                CustomTextfield(
                  myHint: 'Username',
                  txtController: controller.usernameController,
                ),
                const SizedBox(height: 16),
                CustomTextfield(
                  myHint: 'Password',
                  txtController: controller.passwordController,
                  obscureText: true,
                ),
                const SizedBox(height: 32),
                Obx(() => controller.isLoading.value
                    ? const CircularProgressIndicator()
                    : CustomButton(
                        text: 'Login',
                        onPressed: () => controller.login(),
                        width: double.infinity,
                        height: 50,
                        backgroundColor: Colors.indigo,
                        foregroundColor: Colors.white,
                        borderRadius: 12,
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
