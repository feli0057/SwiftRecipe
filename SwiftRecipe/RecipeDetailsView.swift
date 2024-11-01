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

            ScrollView(.vertical) {
                if selectedTab == "Overview" {
                    VStack(alignment: .leading) {
                        Text(recipe.overview)

                        Divider().padding(.vertical, 8)

                        HStack(alignment: .center, spacing: 16) {
                            Spacer()
                            VStack {
                                Text("Serves")
                                Text(recipe.servings)
                                    .font(.title3)
                                    .fontWeight(.semibold)
                            }
                            Spacer()
                            Divider().padding(.vertical, 8)
                            Spacer()
                            VStack {
                                Text("Cook Time")
                                Text(recipe.cookTime)
                                    .font(.title3)
                                    .fontWeight(.semibold)
                            }
                            Spacer()
                        }

                        Divider().padding(.vertical, 8)

                        Text("Ingredients")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.bottom, 8)

                        VStack(alignment: .leading, spacing: 8) {
                            ForEach(recipe.ingredients, id: \.self) { ingredient in
                                HStack(alignment: .center, spacing: 16) {
                                    Image(systemName: "checkmark.circle.fill")
                                    Text("\(ingredient)")
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                } else if selectedTab == "Instructions" {}

                Spacer()
            }
            .navigationTitle(recipe.name)
        }
    }
}

#Preview {
    RecipeDetailsView(recipe: Recipe(
        name: "Sizzling Pork Sisig",
        description: "Sour, spicy, and sizzling chopped pork. A Filipino classic, perfect with drinks.",
        image: "sisig",
        logo: "sisig-logo",
        overview: "Sizzling pork sisig is a Filipino dish made with chopped grilled pork, onions, and chili, all served on a hot plate. It’s crispy, savory, and usually topped with an egg and a squeeze of calamansi. Perfect as a meal or a bar snack!",
        servings: "2 to 4",
        cookTime: "1.5 hours",
        ingredients: ["asfdg", "asfaf", "asfag"],
        instructions: ""))
}
