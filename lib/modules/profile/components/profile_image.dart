import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:omniview/common/utils/size_config.dart';
import 'package:omniview/common/widgets/app_cached_network_image.dart';
import 'package:omniview/config/theme/app_colors.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key, required this.image, this.file});

  final String image;
  final String? file;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Center(
        child: Container(
          height: 100.heightMultiplier,
          width: 100.widthMultiplier,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.royalBlue, width: 2),
          ),
          child: ClipOval(
            child: file != null
                ? Image.file(File(file!), fit: BoxFit.cover)
                : AppCachedNetworkImage(imageUrl: image, iconSize: 80),
          ),
        ),
      ),
    );
  }
}
