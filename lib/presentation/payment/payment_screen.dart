import 'package:flutter/material.dart';
import 'package:sodakku/utils/constant.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: whitecolor, title: const Text('Payment')),
    );
  }
}
