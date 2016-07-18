//
//  Product.swift
//  StyleShaker
//
//  Created by Etudiant on 28/06/2016.
//  Copyright © 2016 esgi. All rights reserved.
//

import Foundation

class Product {
    var id: String
    var title: String
    var picture: String
    var about: String
    var tags: [String]
    var mood: [String : Bool]
    var gender: [String : Bool]
    var hair: [String : Bool]
    var skin: [String : Bool]
    
    init(fromId id:String, fromTitle title:String, fromPicture picture:String, fromAbout about:String, fromTags tags:[String], fromMood mood:[String : Bool], fromGender gender:[String : Bool], fromHair hair:[String:Bool], fromSkin skin:[String:Bool]){
        self.id = id
        self.title = title
        self.picture = picture
        self.about = about
        self.tags = tags
        self.mood = mood
        self.gender = gender
        self.hair = hair
        self.skin = skin
    }
}