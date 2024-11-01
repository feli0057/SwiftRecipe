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
    let instructions: String

    init(id: UUID = UUID(), name: String, description: String, image: String, logo: String, overview: String, servings: String, cookTime: String, ingredients: [String], instructions: String) {
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
            ],
            instructions: ""),

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
            instructions: ""),
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
