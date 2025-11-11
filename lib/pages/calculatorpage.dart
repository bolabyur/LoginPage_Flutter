import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/calculatorcontroller.dart';
import '../widgets/CustomButton.dart';
import '../widgets/mytextfield.dart';

class CalculatorPage extends StatelessWidget {
  CalculatorPage({super.key});
  final CalculatorController controller = Get.find<CalculatorController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Transform.scale(
          scale: 0.85,
          alignment: Alignment.topCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(
                () => Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      controller.hasil.value.isEmpty
                          ? "Hasil akan muncul di sini"
                          : "Hasil: ${controller.hasil.value}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              MyTextField(
                textEditingController: controller.txtAngka1,
                labelText: "Input Angka 1",
              ),
              const SizedBox(height: 12),
              MyTextField(
                textEditingController: controller.txtAngka2,
                labelText: "Input Angka 2",
              ),
              const SizedBox(height: 20),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  CustomButton(
                    text: "+",
                    textColor: Colors.white,
                    background: Colors.blue,
                    onPressed: controller.tambah,
                  ),
                  CustomButton(
                    text: "-",
                    textColor: Colors.white,
                    background: Colors.orange,
                    onPressed: controller.kurang,
                  ),
                  CustomButton(
                    text: "×",
                    textColor: Colors.white,
                    background: Colors.green,
                    onPressed: controller.kali,
                  ),
                  CustomButton(
                    text: "÷",
                    textColor: Colors.white,
                    background: Colors.red,
                    onPressed: controller.bagi,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: "Clear",
                textColor: Colors.white,
                background: Colors.grey,
                onPressed: controller.clear,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
