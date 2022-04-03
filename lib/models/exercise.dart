class Exercise {
  final int id;
  final String name;
  final String? image;
  final bool repBased;
  final String? description;
  final String? tips;

  Exercise({
    required this.id,
    required this.name,
    this.image,
    this.repBased = true,
    this.description,
    this.tips,
  });
}
