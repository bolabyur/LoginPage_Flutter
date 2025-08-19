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
    imageUrl: "https://www.google.com/url?sa=i&url=https%3A%2F%2Ftranslate.google.com%2Ftranslate%3Fu%3Dhttps%3A%2F%2Fwww.forbes.com%2Fprofile%2Flionel-messi%2F%26hl%3Did%26sl%3Den%26tl%3Did%26client%3Dimgs&psig=AOvVaw0Ctxr8naYTg-0vh2dKvZqq&ust=1755654538825000&source=images&cd=vfe&opi=89978449&ved=0CBcQjRxqFwoTCOiC3vrglY8DFQAAAAAdAAAAABAf",
  ),
  Player(
    name: "Cristiano Ronaldo",
    position: "Forward",
    imageUrl: "https://upload.wikimedia.org/wikipedia/commons/3/3f/Cristiano_Ronaldo_2018.jpg",
  ),
];
