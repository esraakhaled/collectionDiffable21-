//
//  ColorModel.swift
//  CollectionviewTaskAddAdditionalCell
//
//  Created by Esraa Khaled   on 29/08/2022.
//

import UIKit

struct ColorModel: Hashable,Equatable{
    //MARK: - Properties
    let id = UUID()
    let color : UIColor
    let name:String
    let image: UIImage?
   
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    static func ==(lhs: ColorModel, rhs: ColorModel) -> Bool {
        return lhs.id == rhs.id
    }
   init(name: String,image: UIImage? = nil,color: UIColor){
        self.name = name
        self.image = image
       self.color = color
    }
}
