class ChartModel {
  late int time;
  late double? open;
  late double? high;
  late double? low;
  late double? close;
  ChartModel({
    required this.close,
    required this.time,
    required this.high,
    required this.open,
    required this.low,
  });
  factory ChartModel.fromJson(List l) {
    return ChartModel(
      time: l[0] == null ? null : l[0]!,
      open: l[1] == null ? null : l[1]!,
      high: l[2] == null ? null : l[2]!,
      low: l[3] == null ? null : l[3]!,
      close: l[4] == null ? null : l[4]!,
    );
  }
}
