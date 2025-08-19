import 'package:get/get.dart';
import '../models/player.dart';

class FootballController extends GetxController {
  var players = <Player>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Contoh data awal
    players.addAll([
      Player(
          name: "Cristiano Ronaldo",
          position: "Forward",
          imageUrl:
              "https://upload.wikimedia.org/wikipedia/commons/8/8c/Cristiano_Ronaldo_2018.jpg"),
      Player(
          name: "Lionel Messi",
          position: "Forward",
          imageUrl:
              "https://imageio.forbes.com/specials-images/imageserve/663e595b4509f97fdafb95f5/0x0.jpg?format=jpg&crop=383,383,x1045,y23,safe&height=416&width=416&fit=bounds"),
    ]);
  }

  void addPlayer(Player player) => players.add(player);

  void updatePlayer(int index, Player player) => players[index] = player;

  void removePlayer(int index) => players.removeAt(index);
}
