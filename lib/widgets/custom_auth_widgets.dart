import 'package:flutter/material.dart';
import 'package:move_app/core/utils/colors.dart';

// Your existing CustomTextFormField and CustomPrimaryButton widgets go here...
// ... (omitted for brevity, no changes needed to them)

// New Widget for Social Logins
class CustomSocialButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String iconPath;
  final String text;

  const CustomSocialButton({
    super.key,
    required this.onPressed,
    required this.iconPath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 14),
        side: BorderSide(color: AppColors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(iconPath, height: 24, width: 24),
          const SizedBox(width: 12),
          Text(
            text,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
// Existing CustomTextFormField and CustomPrimaryButton code below...