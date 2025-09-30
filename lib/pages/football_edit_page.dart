import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/football_edit_controller.dart';
import '../widgets/MyTextField.dart';

class FootballEditPage extends StatelessWidget {
  FootballEditPage({super.key});

  final editController = Get.find<FootballEditController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Player"),
      backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyTextField(
                textEditingController: editController.Name,
                labelText: "Name",
                icon: Icons.person,
              ),

              SizedBox(height: 10),
              MyTextField(
                textEditingController: editController.Position,
                labelText: "Position",
                icon: Icons.sports_soccer,
              ),

              SizedBox(height: 10),
              MyTextField(
                textEditingController: editController.NomorPunggung,
                labelText: "Nomor Punggung",
                icon: Icons.confirmation_number,
              ),

              SizedBox(height: 10),
              MyTextField(
                textEditingController: editController.ImageUrl,
                labelText: "Image URL",
                keyboardType: TextInputType.url,
                icon: Icons.image,
              ),

              SizedBox(height: 20),
              ElevatedButton(
                onPressed: editController.save,
                child: Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
