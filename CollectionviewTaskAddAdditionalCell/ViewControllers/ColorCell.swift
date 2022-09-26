//
//  ColorCell.swift
//  CollectionviewTaskAddAdditionalCell
//
//  Created by Esraa Khaled   on 29/08/2022.
//

import UIKit

class ColorCell: UICollectionViewCell {
    static let reuseIdentifier = "ColorCell"
    @IBOutlet weak var musicImg: UIImageView!
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var musicTxt: UILabel!
//    var color: ColorModel? {
//      didSet {
//          musicImg.image = color?.image
//          musicTxt.text = color?.name
//          contentView.backgroundColor = color?.color
//      }
//    }
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
