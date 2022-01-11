//
//  MomRecipeFeatured.swift
//  MomRecipe
//
//  Created by Jainy Alvin on 1/10/22.
//

import SwiftUI

struct MomRecipeFeatured: View {
    @EnvironmentObject var recipeModel: MomRecipeModel
    
    var body: some View {
        
        VStack
        {
            Text("My Favorites").font(.title).bold().foregroundColor(.cyan).shadow(radius: 10)
            GeometryReader {
            geo in
            
            TabView
            {
               
                ForEach (0..<recipeModel.MomRecipeList.count)
                {
                    index in
                    if(recipeModel.MomRecipeList[index].featured)
                    {
                        ZStack
                        {
                            Rectangle().foregroundColor(.white)
                            VStack
                            {
                                Image(recipeModel.MomRecipeList[index].image).resizable().clipped().aspectRatio(contentMode: .fill)
                                Text(recipeModel.MomRecipeList[index].name)
                            }
                        }
                            .frame(width: geo.size.width-40 , height: geo.size.height-100, alignment: .center).cornerRadius(10)
                            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
                        
                    }
                    
                }
               
                  
                
                
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
        
            VStack
            {
            Text("Preparation Time").bold()
            Text("Highlights").bold()
            }
            
        }
           
    }
}

struct MomRecipeFeatured_Previews: PreviewProvider {
    static var previews: some View {
        MomRecipeFeatured()
            .environmentObject(MomRecipeModel())
    }
}
