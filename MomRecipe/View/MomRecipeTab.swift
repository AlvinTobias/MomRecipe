//
//  MomRecipeTab.swift
//  MomRecipe
//
//  Created by Jainy Alvin on 1/7/22.
//

import SwiftUI

struct MomRecipeTab: View {
    var body: some View {
        TabView
        {
            Text("Work In Proogress...")
                .tabItem {
                    ZStack
                    {
                        Image(systemName: "star.fill")
                        Text("Features")
                    }
                }.tag(0)
            
               MomRecipeList()
                .tabItem {
                    ZStack
                    {
                        Image(systemName: "list.bullet")
                        Text("Features")
                    }
                }.tag(1)
        }
        
        
    }
}

struct MomRecipeTab_Previews: PreviewProvider {
    static var previews: some View {
        MomRecipeTab()
    }
}
