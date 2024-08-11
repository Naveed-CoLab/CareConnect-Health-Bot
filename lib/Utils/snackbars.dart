import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart'; // Import Iconsax package

class SnackbarUtils {
  static void showCustomSnackbar(BuildContext context, {required String message, required Color backgroundColor, required IconData icon}) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 10),
          Expanded(child: Text(message, style: const TextStyle(color: Colors.white))),
        ],
      ),
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      // Remove icon parameter from SnackBar as it's not directly supported in SnackBar
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void showThumbsUpSnackbar(BuildContext context) {
    showCustomSnackbar(
      context,
      message: 'Thank you for your feedback! We’re glad you liked it.',
      backgroundColor: const Color.fromRGBO(0, 129, 26, 1),
      icon: Iconsax.check, // Using Iconsax for thumbs up
    );
  }

  static void showThumbsDownSnackbar(BuildContext context) {
    showCustomSnackbar(
      context,
      message: 'We’re sorry to hear that. We’ll strive to improve.',
      backgroundColor:const Color(0xFFFE8715),
      icon: Iconsax.warning_2, // Using Iconsax for thumbs down
    );
  }

  static void showErrorSnackbar(BuildContext context) {
    showCustomSnackbar(
      context,
      message: 'An Unrecognized Error Occur, Our Engineers are working on it. Please try again after a while.',
      backgroundColor: Colors.red.shade400,
      icon: Iconsax.warning_21
    );
  }
}
