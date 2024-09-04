enum DrinkType {
  beer,
  wine,
  nonAlcoholic,
  cocktail,
  spirits,
  other,
}

extension DrinkTypeExtension on DrinkType {
  String get name {
    switch (this) {
      case DrinkType.beer:
        return "Beer";
      case DrinkType.wine:
        return "Wine";
      case DrinkType.nonAlcoholic:
        return "Non-Alcoholic";
      case DrinkType.cocktail:
        return "Cocktail";
      case DrinkType.spirits:
        return "Spirits";
      case DrinkType.other:
        return "Other";
    }
  }
}
