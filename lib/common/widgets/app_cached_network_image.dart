import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:omniview/common/utils/size_config.dart';
import 'package:omniview/config/assets/app_images.dart';
import 'package:omniview/config/theme/app_colors.dart';

class AppCachedNetworkImage extends StatelessWidget {
  const AppCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.iconSize,
    this.isProfile,
  });
  final String imageUrl;
  final double? height;
  final double? width;
  final double? iconSize;
  final bool? isProfile;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fadeInDuration: Duration(milliseconds: 200),
      placeholder: (context, url) => isProfile == false
          ? Center(
              child: CircularProgressIndicator(
                color: AppColors.white,
                strokeWidth: 1.widthMultiplier,
              ),
            )
          : CircularProgressIndicator(
              color: AppColors.white,
              strokeWidth: 1.widthMultiplier,
            ),
      errorWidget: (context, url, error) => isProfile == false
          ? Icon(
              Icons.error,
              size: iconSize ?? 30.widthMultiplier,
              color: AppColors.white,
            )
          : Image.asset(AppImages.profilePlaceHolder, height: height),
      height: height,
      width: width,
      fit: BoxFit.cover,
    );
  }
}
