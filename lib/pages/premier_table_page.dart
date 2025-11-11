import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:testflutter/controllers/premiere_table_controller.dart';

class PremiereTablePage extends StatelessWidget {
  PremiereTablePage({super.key});

  final controller = Get.find<PremiereTableController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Premier League Table"), backgroundColor: Colors.blue,),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }
          return RefreshIndicator(
            onRefresh: () {
              return controller.fetchPremierTable();
            },
            child: ListView.builder(
              itemCount: controller.standings.length,
              itemBuilder: (context, index) {
                final team = controller.standings[index];
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 6,
                      horizontal: 8,
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      leading: CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.grey[200],
                        backgroundImage: NetworkImage(team.strBadge),
                      ),
                      title: Text(
                        "#${team.intRank}. ${team.strTeam}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          "Played: ${team.intPlayed}   W: ${team.intWin}   D: ${team.intDraw}   L: ${team.intLoss}",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[700],
                            height: 1.3,
                          ),
                        ),
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            team.intPoints.toString(),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                          const SizedBox(height: 2),
                          const Text(
                            "pts",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
