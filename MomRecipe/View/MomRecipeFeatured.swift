//
//  MomRecipeFeatured.swift
//  MomRecipe
//
//  Created by Jainy Alvin on 1/10/22.
//

import SwiftUI

struct MomRecipeFeatured: View {
    @EnvironmentObject var recipeModel: MomRecipeModel
    @State var currentfaveSelectionValue = 0
    @State var isButtonTab = false
    
   
    var body: some View {
        
        VStack
        {
            Text("My Favorites").font(.title).bold().foregroundColor(.cyan).shadow(radius: 10)
            GeometryReader {
            geo in
           
                TabView(selection : $currentfaveSelectionValue)
            {
                ForEach (0..<recipeModel.MomRecipeList.count)
                {
                    index in
                    if(recipeModel.MomRecipeList[index].featured)
                    {
                       
                        Button {
                            isButtonTab = true
                        } label: {
                            ZStack
                            {
                                Rectangle().foregroundColor(.white)
                                VStack
                                {
                                    Image(recipeModel.MomRecipeList[index].image).resizable().clipped().aspectRatio(contentMode: .fill)
                                    Text(recipeModel.MomRecipeList[index].name)
                                   
                                }.tag(index)
                            }
                               
                        }
                        .sheet(isPresented: $isButtonTab, onDismiss: didDismiss){
                            RecipeDetail(recipeDetail: recipeModel.MomRecipeList[index])
                        }
                        .buttonStyle(PlainButtonStyle())
                            .frame(width: geo.size.width-40 , height: geo.size.height-100, alignment: .center).cornerRadius(10)
                            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
                        
                    }
                    
                }
                
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }.onAppear {
               getTheFirstIndexFeatured()
            }
        
            VStack
            {
            Text("Preparation Time").bold()
               Text(recipeModel.MomRecipeList[currentfaveSelectionValue].prepTime)
        
            Text("Highlights").bold()
                Text(gethigh())
            }
            
        }
           
    }
    func gethigh() -> String
    {
        var all = ""
        let counter = recipeModel.MomRecipeList[currentfaveSelectionValue].highlights!.count
        for index in 0..<counter
        {
            all += recipeModel.MomRecipeList[currentfaveSelectionValue].highlights![index]
            if( index+1 != counter)
            {
                all += ","
            }
           
        }
        
      return all
            
        }
        
       

    
    func getTheFirstIndexFeatured()
    {
        let indexFirst = recipeModel.MomRecipeList.firstIndex { Res in
            Res.featured
            
        }
        
        currentfaveSelectionValue = indexFirst ?? 0
    }
    
    func didDismiss()
    {
        isButtonTab = false
    }
    
    
   
    
}

struct MomRecipeFeatured_Previews: PreviewProvider {
    static var previews: some View {
        MomRecipeFeatured()
            .environmentObject(MomRecipeModel())
    }
}
