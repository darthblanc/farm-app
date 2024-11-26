class Weather {
  const Weather({
    required this.description,
    required this.temperatureStats,
    required this.windStats,
  });

  final String description;
  final List temperatureStats;
  final List windStats;

  factory Weather.fromJSON(Map<String, dynamic> json) {
    List<String> getPairs(Map<String, dynamic> json) {
      List<String> rv = [];

      for (var v in json.keys) {
        rv.add("$v: ${json[v].toString()}");
      }
      return rv;
    }

    String description =
        "Description: ${json["weather"][0]["description"].toString()}";
    List main = getPairs(json["main"]);
    List wind = getPairs(json["wind"]);
    return Weather(
        description: description, temperatureStats: main, windStats: wind);
  }
}
