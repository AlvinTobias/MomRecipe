//
//  ContentView.swift
//  MomRecipe
//
//  Created by Jainy Alvin on 1/4/22.
//

import SwiftUI

struct MomRecipeList: View {
    // @ObservedObject var RecipeModel:MomRecipeModel = MomRecipeModel()
    @EnvironmentObject var RecipeModel:MomRecipeModel
    
    var body: some View {
        VStack
        {
            Text("Mom's Recipe").font(.title).bold().foregroundColor(.cyan).shadow(radius: 10)
            NavigationView
            {
                ScrollView
                {
                    
                    LazyVStack(alignment : .leading)
                    {
                        ForEach (RecipeModel.MomRecipeList) { A in
                            //List(RecipeModel.MomRecipeList) {A in
                            NavigationLink {
                                RecipeDetail(recipeDetail: A)
                            } label: {
                                HStack
                                {
                                    Image(A.image).resizable().frame(width: 100, height: 100, alignment: .leading).clipped().cornerRadius(20).scaledToFill()
                                    VStack(alignment: .leading)
                                    {
                                        Spacer()
                                        Text(A.name).font(.title3)
                                        Spacer()
                                        HStack
                                        {
                                            Text("Servings:" + String(A.servings)).font(.subheadline)
                                            Text("Time:" + String(A.totalTime)).font(.subheadline)
                                            
                                        }
                                        Spacer()
                                        
                                    }
                                }
                                .padding(.bottom, 10.0)
                                
                                //}.navigationTitle("Isabel Recipe")
                            }.navigationBarHidden(true)
                            
                        }
                    }.padding(.leading ,10)
                }
                
                
                //.environment(\.defaultMinListRowHeight, 150)
                
                
                
            }
            
            Spacer()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MomRecipeList().environmentObject(MomRecipeModel())
    }
}
