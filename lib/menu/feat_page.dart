import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/feat_controller.dart';
import '../widgets/team_card.dart';

class FeatPage extends StatelessWidget {
  FeatPage({super.key});

  final controller = Get.put(FeatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Premier League Teams'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.teams.isEmpty) {
          return const Center(child: Text('Data kosong'));
        }
        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: controller.teams.length,
          itemBuilder: (context, index) {
            final team = controller.teams[index];
            return TeamCard(team: team);
          },
        );
      }),
    );
  }
}