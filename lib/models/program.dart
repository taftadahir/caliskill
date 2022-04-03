class Program {
  final int id;
  final String name;
  final int? days;
  final String? image;

  Program({
    required this.id,
    required this.name,
    this.days,
    this.image,
  });
}
