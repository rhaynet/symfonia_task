import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    Key? key,
    required this.icon,
    required this.color,
  }) : super(key: key);
  final Widget icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        icon,
        const SizedBox(height: 3.0,),
        CircleAvatar(
          radius: 3,
          backgroundColor: color,
        ),
      ],
    );
  }
}
