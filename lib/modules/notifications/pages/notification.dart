import 'package:flutter/material.dart';
import 'package:omniview/common/widgets/custom_appbar.dart';
import 'package:omniview/config/theme/app_colors.dart';
import 'package:omniview/data/models/notification_model.dart';

class Notification extends StatefulWidget {
  const Notification({super.key});

  @override
  State<Notification> createState() => _NotificationState();
}

class _NotificationState extends State<Notification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(showBackButton: true, title: "Notifications"),
      body: SafeArea(
        child: ListView.builder(
          itemCount: dummyNotifications.length,
          padding: EdgeInsets.only(top: 10),
          itemBuilder: (BuildContext context, int index) {
            final notification = dummyNotifications[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
              child: ListTile(
                minVerticalPadding: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(10),
                ),
                tileColor: AppColors.darkSlate,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                // leading: CircleAvatar(
                //   backgroundImage: AssetImage(notification.image),
                //   radius: 25,
                // ),
                title: Text(
                  notification.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  notification.subTitle,
                  style: const TextStyle(color: Colors.white70),
                ),
                trailing: Text(
                  notification.time,
                  style: const TextStyle(color: Colors.white54, fontSize: 12),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
