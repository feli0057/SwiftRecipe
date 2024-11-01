//
//  RecipeDetailsView.swift
//  SwiftRecipe
//
//  Created by Reginald Felix on 2024-11-01.
//

import SwiftUI

struct RecipeDetailsView: View {
    let recipe: Recipe
    @State private var selectedTab = "Overview"

    var body: some View {
        VStack {
            Image(recipe.image)
                .resizable()
                .scaledToFill()
                .frame(width: nil, height: 250)
                .clipped()

            Picker(selection: $selectedTab) {
                Text("Overview").tag("Overview")
                Text("Instructions").tag("Instructions")
            } label: {
                Text("Select a tab")
            }
            .pickerStyle(.segmented)
            .padding()

//            ScrollView(.vertical){
//                if selectedTab == "Overview" {
//                    Overview()
//                } else if selectedTab == "Instructions" {
//                    Instructions()
//                }
            
            Spacer()
        }
        .navigationTitle(recipe.name)
    }
}

#Preview {
    RecipeDetailsView(recipe: Recipe(
        name: "Sizzling Pork Sisig",
        description: "Sour, spicy, and sizzling chopped pork. A Filipino classic, perfect with drinks.",
        image: "sisig",
        logo: "sisig-logo",
        overview: "",
        servings: "",
        cookingTime: "",
        ingredients: [],
        instructions: ""))
}
