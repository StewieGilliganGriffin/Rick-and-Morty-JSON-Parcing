//
//  ViewController.swift
//  Rick and Morty JSON Parcing
//
//  Created by Гаджи Агаханов on 09.06.2021.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    var characters: Characters?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloadJSON {
            self.tableView.reloadData()
        }
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters!.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = characters!.results[indexPath.row].name.capitalized
        return cell
    }

    func downloadJSON(completed: @escaping () -> ()) {
        
        
        let url = URL(string: "https://rickandmortyapi.com/api/character")

        URLSession.shared.dataTask(with: url!) { (data, response, error) in

            if error == nil {
                do {
                    self.characters = try JSONDecoder().decode(Characters.self, from: data!)
                    
                    DispatchQueue.main.async {
                        completed()
                    }
                } catch  {
                    print("JSON ERROR")
                }
                
                }
        }.resume()
    }

}

