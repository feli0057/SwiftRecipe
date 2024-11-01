//
//  RecipeListView.swift
//  SwiftRecipe
//
//  Created by Reginald Felix on 2024-11-01.
//

import SwiftUI

struct Recipe: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let description: String
    let image: String
    let logo: String
}

struct RecipeListView: View {
    let recipes: [Recipe] = [
        Recipe(
            name: "Sizzling Pork Sisig",
            description: "Sour, spicy, and sizzling chopped pork. A Filipino classic, perfect with drinks.",
            image: "sisig",
            logo: "sisig-logo"),
        
        Recipe(
            name: "Lechon Kawali",
            description: "Crucnhy, juicy, deep-fried pork belly dipped in spicy vinegar or liver sauce.",
            image: "lechonkawali",
            logo: "lechonkawali-logo"),
    ]

    var body: some View {
        NavigationStack {
            List(recipes, id: \.self) { recipe in
                NavigationLink(value: recipe) {
                    RecipeListCellView(recipe: recipe)
                }
            }
            .navigationTitle("Recipes")
        }
        
    }
}

struct RecipeListCellView: View {
    let recipe: Recipe
    
    var body: some View {
        HStack {
            Image(recipe.logo)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipShape(.circle)
            
            VStack(alignment: .leading) {
                Text(recipe.name)
                    .font(.title3)
                    .fontWeight(.semibold)
                Text("\(recipe.description)")
                    .font(.caption)
                    .foregroundColor(.gray)
            }

            Spacer()
        }
        
    }
}

#Preview {
    RecipeListView()
}
