//
//  Recipes.swift
//  SwiftRecipe
//
//  Created by Reginald Felix on 2024-11-01.
//

import Foundation

struct Recipe: Identifiable, Hashable {
    var id = UUID()
    let name: String
    let description: String
    let image: String
    let logo: String
    let overview: String
    let servings: String
    let cookTime: String
    let ingredients: [String]
    let instructions: [String]

    init(id: UUID = UUID(), name: String, description: String, image: String, logo: String, overview: String, servings: String, cookTime: String, ingredients: [String], instructions: [String]) {
        self.id = id
        self.name = name
        self.description = description
        self.image = image
        self.logo = logo
        self.overview = overview
        self.servings = servings
        self.cookTime = cookTime
        self.ingredients = ingredients
        self.instructions = instructions
    }
}

class RecipeList: ObservableObject {
    @Published var AllRecipes: [Recipe] = [
        Recipe(
            name: "Sizzling Pork Sisig",
            description: "Sour, spicy, and sizzling chopped pork. A Filipino classic, perfect with drinks.",
            image: "sisig",
            logo: "sisig-logo",
            overview: "Sizzling pork sisig is a Filipino dish made with chopped grilled pork, onions, and chili, all served on a hot plate. It’s crispy, savory, and usually topped with an egg and a squeeze of calamansi. Perfect as a meal or a bar snack!",
            servings: "2 to 4",
            cookTime: "1.5 hours",
            ingredients: [
                "2 pounds pig face (snouts, ears, and jowls)",
                "1 cup vinegar",
                "¼ cup soy sauce",
                "1 head garlic, peeled and crushed",
                "1 teaspoon whole peppercorns",
                "2 bay leaves",
                "1 tablespoon salt",
                "1 large onion, peeled and diced",
                "6 Thai chili peppers, stemmed and minced",
                "½ cup calamansi juice",
                "1 tablespoon Maggi Liquid seasoning",
                "½ cup liver spread",
                "fresh eggs, for serving",
            ],
            instructions: [
                "1. In a large pot, combine pig face, vinegar, soy sauce, garlic, peppercorns, bay leaves, about 1 tablespoon salt, and enough water to completely cover pork.",
                "2. Bring to a boil, skimming scum that floats on top. Lower heat, cover, and simmer for about 50 minutes to 1 hour or until meat is tender. Remove from heat and drain well, discarding liquid.",
                "3. Over a hot grill, grill pork for about 7 to 10 minutes on each side or until crisp and slightly charred. Or arrange in a single layer on a baking sheet and broil in a 450 F oven for about 4 to 5 minutes or until nicely charred.",
                "4. Remove from heat, allow to cool to the touch, the finely chop the meat.",
                "5. In a large bowl, combine chopped meat, onions, chili peppers, calamansi juice, liquid seasoning, and liver spread and gently stir to combine.",
                "6. Season with salt and pepper to taste.",
                "7. Transfer to a hot sizzling plate, crack an egg on top, and serve.",
            ]),

        Recipe(
            name: "Lechon Kawali",
            description: "Crunchy, juicy, fried pork belly dipped in spiced vinegar or lechon sauce.",
            image: "lechonkawali",
            logo: "lechonkawali-logo",
            overview: "Lechon kawali is a Filipino favorite made with pork belly that's boiled, seasoned, and deep-fried until super crispy. Golden on the outside and tender inside, this hearty dish is best served with soy-vinegar dipping sauce or lechon gravy.",
            servings: "4 to 8",
            cookTime: "2 hours",
            ingredients: [
                "4 pounds whole pork belly",
                "1 head garlic, pounded",
                "2 tablespoons salt",
                "1 tablespoon peppercorns",
                "2 bay leaves",
                "water",
                "canola oil",
            ],
            instructions: [
                "1. In a deep pot over medium heat, combine pork belly, garlic, salt, peppercorns, bay leaves, and enough water to cover the pork.",
                "2. Bring to a boil, skimming scum that floats on top. Lower the heat, cover, and continue to cook for about 1 to 1 ½ hours or until meat is fork-tender but not falling apart.",
                "3. Strain the pork, discarding the liquid. Wipe the pork dry, removing any stray aromatics.",
                "4. Allow pork to cool to the touch and pat dry with paper towels. Score the skin using the tines of a fork.",
                "5. Brush the pork skin with vinegar.",
                "6. Season the pork all over with salt and layer the skin with a thin film of salt.",
                "7. Place pork on a wire rack and refrigerate overnight to completely cool and dry. Remove from refrigerator and scrape off the salt.",
                "8. In a deep, heavy-bottomed pot, heat enough oil to completely cover meat to about 350 F to 375 F.",
                "9. Carefully place the meat in the hot oil and fry, turning as needed until golden and the skin is crisp and puffed.",
                "10. Remove pork from the pot and drain on a wire rack set over a baking sheet. Let rest for about 5 minutes and cut into serving pieces.",
                "11. Serve with your choice of dipping sauce.",
            ]),
    ]

    func addRecipe(_ recipe: Recipe) {
        AllRecipes.append(recipe)
    }

    func deleteRecipe(_ recipe: Recipe) {
        AllRecipes.removeAll(where: { $0.name == recipe.name })
    }

    func editRecipe(_ recipe: Recipe) {
        AllRecipes.removeAll(where: { $0.name == recipe.name })
        AllRecipes.append(recipe)
    }
}
