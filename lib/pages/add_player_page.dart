import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/football_controller.dart';
import '../models/player.dart';
import '../widgets/CustomButton.dart';
import '../widgets/MyTextField.dart';

class AddPlayerPage extends StatelessWidget {
  final FootballController controller = Get.find();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController positionController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();

  AddPlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Player"), centerTitle: true, backgroundColor: Colors.blue),
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
                text: "Save",
                textColor: Colors.white,
                background: Colors.blue,
                onPressed: () {
                  if (nameController.text.isEmpty || positionController.text.isEmpty || imageUrlController.text.isEmpty) {
                    Get.snackbar('Error', 'Harap lengkapi semua field', backgroundColor: Colors.red, colorText: Colors.white);
                    return;
                  }
                  controller.addPlayer(Player(
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
