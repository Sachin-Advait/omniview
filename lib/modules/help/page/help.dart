import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omniview/common/widgets/custom_appbar.dart';
import 'package:omniview/common/widgets/custom_text_fields.dart';
import 'package:omniview/common/widgets/purple_button.dart';
import 'package:omniview/config/assets/app_images.dart';
import 'package:omniview/config/theme/app_theme.dart';
import 'package:omniview/modules/help/components/help_list_tile.dart';

class HelpAndSupport extends StatelessWidget {
  const HelpAndSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Help Center', showBackButton: true),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 14, bottom: 3),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Contact Us',
                          textAlign: TextAlign.left,
                          style: context.bold.copyWith(fontSize: 16),
                        ),
                        const SizedBox(height: 13),
                        Text(
                          'Please get in touch and we will be happy help you',
                          style: context.medium.copyWith(
                            letterSpacing: .2,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // 10.heightMultiplier,
                  Image.asset(AppImages.helpCenterImage, width: 100),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              // width: Get.width,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  HelpTile(
                    icon: Icons.email,
                    title: 'Email',
                    subTitle: 'info@omniview.com',
                  ),
                  12.verticalSpace,
                  HelpTile(
                    icon: Icons.phone,
                    title: 'Phone',
                    subTitle: '+968 204244775',
                  ),
                  12.verticalSpace,
                  HelpTile(
                    icon: Icons.pin_drop,
                    title: 'Address',
                    subTitle: 'Oman',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Get in Touch',
                    style: context.bold.copyWith(fontSize: 16),
                  ),
                  10.verticalSpace,
                  Text(
                    'Have an inquiry or some feedback for us?\nFill out the form below to contact our team',
                    style: context.medium.copyWith(
                      letterSpacing: .2,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Full Name',
                      style: context.regular.copyWith(fontSize: 13),
                    ),
                  ),
                  5.verticalSpace,
                  UniversalTextField(
                    controller: TextEditingController(),
                    keyboardType: TextInputType.name,
                    hintText: 'Enter your name',
                    textCapitalization: TextCapitalization.characters,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Email Address',
                      style: context.regular.copyWith(fontSize: 13),
                    ),
                  ),
                  5.verticalSpace,
                  EmailTextField(controller: TextEditingController()),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Phone Number',
                      style: context.regular.copyWith(fontSize: 13),
                    ),
                  ),
                  5.verticalSpace,
                  PhoneTextField(
                    controller: TextEditingController(),
                    autofocus: false,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Message',
                      style: context.regular.copyWith(fontSize: 13),
                    ),
                  ),
                  8.verticalSpace,
                  UniversalTextField(
                    controller: TextEditingController(),
                    keyboardType: TextInputType.name,
                    hintText: 'Leave us message',
                    textCapitalization: TextCapitalization.characters,
                    maxLines: 4,
                  ),
                  PurpleButton(title: 'Send Message'),
                  10.verticalSpace,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
