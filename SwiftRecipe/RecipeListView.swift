//
//  RecipeListView.swift
//  SwiftRecipe
//
//  Created by Reginald Felix on 2024-11-01.
//

import SwiftUI

struct RecipeListView: View {
    @State private var recipes = RecipeList()

    var body: some View {
        NavigationStack {
            List {
                ForEach(recipes.AllRecipes) { recipe in
                    NavigationLink(value: recipe) {
                        RecipeListCellView(recipe: recipe)
                    }
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
