import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:omniview/common/utils/size_config.dart';
import 'package:omniview/config/assets/app_svg.dart';
import 'package:omniview/config/theme/app_colors.dart';
import 'package:omniview/config/theme/app_theme.dart';

class BuildAssistanceMessages extends StatelessWidget {
  const BuildAssistanceMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        10.verticalSpace,
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 2,
                    color: AppColors.white50.withValues(alpha: 0.2),
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: CircleAvatar(
                backgroundColor: AppColors.white,
                radius: 22.radiusMultipier,
                child: SvgPicture.asset(AppSvg.chatBot, height: 28),
              ),
            ),
            Spacer(),
            CustomGradientContainer(
              height: 50.heightMultiplier,
              width: 220.widthMultiplier,
              child: Row(
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 150.widthMultiplier),
                    child: Text(
                      'Hii, how can I assist you?',
                      maxLines: 3,
                      style: context.medium.copyWith(fontSize: 14),
                    ),
                  ),
                  5.horizontalSpace,
                  SvgPicture.asset(AppSvg.waveHands),
                ],
              ),
            ),
          ],
        ),
        40.verticalSpace,
        // if (isDealSummaryChat == false) ...[
        //   10.verticalSpace,

        //   /// Button Rows
        //   Row(
        //     mainAxisAlignment: MainAxisAlignment.end,
        //     children: [
        //       buildIconTextButton(
        //         text: 'Content For Property',
        //         icon: Image.asset(ImageAssets.mageLocationPin, scale: 4),
        //       ),
        //     ],
        //   ),

        //   10.verticalSpace,

        //   Row(
        //     mainAxisAlignment: MainAxisAlignment.end,
        //     children: [
        //       buildIconTextButton(
        //         text: 'Know More',
        //         icon: SvgPicture.asset(SvgAssets.headPhone),
        //       ),
        //       10.horizontalSpace,
        //       buildIconTextButton(
        //         text: 'Get brochure',
        //         icon: SvgPicture.asset(SvgAssets.tablerBook),
        //       ),
        //     ],
        //   ),

        //   10.verticalSpace,

        //   Row(
        //     mainAxisAlignment: MainAxisAlignment.end,
        //     children: [
        //       buildIconTextButton(
        //         text: 'Guide',
        //         icon: SvgPicture.asset(SvgAssets.lucidHouse),
        //       ),
        //       10.horizontalSpace,
        //       buildIconTextButton(
        //         text: 'Talk to agent',
        //         icon: SvgPicture.asset(SvgAssets.popHeadphone),
        //         onTap: () {},
        //       ),
        //     ],
        //   ),
        // ],
      ],
    );
  }
}

class CustomGradientContainer extends StatelessWidget {
  final Widget? child;
  final double? height;
  final double? width;

  const CustomGradientContainer({
    super.key,
    this.child,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      height: height,
      width: width,
      padding: EdgeInsets.symmetric(
        horizontal: 11.08.widthMultiplier,
        vertical: 6.5.heightMultiplier,
      ),
      decoration: BoxDecoration(
        color: AppColors.violet,
        borderRadius: BorderRadius.circular(30.radiusMultipier),
        border: Border.all(color: AppColors.white, width: 1.widthMultiplier),
      ),
      child: child,
    );
  }
}
