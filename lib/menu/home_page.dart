import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/list_makanan_controller.dart';
import '../widgets/makanan_card.dart';
import '../components/custom_text.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controller = Get.put(ListMakananController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Katalog Makanan'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Obx(() {
        if (controller.makananList.isEmpty) {
          return const Center(
              child: CustomText(text: 'Tidak ada data makanan'));
        }
        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: controller.makananList.length,
          itemBuilder: (context, index) {
            final makanan = controller.makananList[index];
            return MakananCard(makanan: makanan);
          },
        );
      }),
    );
  }
}
