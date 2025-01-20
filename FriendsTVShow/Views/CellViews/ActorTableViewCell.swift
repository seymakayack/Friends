//
//  ActorsTableViewCell.swift
//  FriendsTVShow
//
//  Created by Seyma on 19.01.2025.
//

import UIKit

class ActorTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
   
    @IBOutlet weak var ActorsLabel: NSLayoutConstraint!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var actors: [[String: String]] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let nib = UINib(nibName: "Actor", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "ActorCell")
    }
    
    func configure(with actors: [[String: String]]) {
            self.actors = actors
            collectionView.reloadData()
        }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return actors.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ActorCell", for: indexPath) as! ActorCell
            let actor = actors[indexPath.item]
            cell.actorName.text = actor["name"]
            cell.characterName.text = actor["character"]
            cell.actorImage.image = UIImage(named: actor["image"] ?? "")
            return cell
        }
}

