//
//  Recipe.swift
//  MomRecipe
//
//  Created by Jainy Alvin on 1/4/22.
//

import Foundation
class Recipe:Identifiable,Decodable {
    
    var id:UUID?
    var name:String
    var featured:Bool
    var image:String
    var description:String
    var prepTime:String
    var cookTime:String
    var totalTime:String
    var servings:Int
    var highlights:[String]?
    var ingredients:[ingredients]
    var directions:[String]
    
    
}

class ingredients:Identifiable,Decodable
{
    var id:UUID?
    var name:String
    var num: Int?
    var unit: String?
    var denom : Int?
}

