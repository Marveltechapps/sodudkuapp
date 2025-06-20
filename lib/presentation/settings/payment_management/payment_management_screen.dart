import 'package:flutter/material.dart';
import 'package:sodakku/utils/constant.dart';

class PaymentManagementScreen extends StatelessWidget {
  const PaymentManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whitecolor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new, size: 16),
        ),
        elevation: 0,
        title: Text("Payment Management"),
      ),
    );
  }
}
