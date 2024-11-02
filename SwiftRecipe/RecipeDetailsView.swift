//
//  RecipeDetailsView.swift
//  SwiftRecipe
//
//  Created by Reginald Felix on 2024-11-01.
//

import SwiftUI

struct RecipeDetailsView: View {
    @ObservedObject var recipeList: RecipeList
    let recipe: Recipe
    @State private var selectedTab = "Overview"
    @State private var showEditRecipe = false

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
                } else if selectedTab == "Instructions" {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Instructions")
                            .font(.title2)
                            .fontWeight(.bold)

                        VStack {
                            ForEach(recipe.instructions, id: \.self) { instruction in
                                HStack(alignment: .center, spacing: 16) {
                                    Text("\(instruction)")
                                        .padding(.vertical, 8)
                                    Spacer()
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                }
                Spacer()
            }
            .navigationTitle(recipe.name)

            Button("Edit") {
                showEditRecipe.toggle()
            }
            .sheet(isPresented: $showEditRecipe) {
                EditRecipe(
                    recipeList: recipeList,
                    recipe: recipe
                )
            }
        }
    }
}

#Preview {
    RecipeDetailsView(recipeList: RecipeList(), recipe: Recipe(
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
