import 'package:flutter/material.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';

class PasswordTile extends StatelessWidget {
  const PasswordTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: LabClinicasTheme.orangeColor),
      ),
      child: const Column(
        children: [
          Text(
            'fbewio',
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: LabClinicasTheme.blueColor),
          ),
          Text(
            'fbfewo',
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: LabClinicasTheme.orangeColor),
          ),
        ],
      ),
    );
  }
}
