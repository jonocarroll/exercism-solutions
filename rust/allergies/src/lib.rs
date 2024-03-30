pub struct Allergies {
    score: u32,
}

#[derive(Debug, PartialEq, Eq)]
pub enum Allergen {
    Eggs,
    Peanuts,
    Shellfish,
    Strawberries,
    Tomatoes,
    Chocolate,
    Pollen,
    Cats,
}

impl Allergies {
    pub fn new(score: u32) -> Self {
        Allergies { score }
    }

    pub fn is_allergic_to(&self, allergen: &Allergen) -> bool {
        self.allergies().contains(allergen)
    }

    pub fn allergies(&self) -> Vec<Allergen> {
        let mut res = match self.score {
            n if n >= 256 => Allergies::new(n - 256).allergies(),
            n if n >= 128 => {
                // if self.allergies().contains(&Allergen::Cats) {
                //     let mut allergies = Vec::new();
                //     allergies.extend(Allergies::new(n - 128).allergies());
                //     allergies
                // } else {
                let mut allergies = vec![Allergen::Cats];
                allergies.extend(Allergies::new(n - 128).allergies());
                allergies
                // }
            }
            n if n >= 64 => {
                let mut allergies = vec![Allergen::Pollen];
                allergies.extend(Allergies::new(n - 64).allergies());
                allergies
            }
            n if n >= 32 => {
                let mut allergies = vec![Allergen::Chocolate];
                allergies.extend(Allergies::new(n - 32).allergies());
                allergies
            }
            n if n >= 16 => {
                let mut allergies = vec![Allergen::Tomatoes];
                allergies.extend(Allergies::new(n - 16).allergies());
                allergies
            }
            n if n >= 8 => {
                let mut allergies = vec![Allergen::Strawberries];
                allergies.extend(Allergies::new(n - 8).allergies());
                allergies
            }
            n if n >= 4 => {
                let mut allergies = vec![Allergen::Shellfish];
                allergies.extend(Allergies::new(n - 4).allergies());
                allergies
            }
            n if n >= 2 => {
                let mut allergies = vec![Allergen::Peanuts];
                allergies.extend(Allergies::new(n - 2).allergies());
                allergies
            }
            1 => {
                vec![Allergen::Eggs]
            }
            0 => Vec::new(),
            n => Allergies::new(n - 1).allergies(),
        };
        res.dedup();
        res
    }
}
