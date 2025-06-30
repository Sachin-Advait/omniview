import 'package:flutter/material.dart';
import 'package:omniview/common/utils/size_config.dart';
import 'package:omniview/config/theme/app_colors.dart';
import 'package:omniview/config/theme/app_theme.dart';

class BuildInputField extends StatelessWidget {
  const BuildInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.widthMultiplier,
        vertical: 10.heightMultiplier,
      ),
      color: AppColors.primary,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              textInputAction: TextInputAction.done,
              cursorColor: AppColors.white,
              onChanged: (value) {},
              onSubmitted: (value) {},
              controller: TextEditingController(),
              style: context.medium,
              decoration: InputDecoration(
                hintText: "Ask Anything",
                border: InputBorder.none,
                hintStyle: context.medium.copyWith(
                  color: AppColors.white75,
                  fontSize: 14,
                ),
              ),
            ),
          ),

          // todo not implemented right now

          // Obx(
          //   () => Visibility(
          //     visible: controller.showEmojiButton.value,
          //     child: IconButton(
          //       icon: Icon(
          //         Icons.emoji_emotions_outlined,
          //         color: AppColors.white75,
          //       ),
          //       onPressed: () {},
          //     ),
          //   ),
          // ),
          // Obx(
          //   () => Transform.rotate(
          //     angle: 3.14 / 4,
          //     child: Visibility(
          //       visible: controller.showAttachmentButton.value,
          //       child: IconButton(
          //         icon: Icon(Icons.attach_file, color: AppColors.white75),
          //         onPressed: () {},
          //       ),
          //     ),
          //   ),
          // ),
          Transform.rotate(
            angle: -3.14 / 4,
            child: IconButton(
              icon: Icon(Icons.send_outlined, color: AppColors.white75),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
