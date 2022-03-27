//
//  MomRecipeTab.swift
//  MomRecipe
//
//  Created by Jainy Alvin on 1/7/22.
//

import SwiftUI

struct MomRecipeTab: View {
    @State var tabSelection = 0
    
    var body: some View {
       
        TabView(selection: $tabSelection)
        {
                MomRecipeFeatured()
                    .tabItem {
                        ZStack
                        {
                            Image(systemName: "star.fill")
                            Text("Features")
                        }
                    }.tag(0)
                
                MomRecipeCategory(TabSection: $tabSelection)
                 .tabItem {
                     ZStack
                     {
                         Image(systemName: "filemenu.and.selection")
                         Text("Category")
                     }
                 }.tag(1)
                
                   MomRecipeList()
                    .tabItem {
                        ZStack
                        {
                            Image(systemName: "list.bullet")
                            Text("List")
                        }
                    }.tag(2)
            }.environmentObject(MomRecipeModel())
        
//        {
//            MomRecipeFeatured()
//                .tabItem {
//                    ZStack
//                    {
//                        Image(systemName: "star.fill")
//                        Text("Features")
//                    }
//                }.tag(0)
//
//            MomRecipeCategory()
//             .tabItem {
//                 ZStack
//                 {
//                     Image(systemName: "filemenu.and.selection")
//                     Text("Category")
//                 }
//             }.tag(1)
//
//               MomRecipeList()
//                .tabItem {
//                    ZStack
//                    {
//                        Image(systemName: "list.bullet")
//                        Text("List")
//                    }
//                }.tag(2)
//        }.environmentObject(MomRecipeModel())
        
        
    }
}

struct MomRecipeTab_Previews: PreviewProvider {
    static var previews: some View {
        MomRecipeTab()
    }
}
