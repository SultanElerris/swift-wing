//
//  RootViewController.swift
//  Swift-Wing
//
//  Created by Sultan R. Sultan on 1/1/17.
//  Copyright © 2017 com.elerris. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    
    enum RootType: String{
        case people = "people"
        case planets = "planets"
        case films = "films"
        case species = "species"
        case vehicles = "vehicles"
        case starships = "starships"
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    var rootArray = [String]() {
        didSet {
            self.reloadTableData()
        }
    }
    
    //let viewModel = RootViewViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register cell classes
        tableView.register(UINib(nibName: RootTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: RootTableViewCell.reuseIdentifier)
        
        self.fetchDataForRoot()
    
    }
    
    
    func fetchDataForRoot() {
        SWAPIDataStore.sharedInstance.getDataForRoot(serviceURL: "https://swapi.co/api/people/?format=json", completion: { (request, response) -> Void in
            
            if let array = request?.array{
                self.rootArray = array
                
            }
        })
    }
    
    func reloadTableData() {
        
        if let table = tableView {
            table.reloadData()
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getTitleForCell(atIndex:Int) -> String {
        return rootArray[atIndex]
    }
}

extension RootViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rootArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RootTableViewCell.reuseIdentifier, for: indexPath) as? RootTableViewCell else { fatalError("Unexpected Table View Cell") }
        cell.titleLabel.text = self.getTitleForCell(atIndex: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let currentCell = tableView.cellForRow(at: indexPath) as? RootTableViewCell {
            
            switch currentCell.titleLabel.text {
            case RootType.people.rawValue?:
                performSegue(withIdentifier: RootType.people.rawValue, sender: nil)
            default:
                print("default")
            }
        }
            
        }
        
        
       
}
