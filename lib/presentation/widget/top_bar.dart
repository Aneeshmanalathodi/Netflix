import 'package:flutter/material.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final Function(String) onSearchSubmitted;
  const TopBar({required this.onSearchSubmitted, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        children: [
          Expanded(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Search...',
                  hintStyle: TextStyle(color: Colors.white54),
                  prefixIcon: Icon(Icons.search, color: Colors.white54),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                ),
                style: const TextStyle(color: Colors.white),
                onSubmitted: onSearchSubmitted,
              ),
            ),
          ),
          const SizedBox(width: 16),
          const CircleAvatar(
            backgroundImage: AssetImage('assets/profile.jpg'), 
            radius: 18,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
