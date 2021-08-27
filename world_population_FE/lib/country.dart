import 'dart:convert';

class Country {
  String? countryName;
  int? population;
  int? ranking;
  Country({
    this.countryName,
    this.population,
    this.ranking,
  });

  Country copyWith({
    String? countryName,
    int? population,
    int? ranking,
  }) {
    return Country(
      countryName: countryName ?? this.countryName,
      population: population ?? this.population,
      ranking: ranking ?? this.ranking,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'countryName': countryName,
      'population': population,
      'ranking': ranking,
    };
  }

  factory Country.fromMap(Map<String, dynamic> map) {
    return Country(
      countryName: map['countryName'],
      population: map['population'],
      ranking: map['ranking'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Country.fromJson(String source) => Country.fromMap(json.decode(source));

  @override
  String toString() => 'Country(countryName: $countryName, population: $population, ranking: $ranking)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Country &&
        other.countryName == countryName &&
        other.population == population &&
        other.ranking == ranking;
  }

  @override
  int get hashCode => countryName.hashCode ^ population.hashCode ^ ranking.hashCode;
}
