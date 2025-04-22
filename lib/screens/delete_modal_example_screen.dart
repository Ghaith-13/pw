import 'package:flutter/material.dart';
import 'package:pw/widgets/alert_dialog.dart';
import 'package:pw/widgets/bottomSheets/ticket_setConfidence_sheet.dart';
import 'package:pw/widgets/error_alert.dart';
import 'package:pw/widgets/information_alert.dart';
import 'package:pw/widgets/message_alert.dart';
import 'package:pw/widgets/set_deadline_dialog.dart';
import 'package:pw/widgets/success_alert.dart';
import 'package:pw/widgets/warning_alert.dart';
import '../widgets/custom_modal_dialog.dart';

class DeleteModalExampleScreen extends StatelessWidget {
  const DeleteModalExampleScreen({Key? key}) : super(key: key);

  void _showDeleteDialog(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: MessageAlert(
          title: "Ticket Created Successfully!",
          description: "Test1234-5678",
          onClose: () {
            // Handle close
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Delete Modal Example',
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Center(
        child: ElevatedButton(

          onPressed: () => _showDeleteDialog(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF03A4AA),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            'Show Delete Modal',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
