import 'package:flutter/material.dart';

class CustomNotificationIcon extends StatelessWidget {
  const CustomNotificationIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Icon(Icons.notifications_outlined),
        Positioned(
          right: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(6),
            ),
            constraints: const BoxConstraints(
              minWidth: 12.0,
              minHeight: 12.0,
            ),
            child: const Text(
              '13',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
