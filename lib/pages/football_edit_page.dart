import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/football_controller.dart';
import '../models/player.dart';
import '../widgets/CustomButton.dart';
import '../widgets/MyTextField.dart';

class EditPlayerPage extends StatelessWidget {
  final FootballController controller = Get.find();

  EditPlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final int index = Get.arguments as int;
    final player = controller.players[index];
    final nameController = TextEditingController(text: player.name);
    final positionController = TextEditingController(text: player.position);
    final imageUrlController = TextEditingController(text: player.imageUrl);

    return Scaffold(
      appBar: AppBar(title: const Text("Edit Player"), centerTitle: true, backgroundColor: Colors.blue),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Transform.scale(
          scale: 0.85,
          alignment: Alignment.topCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MyTextField(textEditingController: nameController, labelText: "Name"),
              const SizedBox(height: 12),
              MyTextField(textEditingController: positionController, labelText: "Position"),
              const SizedBox(height: 12),
              MyTextField(textEditingController: imageUrlController, labelText: "Image URL"),
              const SizedBox(height: 20),
              CustomButton(
                text: "Save Changes",
                textColor: Colors.white,
                background: Colors.blue,
                onPressed: () {
                  controller.updatePlayer(index, Player(
                    name: nameController.text,
                    position: positionController.text,
                    imageUrl: imageUrlController.text,
                  ));
                  Get.back();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
