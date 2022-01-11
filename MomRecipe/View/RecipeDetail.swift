//
//  RecipeDetail.swift
//  MomRecipe
//
//  Created by Jainy Alvin on 1/5/22.
//

import SwiftUI

struct RecipeDetail: View {
    var recipeDetail : Recipe
    
    var body: some View {
        
        
        VStack(alignment: .leading)
        {
            Image(recipeDetail.image).resizable()
                .scaledToFill().frame(width: 400, height: 400, alignment: .top)
            Divider()
            
            ScrollView
            {
                VStack(alignment: .leading)
                {
                    VStack(alignment: .leading)
                    {
                        Text("Ingredients").padding(.bottom,5).font(.title)
                        ForEach(0..<recipeDetail.ingredients.count ,id: \.self){
                            Index in
                            Text("•" + recipeDetail.ingredients[Index].name).padding(.bottom,1)
                            
                        }
                        
                    }.padding(.horizontal, 10.0)
                    Divider()
                    VStack(alignment: .leading)
                    {
                        Text("Directions").padding(.bottom,10).font(.title)
                        ForEach(0..<recipeDetail.directions.count ,id: \.self){
                            Index in
                            Text(String(Index+1) + "•" + recipeDetail.directions[Index]).padding(.bottom,1)
                            
                        }
                        
                    }
                    .padding(.horizontal, 10.0)
                    Spacer()
                }
                
            }
            
        }.navigationBarTitle(recipeDetail.name)
    }
    
    
    
    
}

struct RecipeDetail_Previews: PreviewProvider {
    static var previews: some View {
        let model = MomRecipeModel()
        RecipeDetail(recipeDetail: model.MomRecipeList[0])
    }
}
