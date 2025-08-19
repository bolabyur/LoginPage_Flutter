import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/football_controller.dart';
import '../models/player.dart';
import '../widgets/CustomButton.dart';
import '../widgets/MyTextField.dart';

class AddPlayerPage extends StatelessWidget {
  final FootballController controller = Get.find<FootballController>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController positionController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();

  AddPlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Player"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            MyTextField(
              textEditingController: nameController,
              labelText: "Player Name",
            ),
            const SizedBox(height: 12),
            MyTextField(
              textEditingController: positionController,
              labelText: "Position",
            ),
            const SizedBox(height: 12),
            MyTextField(
              textEditingController: imageUrlController,
              labelText: "Image URL",
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: "Save Player",
              textColor: Colors.white,
              background: Colors.blue,
              onPressed: () {
                if (nameController.text.isNotEmpty &&
                    positionController.text.isNotEmpty &&
                    imageUrlController.text.isNotEmpty) {
                  controller.addPlayer(Player(
                    name: nameController.text,
                    position: positionController.text,
                    imageUrl: imageUrlController.text,
                  ));
                  Get.back();
                } else {
                  Get.snackbar("Error", "Please fill all fields",
                      backgroundColor: Colors.red, colorText: Colors.white);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
