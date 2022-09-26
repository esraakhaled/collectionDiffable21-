//
//  Model.swift
//  CollectionviewTaskAddAdditionalCell
//
//  Created by Esraa Khaled   on 30/08/2022.
//
import UIKit
struct Model: Hashable,Equatable{
    //MARK: - Properties
    let id = UUID()
    //let color : UIColor
    let name:String
    //let image: UIImage?
   
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
   static func == (lhs: Model, rhs: Model) -> Bool {
       return lhs.id == rhs.id
    }
   init(name: String){
        self.name = name
       // self.image = image
       //self.color = color
    }
}

