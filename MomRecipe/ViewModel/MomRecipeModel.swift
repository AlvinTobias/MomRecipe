//
//  MomRecipeModel.swift
//  MomRecipe
//
//  Created by Jainy Alvin on 1/4/22.
//

import Foundation
class MomRecipeModel:ObservableObject{
    
    @Published var MomRecipeList:[Recipe] = [Recipe]()
    
    init()
    {
        //I CHANGE THE FUNCTION TO STATIC SO I CAN USE it AS TYPE DATA AND DOESNT NEED TO CREATE THE INTANCE
//        let DataR:DataService = DataService()
//        MomRecipeList = DataR.getRecipeInfo()
        
        // MomRecipeList = DataService().getRecipeInfo()
        
        self.MomRecipeList = DataService.getRecipeInfo()
    }
    
   
    
    
    
    
    
}
