//
//  ActorViewController.swift
//  Friends
//
//  Created by Seyma on 16.01.2025.
//

import UIKit

class ActorViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var actors: [Actor] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        actors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = Bundle.main.loadNibNamed("ActorCell", owner: self, options: nil)?.first as! ActorCell
        return cell
    }
}

