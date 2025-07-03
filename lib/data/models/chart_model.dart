// ignore_for_file: public_member_api_docs, sort_constructors_first

// ignore_for_file: constant_identifier_names

class ChartModel {
  Type type;
  String title;
  DataDetails data;

  ChartModel({required this.type, required this.title, required this.data});

  factory ChartModel.fromJson(Map<String, dynamic> json) => ChartModel(
    type: typeValues.map[json["type"]]!,
    title: json["title"],
    data: DataDetails.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'type': typeValues.reverse[type],
      'title': title,
      'data': data.toJson(),
    };
  }
}

class DataDetails {
  int? minY;
  int? maxY;
  double? benchmarkY;
  List<List<int>>? dataPoints;
  List<int>? values;
  List<Section>? sections;
  double? progress;

  DataDetails({
    this.minY,
    this.maxY,
    this.benchmarkY,
    this.dataPoints,
    this.values,
    this.sections,
    this.progress,
  });

  factory DataDetails.fromJson(Map<String, dynamic> json) => DataDetails(
    minY: json["minY"],
    maxY: json["maxY"],
    benchmarkY: json["benchmarkY"]?.toDouble(),
    dataPoints: json["dataPoints"] == null
        ? []
        : List<List<int>>.from(
            json["dataPoints"]!.map((x) => List<int>.from(x.map((x) => x))),
          ),
    values: json["values"] == null
        ? []
        : List<int>.from(json["values"]!.map((x) => x)),
    sections: json["sections"] == null
        ? []
        : List<Section>.from(json["sections"]!.map((x) => Section.fromJson(x))),
    progress: double.tryParse(json["progress"].toString()) ?? 0.0,
  );

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'minY': minY,
      'maxY': maxY,
      'benchmarkY': benchmarkY,
      'dataPoints': dataPoints,
      'values': values,
      'sections': sections!.map((x) => x.toJson()).toList(),
      'progress': progress,
    };
  }
}

class Section {
  int value;
  Title title;
  ColorType color;

  Section({required this.value, required this.title, required this.color});

  factory Section.fromJson(Map<String, dynamic> json) => Section(
    value: json["value"],
    title: titleValues.map[json["title"]]!,
    color: colorValues.map[json["color"]]!,
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "title": titleValues.reverse[title],
    "color": colorValues.reverse[color],
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

enum ColorType { LIME_GREEN, PRIMARY, ROYAL_BLUE }

final colorValues = EnumValues({
  "limeGreen": ColorType.LIME_GREEN,
  "primary": ColorType.PRIMARY,
  "royalBlue": ColorType.ROYAL_BLUE,
});

enum Title { A, B, C }

final titleValues = EnumValues({"A": Title.A, "B": Title.B, "C": Title.C});

enum Type { BAR_CHART, DONUT_CHART, LINE_CHART, RADIAL_PROGRESS }

final typeValues = EnumValues({
  "barChart": Type.BAR_CHART,
  "donutChart": Type.DONUT_CHART,
  "lineChart": Type.LINE_CHART,
  "radialProgress": Type.RADIAL_PROGRESS,
});
