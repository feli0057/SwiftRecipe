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
                    TextField("Briefly describe your dish", text: $description, axis: .vertical)
                }
                
                Section(header: Text("Overview")) {
                    TextField("Write a detailed introduction to your dish", text: $overview, axis: .vertical)
                }
                
                Section(header: Text("Servings")) {
                    TextField("Example: 2 to 4", text: $servings)
                }
                
                Section(header: Text("Cook Time")) {
                    TextField("Example: 3 hours", text: $cookTime)
                }
                
                Section(header: Text("Ingredients")) {
                    VStack(alignment: .leading, spacing: 12) {
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
                    VStack(alignment: .leading, spacing: 12) {
                        List {
                            ForEach(instructions, id: \.self) { instruction in
                                Text(instruction)
                            }
                            .onDelete(perform: deleteIstruction)
                        }
                                            
                        HStack {
                            TextField("Add steps", text: $newInstruction, axis: .vertical)
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
    
    private func deleteIngredient(at offsets: IndexSet) {
        ingredients.remove(atOffsets: offsets)
    }
    
    private func addInstruction() {
        if !newInstruction.isEmpty {
            instructions.append(newInstruction)
            newInstruction = ""
        }
    }
    
    private func deleteIstruction(at offsets: IndexSet) {
        instructions.remove(atOffsets: offsets)
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
