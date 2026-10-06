import 'dart:async';
import 'package:flutter/material.dart';

class SavingsScreen extends StatefulWidget {
  const SavingsScreen({super.key});

  @override
  State<SavingsScreen> createState() => _SavingsScreenState();
}

class _SavingsScreenState extends State<SavingsScreen> with SingleTickerProviderStateMixin {
  // Using BigInt to represent value with 9 decimal places precision.
  // The value is stored as: actual_value * 10^9
  static const int precision = 9;
  static final BigInt scale = BigInt.from(10).pow(precision);
  
  late BigInt _balance;
  late Timer _timer;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    // Starting balance: $1000.000000000
    _balance = BigInt.from(1000) * scale;
    
    // Accruing interest: every 50ms, add a small amount
    // Let's say we add 0.000000123 every tick
    _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      setState(() {
        _balance += BigInt.from(123); // Interest amount in micro-units
      });
    });

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _timer.cancel();
    _animationController.dispose();
    super.dispose();
  }

  String _formatBalance(BigInt balance) {
    String s = balance.toString();
    if (s.length <= precision) {
      s = s.padLeft(precision + 1, '0');
    }
    int splitAt = s.length - precision;
    String whole = s.substring(0, splitAt);
    String decimal = s.substring(splitAt);
    return '\$$whole.$decimal';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Savings'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline),
            onPressed: () => Navigator.pushNamed(context, '/profile'),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Transform.scale(
                  scale: 1.0 + (_animationController.value * 0.1),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Color(0xFFA3E4D7),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.savings, size: 100, color: Colors.white),
                  ),
                );
              },
            ),
            const SizedBox(height: 48),
            const Text(
              'Total Balance',
              style: TextStyle(fontSize: 18, color: Colors.black54),
            ),
            const SizedBox(height: 8),
            Text(
              _formatBalance(_balance),
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                fontFamily: 'Courier', // Using monospaced font for steady numbers
              ),
            ),
            const SizedBox(height: 48),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Your interest is growing in real-time!',
                textAlign: TextAlign.center,
                style: TextStyle(fontStyle: FontStyle.italic, color: Colors.purpleAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
