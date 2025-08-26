import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/football_controller.dart';
import '../routes/routes.dart';
import '../models/player.dart'; // ✅ import Player model
import '../widgets/player_tile.dart'; // ✅ pakai PlayerTile

class FootballPage extends StatelessWidget {
  final FootballController controller = Get.put(FootballController());

  FootballPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Football Players",
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Obx(() {
        if (controller.players.isEmpty) {
          return const Center(child: Text("No players available"));
        }
        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: controller.players.length,
          itemBuilder: (context, index) {
            final Player player = controller.players[index]; // pakai Player
            return PlayerTile(
              player: player,
              onEdit: () {
                Get.toNamed(AppRoutes.footballEditPage, arguments: index);
              },
              onDelete: () => controller.removePlayer(index),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: () {
          Get.toNamed(AppRoutes.addPlayerPage);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
