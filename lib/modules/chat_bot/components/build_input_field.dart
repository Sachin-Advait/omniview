import 'package:flutter/material.dart';
import 'package:omniview/common/utils/size_config.dart';
import 'package:omniview/config/theme/app_colors.dart';
import 'package:omniview/config/theme/app_theme.dart';

class BuildInputField extends StatefulWidget {
  const BuildInputField({super.key});

  @override
  State<BuildInputField> createState() => _BuildInputFieldState();
}

class _BuildInputFieldState extends State<BuildInputField> {
  final TextEditingController _controller = TextEditingController();
  bool hasText = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        hasText = _controller.text.trim().isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void sendMessage() {
    // Add your send logic here
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            textInputAction: TextInputAction.done,
            cursorColor: AppColors.white,
            controller: _controller,
            onSubmitted: (_) => hasText ? sendMessage() : null,
            style: context.medium,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              hintText: "Type Something...",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: AppColors.primary),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: AppColors.primary,
                  width: .8,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: AppColors.primary,
                  width: .8,
                ),
              ),
              fillColor: Theme.of(context).cardColor,
              filled: true,
              hintStyle: context.medium.copyWith(
                color: Theme.of(context).hintColor,
                fontSize: 14,
              ),
            ),
          ),
        ),
        10.horizontalSpace,
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) =>
              ScaleTransition(scale: animation, child: child),
          child: hasText
              ? _buildActionButton(
                  key: const ValueKey("send"),
                  icon: Icons.send,
                  onPressed: sendMessage,
                )
              : Row(
                  key: const ValueKey("mic_camera"),
                  children: [
                    _buildActionButton(
                      icon: Icons.camera_alt_outlined,
                      onPressed: () {},
                    ),
                    10.horizontalSpace,
                    _buildActionButton(
                      icon: Icons.mic_none_outlined,
                      onPressed: () {},
                    ),
                  ],
                ),
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required VoidCallback onPressed,
    Key? key,
  }) {
    return Container(
      key: key,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.primary),
      ),
      child: IconButton(
        icon: Icon(icon, color: Theme.of(context).canvasColor),
        onPressed: onPressed,
      ),
    );
  }
}
