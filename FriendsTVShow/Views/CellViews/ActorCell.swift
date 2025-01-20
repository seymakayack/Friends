//
//  ActorCell.swift
//  FriendsTVShow
//
//  Created by Seyma on 17.01.2025.
//
import UIKit

class ActorCell: UICollectionViewCell {
    
    @IBOutlet weak var actorName: UILabel!
    @IBOutlet weak var actorImage: UIImageView!
    @IBOutlet weak var characterName: UILabel!
    
    override func awakeFromNib() {
            super.awakeFromNib()
            actorImage.layer.cornerRadius = actorImage.frame.size.height / 2
            actorImage.clipsToBounds = true
        }
}
