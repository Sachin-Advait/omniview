import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:omniview/common/utils/size_config.dart';
import 'package:omniview/common/widgets/custom_appbar.dart';
import 'package:omniview/common/widgets/custom_text_fields.dart';
import 'package:omniview/common/widgets/purple_button.dart';
import 'package:omniview/config/theme/app_colors.dart';
import 'package:omniview/config/theme/app_theme.dart';
import 'package:omniview/data/models/user_model.dart';
import 'package:omniview/modules/profile/components/profile_image.dart';

class Profile extends StatefulWidget {
  const Profile({super.key, required this.user});

  final UserModel user;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? profileImage;

  /// Return the path of picked image from Gallery or Photo Library.
  Future<String?> getGalleryPermissionAndPickImage() async {
    // PermissionStatus status;

    // if (Platform.isAndroid) {
    //   final androidInfo = await DeviceInfoPlugin().androidInfo;
    //   androidInfo.version.sdkInt <= 32
    //       ? status = await Permission.storage.request()
    //       : status = await Permission.photos.request();
    // } else {
    //   status = await Permission.photos.request();
    // }

    // if (Platform.isAndroid) {
    //   status = await Permission.photos.request();
    // } else {
    //   status = await Permission.photos.request();
    // }
    // if (status.isDenied) {
    //   return null;
    // }

    // if (status.isPermanentlyDenied) {
    //   await permissionPopup('Photos');
    //   return null;
    // }

    // if (status.isGranted) {
    FocusManager.instance.primaryFocus?.unfocus();
    final XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      debugPrint('Selected image path: ${pickedFile.path}');
      setState(() {
        profileImage = pickedFile.path;
        
      });
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Profile', showBackButton: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.verticalSpace,
            SizedBox(
              height: 130.heightMultiplier,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: ProfileImage(
                      image: widget.user.image,
                      file: profileImage,
                    ),
                  ),
                  Positioned(
                    top: 65,
                    left: 70,
                    right: 0,
                    child: GestureDetector(
                      onTap: getGalleryPermissionAndPickImage,
                      child: CircleAvatar(
                        backgroundColor: AppColors.royalBlue,
                        radius: 15.radiusMultipier,
                        child: Icon(
                          Icons.edit_outlined,
                          color: AppColors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          'First Name',
                          style: context.regular.copyWith(fontSize: 14),
                        ),
                      ),
                      5.verticalSpace,
                      UniversalTextField(
                        controller: TextEditingController(
                          text: widget.user.name.split(' ').first,
                        ),
                        hintText: 'First Name',
                        // validator: CustomValidtion.isValidFirstName,
                      ),
                    ],
                  ),
                ),
                15.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Last Name',
                          style: context.regular.copyWith(fontSize: 14),
                        ),
                      ),
                      5.verticalSpace,
                      UniversalTextField(
                        controller: TextEditingController(
                          text: widget.user.name.split(' ').last,
                        ),
                        hintText: 'Last Name',
                        // validator: CustomValidtion.isValidLastName,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Phone Number',
                style: context.regular.copyWith(fontSize: 14),
              ),
            ),
            5.verticalSpace,
            PhoneTextField(controller: TextEditingController()),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Staff Id',
                style: context.regular.copyWith(fontSize: 14),
              ),
            ),
            5.verticalSpace,
            UniversalTextField(
              controller: TextEditingController(text: widget.user.staffId),
              hintText: 'Staff Id',
              enabled: false,
              // validator: CustomValidtion.isValidLastName,
            ),
            Spacer(),
            PurpleButton(title: 'Sumbit'),
            50.verticalSpace,
          ],
        ),
      ),
    );
  }
}
