import 'package:flutter/material.dart';
import '../models/player.dart';

class PlayerTile extends StatelessWidget {
  final Player player;
  final VoidCallback? onTap;

  const PlayerTile({super.key, required this.player, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade300, width: 1), // border
      ),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundImage: NetworkImage(player.imageUrl),
        ),
        title: Text(player.name),
        subtitle: Text(player.position),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}
