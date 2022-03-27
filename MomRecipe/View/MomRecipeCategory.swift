//
//  MomRecipeCategory.swift
//  MomRecipe
//
//  Created by Jainy Alvin on 3/27/22.
//

import SwiftUI

struct MomRecipeCategory: View {
    @EnvironmentObject var recipeModel: MomRecipeModel
    @Binding var TabSection : Int
    
    var body: some View {
        VStack
        {
            
            Text("All Categories").font(Font.custom("Menlo Regular", size: 23))
                .font(.title).bold().foregroundColor(.cyan).shadow(radius: 10)
        
        ScrollView
        {
        LazyVGrid(columns: [GridItem(.flexible(minimum: 100, maximum: 250), spacing: 20, alignment: .top),GridItem(.flexible(minimum: 100, maximum: 250), spacing: 20, alignment: .top)], alignment: .center, spacing: 20) {
            ForEach(Array(recipeModel.categoriesList), id: \.self) {
               Cat in
           
                 
                    Button {
                        
                        recipeModel.categoriesSeletected = Cat
                        TabSection = 2
                        
                    } label: {
                        
                        VStack
                           {
                        Image(Cat).resizable().scaledToFill().frame(width: 150, height: 150, alignment: .center).clipped()
                                .cornerRadius(10)
                        Text(Cat)
                           }
                    }

             
                
               
               
                
            }
            
        }
      
        }
        }.padding(.horizontal)
        
    }
}


