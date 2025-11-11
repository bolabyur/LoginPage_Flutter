import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/football_controller.dart';
import '../../routes/routes.dart';

class FootballWidescreen extends StatelessWidget {
  final footballCtrl = Get.find<FootballController>();

  FootballWidescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1, // Biar kotak
        ),
        itemCount: footballCtrl.players.length,
        itemBuilder: (context, index) {
          final player = footballCtrl.players[index];
          return InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              Get.toNamed(
                AppRoutes.footballEditPage,
                arguments: index,
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 6, // shadow lebih tebal
              clipBehavior: Clip.antiAlias, // biar radius bekerja
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(player.image),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      player.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      // Semua isi terlihat
                    ),
                    Text(
                      player.position,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'No. Punggung: ${player.nomorPunggung}',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
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
