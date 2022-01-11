//
//  DataService.swift
//  MomRecipe
//
//  Created by Jainy Alvin on 1/4/22.
//

import Foundation
class DataService{
    
    
    //var FullRepice:[Recipe] = [Recipe]()
    
    static func getRecipeInfo()->[Recipe]
    {
        
        //GET THE PATH FROM THE BUNDLE
        let path = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        guard path != nil else
        {
            return [Recipe]()
        }
        //GET THE URL
        let URLPath = URL.init(fileURLWithPath: path!)
        
        //GET TGE DATA OBJECT
        do
        {
            let RecipeData = try Data(contentsOf: URLPath)
            
            let JsonRecipeDecoder = JSONDecoder()
            
            do
            {
                let MomrecipeJsondata = try JsonRecipeDecoder.decode([Recipe].self, from: RecipeData)
                
                for recipeID in MomrecipeJsondata {
                    recipeID.id = UUID()
                    
                    for indgrident in recipeID.ingredients
                    {
                        indgrident.id = UUID();
                    }
                    
                }
                
                return MomrecipeJsondata
            }
            catch
            {
                print(error)
            }
            
        }
        catch
        {
            print(error)
        }
        
        
        return [Recipe]()
        
    }
    
}
