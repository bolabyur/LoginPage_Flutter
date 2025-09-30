import 'package:get/get.dart';
import '../models/player.dart';

class FootballController extends GetxController {
 var players = <FootballModel>[
    FootballModel(
      image: "",
      name: "Bayu",
      nomorPunggung: 10,
      position: "Forward",
    ),
    FootballModel(
      image: "",
      name: "Player 2",
      nomorPunggung: 20,
      position: "Forward",
    ),
    FootballModel(
      image: "",
      name: "Player 3",
      nomorPunggung: 30,
      position: "Forward",
  )].obs;

  void updatePlayer(int index, FootballModel newPlayer) {
    players[index] = newPlayer;
  }

  void removePlayer(int index) {
    players.removeAt(index);
  }
}
