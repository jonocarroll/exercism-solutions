type
  Allergen* = enum
    Eggs, Peanuts, Shellfish, Strawberries, Tomatoes, Chocolate, Pollen, Cats

proc allergies*(score: int): set[Allergen] =
  if score >= 256: return allergies(score - 256)
  if score >= 128: return {Allergen.Cats} + allergies(score - 128)
  if score >= 64: return {Allergen.Pollen} + allergies(score - 64)
  if score >= 32: return {Allergen.Chocolate} + allergies(score - 32)
  if score >= 16: return {Allergen.Tomatoes} + allergies(score - 16)
  if score >= 8: return {Allergen.Strawberries} + allergies(score - 8)
  if score >= 4: return {Allergen.Shellfish} + allergies(score - 4)
  if score >= 2: return {Allergen.Peanuts} + allergies(score - 2)
  if score >= 1: return {Allergen.Eggs}
  return {}

proc isAllergicTo*(score: int, allergen: Allergen): bool =
  return allergies(score).contains(allergen)
