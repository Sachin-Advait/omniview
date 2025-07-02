import 'package:omniview/data/models/chart_model.dart';

class TabModel {
  String name;
  List<ChartModel> charts;

  TabModel({required this.name, required this.charts});

  factory TabModel.fromJson(Map<String, dynamic> json) => TabModel(
    name: json["name"],
    charts: List<ChartModel>.from(
      json["charts"].map((x) => ChartModel.fromJson(x)),
    ),
  );
}
