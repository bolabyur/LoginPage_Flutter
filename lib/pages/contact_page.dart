import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testflutter/controllers/contact_controller.dart';


class ContactPage extends StatelessWidget {
  ContactPage({super.key});

  final ContactController contactController = Get.find<ContactController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: contactController.nameController,
                    decoration: const InputDecoration(
                      hintText: "Input Name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: contactController.addName,
                  child: const Text("Save"),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // 📜 ListView dari database
            Expanded(
              child: Obx(() {
                final names = contactController.names;
                if (names.isEmpty) {
                  return const Center(
                    child: Text(
                      "Belum ada nama tersimpan",
                      style: TextStyle(color: Colors.grey),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: names.length,
                  itemBuilder: (context, index) {
                    final name = names[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 2,
                      child: ListTile(
                        title: Text(
                          name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
