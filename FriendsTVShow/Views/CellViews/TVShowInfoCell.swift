//
//  TVShowInfoCell.swift
//  FriendsTVShow
//
//  Created by Seyma on 19.01.2025.
//
import UIKit

class TVShowInfoCell: UITableViewCell {
    
    @IBOutlet weak var ReleaseDateTitle: UILabel!
    
    @IBOutlet weak var Synopsis: UITextView!
    @IBOutlet weak var SynopsisTitle: UILabel!
    @IBOutlet weak var Genre: UILabel!
    @IBOutlet weak var GenreTitle: UILabel!
    @IBOutlet weak var ReleaseDate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
