import 'package:omniview/data/models/chart_model.dart';

class TabModel {
  final String name;
  final List<ChartModel> charts;

  TabModel({required this.name, required this.charts});

  factory TabModel.fromJson(Map<String, dynamic> json) {
    return TabModel(
      name: json['name'],
      charts: (json['charts'] as List<dynamic>)
          .map((e) => ChartModel.fromJson(e))
          .toList(),
    );
  }
}
