import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../models/player.dart';
import 'football_controller.dart';

class FootballEditController extends GetxController {

  late int index;
  final playerController = Get.find<FootballController>();

  final Name = TextEditingController();
  final Position = TextEditingController();
  final NomorPunggung= TextEditingController();
  final ImageUrl = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    index = Get.arguments as int;

    final player = playerController.players[index];
    Name.text = player.name;
    Position.text = player.position;
    NomorPunggung.text = player.nomorPunggung.toString();
    ImageUrl.text = player.image;
  }

// void setData(FootballModel player) {
//     Name.text = player.name;
//     Position.text = player.position;
//     NomorPunggung.text = player.nomorPunggung;
//   }

 void save() {
    playerController.updatePlayer(
      index,
      FootballModel(
        name: Name.text,
        position: Position.text,
        nomorPunggung: int.parse(NomorPunggung.text),
        image: playerController.players[index].image,
      ),
    );
    Get.back();
  }
}
