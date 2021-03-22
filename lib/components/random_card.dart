import 'package:flutter/material.dart';

class RandomCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  RandomCard(this.title, this.icon, this.color);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.0),
      ),
      elevation: 4,
      shadowColor: Colors.black26,
      child: Container(
        height: 140,
        width: 290,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, size: 30, color: color),
            SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
