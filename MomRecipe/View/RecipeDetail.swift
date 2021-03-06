//
//  RecipeDetail.swift
//  MomRecipe
//
//  Created by Jainy Alvin on 1/5/22.
//

import SwiftUI

struct RecipeDetail: View {
    var recipeDetail : Recipe
    @State var servingSelection = 2
    var body: some View {
        
        
        VStack(alignment: .leading)
        {
            GeometryReader
            { geo in
                Image(recipeDetail.image).resizable()
                    .scaledToFill()
                    .frame(width: geo.size.width,height: geo.size.height)
                    .clipped()
            }.frame(height: 200)
            
            Divider()
            
            VStack(alignment: .leading)
            {
                Text("Select your serving size").bold()
                 
                Picker("Flavor", selection: $servingSelection) {
                    Text("2").tag(2)
                    Text("4").tag(4)
                    Text("6").tag(6)
                    Text("8").tag(8)
                }.pickerStyle(.segmented)
                    .frame(width: 200)
                   
                    
            }
            .padding(.leading, 10.0)
            
            
            Divider()
            ScrollView
            {
                VStack(alignment: .leading)
                {
                    VStack(alignment: .leading)
                    {
                        Text("Ingredients").bold().padding(.bottom,5).font(.title3)
                        ForEach(0..<recipeDetail.ingredients.count ,id: \.self){
                            Index in
                            Text("•" + MomRecipeModel.getPortion(ingredient: recipeDetail.ingredients[Index], recipeServings: recipeDetail.servings, targetServings: servingSelection)  + " " + recipeDetail.ingredients[Index].name).padding(.bottom,1)
                            
                        }
                        
                    }.padding(.horizontal, 10.0)
                    Divider()
                    VStack(alignment: .leading)
                    {
                        Text("Directions").bold().padding(.bottom,10).font(.title3)
                        ForEach(0..<recipeDetail.directions.count ,id: \.self){
                            Index in
                            Text(String(Index+1) + "•" + recipeDetail.directions[Index]).padding(.bottom,1)
                            
                        }
                        
                    }
                    .padding(.horizontal, 10.0)
                    Spacer()
                }
                
            }
            
        }.navigationBarTitle(recipeDetail.name).font(Font.custom("Menlo Regular", size: 23))
    }
    
    
    
    
}

struct RecipeDetail_Previews: PreviewProvider {
    static var previews: some View {
        let model = MomRecipeModel()
        RecipeDetail(recipeDetail: model.MomRecipeList[0])
    }
}
