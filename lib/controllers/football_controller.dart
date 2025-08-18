import 'package:get/get.dart';
import '../models/player.dart';

class FootballController extends GetxController {
  var players = <Player>[].obs;

  @override
  void onInit() {
    super.onInit();
    // contoh data awal
    players.addAll([
      Player(
        name: "Cristiano Ronaldo",
        position: "Forward",
        imageUrl: "https://upload.wikimedia.org/wikipedia/commons/8/8c/Cristiano_Ronaldo_2018.jpg",
      ),
      Player(
        name: "Lionel Messi",
        position: "Forward",
        imageUrl: "https://upload.wikimedia.org/wikipedia/commons/b/b8/Lionel_Messi_20180626.jpg",
      ),
    ]);
  }

  void addPlayer(Player player) {
    players.add(player);
  }

  void removePlayer(int index) {
    players.removeAt(index);
  }

  void updatePlayer(int index, Player updatedPlayer) {
    players[index] = updatedPlayer;
  }
}
