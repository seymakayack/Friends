//
//  TVShowNameCell.swift
//  FriendsTVShow
//
//  Created by Seyma on 19.01.2025.
//
import UIKit

class TVShowNameCell: UITableViewCell{
   
  
    @IBOutlet weak var TVShowEpisode: UILabel!
    @IBOutlet weak var TVShowSeason: UILabel!
    @IBOutlet weak var TVShowImage: UIImageView!
    @IBOutlet weak var TVShowName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
