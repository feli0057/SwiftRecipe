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
    let cookingTime: String
    let ingredients: [String]
    let instructions: String

    init(id: UUID = UUID(), name: String, description: String, image: String, logo: String, overview: String, servings: String, cookingTime: String, ingredients: [String], instructions: String) {
        self.id = id
        self.name = name
        self.description = description
        self.image = image
        self.logo = logo
        self.overview = overview
        self.servings = servings
        self.cookingTime = cookingTime
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
            overview: "",
            servings: "",
            cookingTime: "",
            ingredients: [],
            instructions: ""),

        Recipe(
            name: "Lechon Kawali",
            description: "Crucnhy, juicy, deep-fried pork belly dipped in spicy vinegar or liver sauce.",
            image: "lechonkawali",
            logo: "lechonkawali-logo",
            overview: "",
            servings: "",
            cookingTime: "",
            ingredients: [],
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
