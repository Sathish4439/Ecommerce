enum Category {
  ELECTRONICS,
  JEWELRY,
  MEN_S_CLOTHING,
  WOMEN_S_CLOTHING,
}

class Rating {
  final double rate;
  final int count;

  const Rating({
    required this.rate,
    required this.count,
  });
}
