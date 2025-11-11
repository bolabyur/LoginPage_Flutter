import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/player.dart';

class FootballController extends GetxController {
  var players = <FootballModel>[
    FootballModel(
      image:
          "https://commons.wikimedia.org/wiki/File:Erling_Haaland_2023_%28cropped-v2%29.jpg",
      name: "Erling Haaland",
      nomorPunggung: 9,
      position: "Forward",
    ),
    FootballModel(
      image: "https://commons.wikimedia.org/wiki/File:Kevin_De_Bruyne_3493.JPG",
      name: "Kevin De Bruyne",
      nomorPunggung: 17,
      position: "Midfielder",
    ),
    FootballModel(
      image:
          "https://upload.wikimedia.org/wikipedia/commons/7/7e/Bukayo_Saka_with_Arsenal_2022_%28cropped%29.jpg",
      name: "Bukayo Saka",
      nomorPunggung: 7,
      position: "Forward",
    ),
    FootballModel(
      image:
          "https://upload.wikimedia.org/wikipedia/commons/3/3c/Mohamed_Salah_2018.jpg",
      name: "Mohamed Salah",
      nomorPunggung: 11,
      position: "Forward",
    ),
    FootballModel(
      image:
          "https://upload.wikimedia.org/wikipedia/commons/b/b1/Bruno_Fernandes_2022.jpg",
      name: "Bruno Fernandes",
      nomorPunggung: 8,
      position: "Midfielder",
    ),
    FootballModel(
      image:
          "https://upload.wikimedia.org/wikipedia/commons/6/6b/Heung-min_Son_2020.jpg",
      name: "Son Heung-min",
      nomorPunggung: 7,
      position: "Forward",
    ),
    FootballModel(
      image:
          "https://upload.wikimedia.org/wikipedia/commons/7/72/Marcus_Rashford_2019.jpg",
      name: "Marcus Rashford",
      nomorPunggung: 10,
      position: "Forward",
    ),
    FootballModel(
      image:
          "https://upload.wikimedia.org/wikipedia/commons/2/27/Declan_Rice_2021.jpg",
      name: "Declan Rice",
      nomorPunggung: 41,
      position: "Midfielder",
    ),
    FootballModel(
      image:
          "https://upload.wikimedia.org/wikipedia/commons/6/63/Virgil_van_Dijk_2022.jpg",
      name: "Virgil van Dijk",
      nomorPunggung: 4,
      position: "Defender",
    ),
    FootballModel(
      image:
          "https://upload.wikimedia.org/wikipedia/commons/e/e1/Gabriel_Martinelli_2022.jpg",
      name: "Gabriel Martinelli",
      nomorPunggung: 11,
      position: "Forward",
    ),
    FootballModel(
      image:
          "https://upload.wikimedia.org/wikipedia/commons/5/5e/Phil_Foden_2022.jpg",
      name: "Phil Foden",
      nomorPunggung: 47,
      position: "Midfielder",
    ),
    FootballModel(
      image:
          "https://upload.wikimedia.org/wikipedia/commons/4/45/James_Maddison_2021.jpg",
      name: "James Maddison",
      nomorPunggung: 10,
      position: "Midfielder",
    ),
    FootballModel(
      image:
          "https://upload.wikimedia.org/wikipedia/commons/8/84/Kai_Havertz_2022.jpg",
      name: "Kai Havertz",
      nomorPunggung: 29,
      position: "Forward",
    ),
    FootballModel(
      image:
          "https://upload.wikimedia.org/wikipedia/commons/5/5b/Ollie_Watkins_2021.jpg",
      name: "Ollie Watkins",
      nomorPunggung: 11,
      position: "Forward",
    ),
    FootballModel(
      image:
          "https://upload.wikimedia.org/wikipedia/commons/6/6b/Casemiro_2021.jpg",
      name: "Casemiro",
      nomorPunggung: 18,
      position: "Midfielder",
    ),
    FootballModel(
      image:
          "https://upload.wikimedia.org/wikipedia/commons/4/42/Kieran_Trippier_2021.jpg",
      name: "Kieran Trippier",
      nomorPunggung: 2,
      position: "Defender",
    ),
    FootballModel(
      image:
          "https://upload.wikimedia.org/wikipedia/commons/6/6a/Alisson_Becker_2018.jpg",
      name: "Alisson Becker",
      nomorPunggung: 1,
      position: "Goalkeeper",
    ),
    FootballModel(
      image:
          "https://upload.wikimedia.org/wikipedia/commons/9/95/William_Saliba_2023.jpg",
      name: "William Saliba",
      nomorPunggung: 2,
      position: "Defender",
    ),
    FootballModel(
      image:
          "https://upload.wikimedia.org/wikipedia/commons/f/f9/Cole_Palmer_2023.jpg",
      name: "Cole Palmer",
      nomorPunggung: 20,
      position: "Forward",
    ),
    FootballModel(
      image:
          "https://upload.wikimedia.org/wikipedia/commons/e/ef/Dominik_Szoboszlai_2023.jpg",
      name: "Dominik Szoboszlai",
      nomorPunggung: 8,
      position: "Midfielder",
    ),
  ].obs;

  void updatePlayer(int index, FootballModel newPlayer) {
    players[index] = newPlayer;
  }

  void removePlayer(int index) {
    players.removeAt(index);
  }

  var isMobile = true.obs;

  void updatelayouT(BoxConstraints constraints) {
    isMobile.value = constraints.maxWidth < 600;
  }
}
