import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/football_controller.dart';
import '../widgets/player_tile.dart';
import '../routes/routes.dart';
import '../widgets/CustomButton.dart';

class FootballPage extends StatelessWidget {
  final FootballController controller = Get.put(FootballController());

  FootballPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Football Players"), centerTitle: true, backgroundColor: Colors.blue),
      body: Obx(() {
        if (controller.players.isEmpty) {
          return const Center(child: Text("No players available", style: TextStyle(fontSize: 16)));
        }
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Transform.scale(
            scale: 0.85,
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                ...List.generate(controller.players.length, (index) {
                  final player = controller.players[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      child: Dismissible(
                        key: ValueKey(player.name),
                        background: Container(color: Colors.red),
                        onDismissed: (_) => controller.removePlayer(index),
                        child: PlayerTile(
                          player: player,
                          onTap: () => Get.toNamed(AppRoutes.footballEditPage, arguments: index),
                        ),
                      ),
                    ),
                  );
                }),
                const SizedBox(height: 12),
                CustomButton(
                  text: "Add Player",
                  textColor: Colors.white,
                  background: Colors.purple,
                  onPressed: () => Get.toNamed(AppRoutes.addPlayerPage),
                ),
                const SizedBox(height: 12),
                CustomButton(
                  text: "Back to Calculator",
                  textColor: Colors.white,
                  background: Colors.blue,
                  onPressed: () => Get.back(),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
