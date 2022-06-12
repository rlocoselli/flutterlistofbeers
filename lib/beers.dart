class Beers {
  final int number;
  final String name;
  const Beers({required this.number, required this.name});

  factory Beers.fromJson(Map<String, dynamic> json) {
    return Beers(
      number: json['number'],
      name: json['name'],
    );
  }
}
