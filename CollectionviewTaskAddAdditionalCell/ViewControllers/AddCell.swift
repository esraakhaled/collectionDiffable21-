//
//  AddCell.swift
//  CollectionviewTaskAddAdditionalCell
//
//  Created by Esraa Khaled   on 29/08/2022.
//

import UIKit

class AddCell: UICollectionViewCell {
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
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
           
            setNeedsLayout()
            layoutIfNeeded()
           
            let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
           
            var frame = layoutAttributes.frame
            frame.size.height = ceil(size.height)
            layoutAttributes.frame = frame
           
            return layoutAttributes
        }
}
