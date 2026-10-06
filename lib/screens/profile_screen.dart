import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Profile')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xFFE6E6FA),
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 16),
            const Text(
              'Cutesy Saver',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text('saver@cutesy.com'),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement logout logic
                Navigator.pushReplacementNamed(context, '/');
              },
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFFD1DC)),
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
