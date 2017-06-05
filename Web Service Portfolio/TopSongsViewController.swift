//
//  TopSongsViewController.swift
//  Web Service Portfolio
//
//  Created by Justin Tappert on 6/4/17.
//  Copyright © 2017 Justin Tappert. All rights reserved.
//

import UIKit

class Song {
    let name: String
    let artist: String
    
    init(name: String, artist: String) {
        self.name = name
        self.artist = artist
    }
}

class TopSongsViewController: UITableViewController {
    let cellReuseIdentifier = "SongCell"
    
    
    let songs = [
        "Song 1": "1",
        "Song 2": "2",
        "Song 3": "3",
        "Song 4": "4",
        "Song 5": "5",
        "Song 6": "6",
        "Song 7": "7",
        "Song 8": "8"
        ].map { k, v in Song(name: k, artist: v) }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        let song = songs[indexPath.row]
        
        if let label = cell.textLabel {
            label.text = song.name
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "songDetailSegue") {
            if let detailController = segue.destination as? DetailViewController,
               let cell = sender as? UITableViewCell,
               let indexPath = self.tableView.indexPath(for: cell),
                indexPath.row < songs.count {
                        let song = songs[indexPath.row]
                        let details = song.artist
                        detailController.songArtist = details
            }
        }
    }
    
    
    
    
}
