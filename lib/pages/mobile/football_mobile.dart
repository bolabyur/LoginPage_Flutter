import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/football_controller.dart';
import '../../../routes/routes.dart';

class FootballMobile extends StatelessWidget {
  final footballCtrl = Get.find<FootballController>();

  FootballMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: footballCtrl.players.length,
        itemBuilder: (context, index) {
          final player = footballCtrl.players[index];
          return GestureDetector(
            onTap: () {
              // Navigasi ke halaman edit dengan membawa index
              Get.toNamed(
                AppRoutes.footballEditPage,
                arguments: index,
              );
            },
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 3,
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                leading: CircleAvatar(
                  radius: 28,
                  backgroundImage: NetworkImage(player.image),
                ),
                title: Text(
                  player.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      player.position,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    Text(
                      'No. Punggung: ${player.nomorPunggung}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    });
  }
}
