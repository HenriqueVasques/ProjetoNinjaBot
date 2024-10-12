import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNavIcon(Icons.home, 0),
              _buildNavIcon(Icons.devices_other, 1),
              SizedBox(width: 60),
              _buildNavIcon(Icons.settings, 2),
              _buildNavIcon(Icons.person, 3),
            ],
          ),
        ),
        Positioned(
          top: -30,
          child: _buildAddButton(),
        ),
      ],
    );
  }

  Widget _buildNavIcon(IconData icon, int index) {
    return IconButton(
      icon: Icon(icon, color: currentIndex == index ? Colors.white : Colors.white54),
      onPressed: () => onTap(index),
    );
  }

  Widget _buildAddButton() {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue,
      ),
      child: IconButton(
        icon: Icon(Icons.add, color: Colors.white, size: 30),
        onPressed: () {
          // TODO: Implementar ação para o botão de adicionar
        },
      ),
    );
  }
}