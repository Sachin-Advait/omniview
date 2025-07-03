// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'charts': charts.map((x) => x.toJson()).toList(),
    };
  }
}
