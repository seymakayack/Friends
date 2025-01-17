//
//  MovieViewController.swift
//  Friends
//
//  Created by Seyma on 15.01.2025.
//

import UIKit

class FriendsDetailsViewController: UIViewController {

    private let tableView = UITableView()
    private var movieDetails: [Movie] = [] // TV show details
    private var actors: [Cast] = [] // List of actors for the show
    private let networkManager: NetworkManager = NetworkManager()
    let friendsId: Int = 1668 // ID for Friends TV show

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchFriendsDetails()
        fetchActors()
    }

    private func setupUI() {
        view.backgroundColor = .white
        title = "Friends Details"

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func fetchFriendsDetails() {
        startLoading()
        networkManager.fetchMovie { [weak self] (result: Result<Movie, Error>) in
            guard let weakSelf = self else { return }
            weakSelf.stopLoading()
            switch result {
            case .success(let movie):
                if movie.name.lowercased() == "friends" {
                    weakSelf.populateDetails(for: movie)
                } else {
                    weakSelf.showError(message: "Friends TV show not found.")
                }
            case .failure(let error):
                weakSelf.showError(message: error.localizedDescription)
            }
        }
    }

    private func fetchActors() {
        networkManager.fetchActors(movieId: friendsId) { [weak self] (result: Result<Actor, Error>) in
            guard let weakSelf = self else { return }
            switch result {
            case .success(let welcome):
                weakSelf.actors = welcome.cast
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                weakSelf.showError(message: error.localizedDescription)
            }
        }
    }

    private func populateDetails(for movie: Movie) {
        movieDetails = [movie]
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    private func startLoading() {
        // Start loading indicator
    }

    private func stopLoading() {
        // Stop loading indicator
    }

    private func showError(message: String) {
        let alert = UIAlertController(
            title: "Error",
            message: message,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

extension FriendsDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2 // One section for movie details, another for actors
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return movieDetails.count
        } else {
            return actors.count // Number of actors
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        if indexPath.section == 0 {
            // Movie details cell
            let movie = movieDetails[indexPath.row]
            cell.textLabel?.text = """
            Name: \(movie.name)
            Language: \(movie.originalLanguage)
            Popularity: \(movie.popularity)
            Overview: \(movie.overview)

            Seasons: \(movie.numberOfSeasons)
            Created By: \(movie.createdBy.map { $0.name }.joined(separator: ", "))
            """
            cell.textLabel?.numberOfLines = 0
        } else {
            // Actor details cell
            let actor = actors[indexPath.row]
            cell.textLabel?.text = "Actor: \(actor.name), Character: \(actor.character ?? "N/A")"
        }

        return cell
    }
}
