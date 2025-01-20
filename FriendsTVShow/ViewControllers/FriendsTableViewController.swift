//
//  FriendsTableViewController.swift
//  FriendsTVShow
//
//  Created by Seyma on 19.01.2025.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    let tvShowData = [
        "name": "Friends",
        "season": "Season 10",
        "episode": "Episode 236",
        "image": "Friends"
    ]
    
    let tvShowInfoData = [
        "releaseDate": "22 September 1994",
        "genre": "Comedy, Sitcom",
        "synopsis": "Follows the lives of six reckless adults living in Manhattan, as they indulge in adventures which make their lives both troublesome and happening."
    ]
    
    let actorData = [
        ["name": "Jennifer Aniston", "character": "Rachel Green", "image": "Rachel"],
        ["name": "Courteney Cox", "character": "Monica Geller", "image": "Monica"],
        ["name": "Lisa Kudrow", "character": "Phoebe Buffay", "image": "actor_image_placeholder"],
        ["name": "Matt LeBlanc", "character": "Joey Tribbiani", "image": "Joey"],
        ["name": "Matthew Perry", "character": "Chandler Bing", "image": "Chandler"],
        ["name": "David Schwimmer", "character": "Ross Geller", "image": "Ross"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "TVShowName", bundle: nil), forCellReuseIdentifier: "TVShowNameCell")
        tableView.register(UINib(nibName: "TVShowInfo", bundle: nil), forCellReuseIdentifier: "TVShowInfoCell")
        tableView.register(UINib(nibName: "ActorTableViewCell", bundle: nil), forCellReuseIdentifier: "ActorTableViewCell")
        
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TVShowNameCell", for: indexPath) as! TVShowNameCell
            cell.TVShowName.text = tvShowData["name"]
            cell.TVShowSeason.text = tvShowData["season"]
            cell.TVShowEpisode.text = tvShowData["episode"]
            cell.TVShowImage.image = UIImage(named: tvShowData["image"] ?? "")
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TVShowInfoCell", for: indexPath) as! TVShowInfoCell
            cell.ReleaseDate.text = tvShowInfoData["releaseDate"]
            cell.Genre.text = tvShowInfoData["genre"]
            cell.Synopsis.text = tvShowInfoData["synopsis"]
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ActorTableViewCell", for: indexPath) as! ActorTableViewCell
            cell.configure(with: actorData)
            return cell
            
        default:
            fatalError("Unexpected row")
        }
    }
}
