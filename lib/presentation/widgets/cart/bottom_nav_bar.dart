// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartBottomNavBar extends StatelessWidget {
  const CartBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: const Offset(0, -3),
            blurRadius: 4,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem('Sodakku', Icons.home_outlined, true),
          _buildNavItem('Categories', Icons.grid_view, false),
          _buildNavItem('Cart', Icons.shopping_cart_outlined, false),
        ],
      ),
    );
  }

  Widget _buildNavItem(String label, IconData icon, bool isActive) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: const Color(0xFF034703).withOpacity(0.75), size: 24),
        const SizedBox(height: 3),
        Text(
          label,
          style: GoogleFonts.poppins(
            color: const Color(0xFF034703).withOpacity(0.75),
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}
