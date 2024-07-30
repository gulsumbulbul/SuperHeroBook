//
//  ViewController.swift
//  SuperHeroBook
//
//  Created by Gülsüm Bülbül on 30.07.2024.
//

import UIKit

class ViewController: UIViewController, UITabBarDelegate, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var superHeroNames = [String]()
    var superHerosImagesNames = [String]()
    var selectedName = ""
    var selectedImage = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        superHeroNames.append("Iron Man")
        superHeroNames.append("Spider Man")
        superHeroNames.append("Hawkeye")
        superHeroNames.append("Black Widow")
        superHeroNames.append("Hulk")
        superHeroNames.append("Captain America")
        superHeroNames.append("Thor")
        
        superHerosImagesNames.append("ironman")
        superHerosImagesNames.append("spiderman")
        superHerosImagesNames.append("hawkeye")
        superHerosImagesNames.append("blackwidow")
        superHerosImagesNames.append("hulk")
        superHerosImagesNames.append("captainamerica")
        superHerosImagesNames.append("thor")
        
        
    }
    
    // numberOfRowsInSection ---> kaç tane row olacak
    // cellForRow atIndexPath ---> hücre içinde neler gösterilecek

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return superHeroNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = superHeroNames[indexPath.row]
        return cell
    }
    
    // editingStyle -->
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            superHeroNames.remove(at: indexPath.row)
            superHerosImagesNames.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.left)
        }
    }

    //didSelect
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedName = superHeroNames[indexPath.row]
        selectedImage = superHerosImagesNames[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.selectedHeroName = selectedName
            destinationVC.selectedHeroImages = selectedImage
        }
    }
}

