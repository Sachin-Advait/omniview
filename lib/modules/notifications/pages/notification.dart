import 'package:flutter/material.dart';
import 'package:omniview/common/widgets/custom_appbar.dart';
import 'package:omniview/config/theme/app_colors.dart';
import 'package:omniview/config/theme/app_theme.dart';
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
            return NotificationCard(notification: notification);
          },
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key, required this.notification});

  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
      child: ListTile(
        minVerticalPadding: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(10),
        ),
        tileColor: Theme.of(context).cardColor,
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
          style: context.semiBold.copyWith(fontSize: 15),
        ),
        subtitle: Text(
          notification.subTitle,
          style: TextStyle(color: Theme.of(context).canvasColor),
        ),
        trailing: Text(
          notification.time,
          style: context.regular.copyWith(
            fontSize: 12,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}
