//
//  AddRecipe.swift
//  SwiftRecipe
//
//  Created by Reginald Felix on 2024-11-01.
//

import SwiftUI

struct AddRecipe: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var recipeList: RecipeList
    
    @State private var name: String = ""
    @State private var description: String = ""
    @State private var overview: String = ""
    @State private var servings: String = ""
    @State private var cookTime: String = ""
    @State private var ingredients: [String] = []
    @State private var newIngredient: String = ""
    @State private var instructions: [String] = []
    @State private var newInstruction: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Form {
                Section(header: Text("Recipe Name")) {
                    TextField("Name", text: $name)
                }
                
                Section(header: Text("Description")) {
                    TextField("Briefly describe your dish", text: $description)
                }
                
                Section(header: Text("Overview")) {
                    TextField("Write a detailed introduction to your dish", text: $overview)
                        .frame(height: 100)
                }
                
                Section(header: Text("Servings")) {
                    TextField("Example: 2 to 4", text: $servings)
                }
                
                Section(header: Text("Cook Time")) {
                    TextField("Example: 3 hours", text: $cookTime)
                }
                
                Section(header: Text("Ingredients")) {
                    VStack(alignment: .leading) {
                        ForEach(ingredients, id: \.self) { ingredient in
                            Text(ingredient)
                        }
                                            
                        HStack {
                            TextField("Add an ingredient", text: $newIngredient)
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
                        ForEach(instructions, id: \.self) { instruction in
                            Text(instruction)
                        }
                                            
                        HStack {
                            TextField("Add steps", text: $newInstruction)
                            Button(action: addInstruction) {
                                Image(systemName: "plus.circle.fill")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                            }
                        }
                    }
                }
                
                Button("Save Recipe") {
                    saveRecipe()
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
    
    private func addInstruction() {
        if !newInstruction.isEmpty {
            instructions.append(newInstruction)
            newInstruction = ""
        }
    }
    
    private func saveRecipe() {
        let newRecipe = Recipe(
            name: name,
            description: description,
            image: "placeholder",
            logo: "placeholder",
            overview: overview,
            servings: servings,
            cookTime: cookTime,
            ingredients: ingredients,
            instructions: instructions)
        recipeList.addRecipe(newRecipe)
        presentationMode.wrappedValue.dismiss()
    }
}

#Preview {
    AddRecipe(recipeList: RecipeList())
}
