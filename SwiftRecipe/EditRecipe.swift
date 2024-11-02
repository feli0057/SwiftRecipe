//
//  EditRecipe.swift
//  SwiftRecipe
//
//  Created by Reginald Felix on 2024-11-01.
//

import SwiftUI

struct EditRecipe: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var recipeList: RecipeList
    var recipe: Recipe
    
    @State private var name: String = ""
    @State private var description: String = ""
    @State private var overview: String = ""
    @State private var servings: String = ""
    @State private var cookTime: String = ""
    @State private var ingredients: [String] = []
    @State private var newIngredient: String = ""
    @State private var instructions: [String] = []
    @State private var newInstruction: String = ""
    
    init(recipeList: RecipeList, recipe: Recipe) {
        self.recipeList = recipeList
        self.recipe = recipe
        
        _name = State(initialValue: recipe.name)
        _description = State(initialValue: recipe.description)
        _overview = State(initialValue: recipe.overview)
        _servings = State(initialValue: recipe.servings)
        _cookTime = State(initialValue: recipe.cookTime)
        _ingredients = State(initialValue: recipe.ingredients)
        _instructions = State(initialValue: recipe.instructions)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Form {
                Section(header: Text("Recipe Name")) {
                    TextField("Name", text: $name)
                }

                Section(header: Text("Description")) {
                    TextField("Briefly describe your dish", text: $description, axis: .vertical)
                }

                Section(header: Text("Overview")) {
                    TextField("Write a detailed introduction", text: $overview, axis: .vertical)
                }

                Section(header: Text("Servings")) {
                    TextField("Example: 2 to 4", text: $servings)
                }

                Section(header: Text("Cook Time")) {
                    TextField("Example: 3 hours", text: $cookTime)
                }

                Section(header: Text("Ingredients")) {
                    VStack(alignment: .leading) {
                        List {
                            ForEach(ingredients, id: \.self) { ingredient in
                                Text(ingredient)
                            }
                            .onDelete(perform: deleteIngredient)
                        }
                                
                        HStack {
                            TextField("Add an ingredient", text: $newIngredient, axis: .vertical)
                            Button(action: addIngredient) {
                                Image(systemName: "plus.circle.fill")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                            }
                        }
                    }
                }
                        
                Section(header: Text("Instructions")) {
                    VStack(alignment: .leading) {
                        List {
                            ForEach(instructions, id: \.self) { instruction in
                                Text(instruction)
                            }
                            .onDelete(perform: deleteInstruction)
                        }
                                
                        HStack {
                            TextField("Add step", text: $newInstruction, axis: .vertical)
                            Button(action: addInstruction) {
                                Image(systemName: "plus.circle.fill")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                            }
                        }
                    }
                }
                
                Button("Save Edits") {
                    saveEdits()
                }
            }
        }
    }

    private func addIngredient() {
        if !newIngredient.isEmpty {
            ingredients.append(newIngredient)
            newIngredient = ""
        }
    }
            
    private func deleteIngredient(at offsets: IndexSet) {
        ingredients.remove(atOffsets: offsets)
    }
            
    private func addInstruction() {
        if !newInstruction.isEmpty {
            instructions.append(newInstruction)
            newInstruction = ""
        }
    }
            
    private func deleteInstruction(at offsets: IndexSet) {
        instructions.remove(atOffsets: offsets)
    }
    
    private func saveEdits() {
        let editedRecipe = Recipe(
            id: recipe.id,
            name: name,
            description: description,
            image: recipe.image,
            logo: recipe.logo,
            overview: overview,
            servings: servings,
            cookTime: cookTime,
            ingredients: ingredients,
            instructions: instructions
        )
        
        recipeList.editRecipe(editedRecipe)
        presentationMode.wrappedValue.dismiss()
    }
}

#Preview {
    EditRecipe(recipeList: RecipeList(), recipe: Recipe(
        name: "Sizzling Pork Sisig",
        description: "Sour, spicy, and sizzling chopped pork. A Filipino classic, perfect with drinks.",
        image: "sisig",
        logo: "sisig-logo",
        overview: "Sizzling pork sisig is a Filipino dish made with chopped grilled pork, onions, and chili, all served on a hot plate. It’s crispy, savory, and usually topped with an egg and a squeeze of calamansi. Perfect as a meal or a bar snack!",
        servings: "2 to 4",
        cookTime: "1.5 hours",
        ingredients: ["asfdg", "asfaf", "asfag"],
        instructions: [
            "1. In a large pot, combine pig face, vinegagh water to completely cover pork.",
            "2. Bring to a boil, skimmingiquid.",
            "3. Over a hot grill, gr for about 4 to 5 minutes or until nicely charred.",
            "4. Remove from heat, allow to cool to the touch, the finely chop the meat.",
            "5. In a large bowl, and liver spread and gently stir to combine.",
            "6. Season with salt and pepper to taste.",
            "7. Transfer to a hot sizzling plate, crack an egg on top, and serve.",
        ]
    ))
}
