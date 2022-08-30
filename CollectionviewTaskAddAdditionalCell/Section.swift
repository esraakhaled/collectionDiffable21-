//
//  Section.swift
//  CollectionviewTaskAddAdditionalCell
//
//  Created by Esraa Khaled   on 29/08/2022.
//

import UIKit
// 1
class Section: Hashable {
  var id = UUID()
 
  var colorrs: [ColorModel]
  
  init(colorrs: [ColorModel]) {
    
    self.colorrs = colorrs
  }
  
  func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }
  
  static func == (lhs: Section, rhs: Section) -> Bool {
    lhs.id == rhs.id
  }
}

extension Section {
  static var allSections: [Section] = [
    Section(colorrs: [
        ColorModel(name: "Play music", image: UIImage(named: "play music"), color: UIColor.random()),
        ColorModel(name: "Pause Music", image: UIImage(named:"pause music"), color: UIColor.random()),
        ColorModel(name: "skip back", image: UIImage(named:"skip back"), color: UIColor.random()),
        ColorModel(name: "skip forward", image: UIImage(named: "skip forward"), color: UIColor.random()),
        ColorModel(name: "clear all clipboards", image:  UIImage(named: "clear"), color: UIColor.random()),
        ColorModel(
          name: "Get clipboard", image: UIImage(named: "get"), color: UIColor.random()),
        ColorModel(name: "Translate Clipboard", image: UIImage(named: "translate"), color: UIColor.random()),
        ColorModel(name: "change clipboard", image: UIImage(named: "cut"), color: UIColor.random()),
        ColorModel(name: "iphone battery level", image: UIImage(named: "battery"), color: UIColor.random()),
        ColorModel(name: "play playlist 1", image: UIImage(named: "music"), color: UIColor.random()),
       //ColorModel(name: "CreateWorkSpace", image:UIImage(named:"plus") , color:UIColor.gray )
        
    ]),
 Section(colorrs: [
   
      ColorModel(name: "CreateWorkSpace", image:UIImage(named:"plus") , color:UIColor.gray )
//       
    ]),
    
  ]
}

