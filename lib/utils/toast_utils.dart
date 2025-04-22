import 'package:flutter/material.dart';
import '../widgets/message_alert.dart';

class ToastUtils {
  static OverlayEntry? _currentToast;

  static void showMessageToast(
    BuildContext context, {
    required String title,
    String? description,
    Duration duration = const Duration(seconds: 3),
  }) {
    _currentToast?.remove();

    final overlay = Overlay.of(context);
    _currentToast = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top + 16,
        left: 16,
        right: 16,
        child: Material(
          color: Colors.transparent,
          child: Center(
            child: MessageAlert(
              title: title,
              description: description,
              onClose: () {
                _currentToast?.remove();
                _currentToast = null;
              },
            ),
          ),
        ),
      ),
    );

    overlay.insert(_currentToast!);

    Future.delayed(duration, () {
      if (_currentToast?.mounted == true) {
        _currentToast?.remove();
        _currentToast = null;
      }
    });
  }
}
