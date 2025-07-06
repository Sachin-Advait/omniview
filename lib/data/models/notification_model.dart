class NotificationModel {
  final String image;
  final String title;
  final String subTitle;
  final String time;

  NotificationModel({
    required this.image,
    required this.title,
    required this.subTitle,
    required this.time,
  });
}

final List<NotificationModel> dummyNotifications = [
  NotificationModel(
    image: 'assets/avatars/purple.png',
    title: 'Jane Smith',
    subTitle: 'Lorem ipsum dolor sit amet, consectetur...',
    time: 'just now',
  ),
  NotificationModel(
    image: 'assets/avatars/blue.png',
    title: 'William',
    subTitle: 'Lorem ipsum dolor sit amet, consectetur...',
    time: '1 hour',
  ),
  NotificationModel(
    image: 'assets/avatars/red.png',
    title: 'Jane Smith',
    subTitle: 'Lorem ipsum dolor sit amet, consectetur...',
    time: '2 hours',
  ),
  NotificationModel(
    image: 'assets/avatars/orange.png',
    title: 'Samantha',
    subTitle: 'Lorem ipsum dolor sit amet, consectetur...',
    time: '5 hours',
  ),
  NotificationModel(
    image: 'assets/avatars/teal.png',
    title: 'Jin Yuno',
    subTitle: 'Lorem ipsum dolor sit amet, consectetur...',
    time: '2 days',
  ),
];
