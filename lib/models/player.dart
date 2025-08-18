class Player {
  final String name;
  final String position;
  final String imageUrl;

  Player({
    required this.name,
    required this.position,
    required this.imageUrl,
  });
}

// Tambahin data default supaya tidak error
final List<Player> defaultPlayers = [
  Player(
    name: "Lionel Messi",
    position: "Forward",
    imageUrl: "https://upload.wikimedia.org/wikipedia/commons/8/89/Lionel_Messi_WC2022.jpg",
  ),
  Player(
    name: "Cristiano Ronaldo",
    position: "Forward",
    imageUrl: "https://upload.wikimedia.org/wikipedia/commons/3/3f/Cristiano_Ronaldo_2018.jpg",
  ),
];
