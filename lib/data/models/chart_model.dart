class ChartModel {
  final String type;
  final String title;
  final ChartData data;

  ChartModel({required this.type, required this.title, required this.data});

  factory ChartModel.fromJson(Map<String, dynamic> json) {
    final String type = json['type'];
    final dynamic dataJson = json['data'];

    late final ChartData data;

    switch (type) {
      case 'lineChart':
        data = LineChartDataModel.fromJson(dataJson);
        break;
      case 'barChart':
        data = BarChartDataModel.fromJson(dataJson);
        break;
      case 'donutChart':
        data = DonutChartDataModel.fromJson(dataJson);
        break;
      case 'radialProgress':
        data = RadialProgressDataModel.fromJson(dataJson);
        break;
      default:
        throw Exception('Unknown chart type: $type');
    }

    return ChartModel(type: type, title: json['title'], data: data);
  }
}

abstract class ChartData {}

/// Line Chart
class LineChartDataModel extends ChartData {
  final double minY;
  final double maxY;
  final double benchmarkY;
  final List<List<double>> dataPoints;

  LineChartDataModel({
    required this.minY,
    required this.maxY,
    required this.benchmarkY,
    required this.dataPoints,
  });

  factory LineChartDataModel.fromJson(Map<String, dynamic> json) {
    return LineChartDataModel(
      minY: (json['minY'] as num).toDouble(),
      maxY: (json['maxY'] as num).toDouble(),
      benchmarkY: (json['benchmarkY'] as num).toDouble(),
      dataPoints: (json['dataPoints'] as List)
          .map(
            (point) => (point as List)
                .map((value) => (value as num).toDouble())
                .toList(),
          )
          .toList(),
    );
  }
}

/// Bar Chart
class BarChartDataModel extends ChartData {
  final double minY;
  final double maxY;
  final double benchmarkY;
  final List<double> values;

  BarChartDataModel({
    required this.minY,
    required this.maxY,
    required this.benchmarkY,
    required this.values,
  });

  factory BarChartDataModel.fromJson(Map<String, dynamic> json) {
    return BarChartDataModel(
      minY: (json['minY'] as num).toDouble(),
      maxY: (json['maxY'] as num).toDouble(),
      benchmarkY: (json['benchmarkY'] as num).toDouble(),
      values: (json['values'] as List)
          .map((value) => (value as num).toDouble())
          .toList(),
    );
  }
}

/// Donut Chart
class DonutChartDataModel extends ChartData {
  final List<DonutSection> sections;

  DonutChartDataModel({required this.sections});

  factory DonutChartDataModel.fromJson(Map<String, dynamic> json) {
    return DonutChartDataModel(
      sections: (json['sections'] as List)
          .map((e) => DonutSection.fromJson(e))
          .toList(),
    );
  }
}

class DonutSection {
  final double value;
  final String title;
  final String color; // can be mapped to AppColors

  DonutSection({required this.value, required this.title, required this.color});

  factory DonutSection.fromJson(Map<String, dynamic> json) {
    return DonutSection(
      value: (json['value'] as num).toDouble(),
      title: json['title'],
      color: json['color'],
    );
  }
}

/// Radial Progress
class RadialProgressDataModel extends ChartData {
  final double progress;

  RadialProgressDataModel({required this.progress});

  factory RadialProgressDataModel.fromJson(Map<String, dynamic> json) {
    return RadialProgressDataModel(
      progress: (json['progress'] as num).toDouble(),
    );
  }
}
