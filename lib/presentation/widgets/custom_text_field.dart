import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onSubmitted;
  final FocusNode? focusNode;

  const CustomTextField({
    super.key,
    required this.controller,
    this.hintText = 'iMessage',
    this.suffixIcon,
    this.prefixIcon,
    this.onChanged,
    this.onSubmitted,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.backgroundLight,
        borderRadius: BorderRadius.circular(24.0),
        border: Border.all(
          color: const Color(0xFFC7C7CC),
          width: 1.0,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ?prefixIcon,
          Expanded(
            child: TextField(
              controller: controller,
              focusNode: focusNode,
              onChanged: onChanged,
              onSubmitted: (_) => onSubmitted?.call(),
              minLines: 1,
              maxLines: 1,
              textInputAction: TextInputAction.send,
              style: AppTheme.lightTheme.textTheme.bodyMedium,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: AppTheme.lightTheme.textTheme.bodyMedium?.copyWith(
                  color: const Color(0xFF8E8E93),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 10.0,
                ),
                border: InputBorder.none,
                isDense: true,
              ),
            ),
          ),
          ?suffixIcon,
        ],
      ),
    );
  }
}
