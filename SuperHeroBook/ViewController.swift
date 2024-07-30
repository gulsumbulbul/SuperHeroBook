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
    var superHerosDescription = [String]()
    var selectedName = ""
    var selectedImage = ""
    var selectedDescription = ""
    
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
        
        superHerosDescription.append("Iron Man is a fictional superhero in Marvel Comics, created by Stan Lee, Larry Lieber, Don Heck, and Jack Kirby. A billionaire industrialist and genius inventor, Stark creates a high-tech suit of powered armor to save his life after a near-fatal injury and decides to use this technology to fight evil as Iron Man. With his iconic red and gold armor, Stark becomes a key member of the Avengers and a major character in the Marvel Cinematic Universe, portrayed by Robert Downey Jr.")
        superHerosDescription.append("Spider-Man is a fictional superhero created by writer Stan Lee and writer-artist Steve Ditko, first appearing in Marvel Comics' Amazing Fantasy #15 in 1962. A high school student bitten by a radioactive spider, Peter gains superhuman abilities including wall-crawling, enhanced strength, agility, and a spider-sense that alerts him to danger. With his newfound powers and a sense of responsibility, inspired by his Uncle Ben's mantra, With great power comes great responsibility, Peter becomes the masked hero Spider-Man.")
        superHerosDescription.append("Hawkeye, also known as Clint Barton, is a fictional superhero in Marvel Comics, created by writer Stan Lee and artist Don Heck, first appearing in Tales of Suspense #57 in 1964. A master archer with exceptional marksmanship, Hawkeye uses an array of specialized trick arrows to combat crime and fight alongside other superheroes. Despite having no superhuman abilities, Clint's unparalleled archery skills, keen strategic mind, and extensive training make him a formidable member of the Avengers.")
        superHerosDescription.append("Black Widow, also known as Natasha Romanoff, is a fictional superhero in Marvel Comics, created by writer Stan Lee, scripter Don Rico, and artist Don Heck, first appearing in Tales of Suspense #52 in 1964. A former Russian spy and assassin, Natasha is highly trained in martial arts, espionage, and weaponry. After defecting to the United States, she becomes a key member of the Avengers.")
        superHerosDescription.append("The Hulk, also known as Dr. Bruce Banner, is a fictional superhero in Marvel Comics, created by writer Stan Lee and artist Jack Kirby, first appearing in The Incredible Hulk #1 in 1962. Bruce Banner is a brilliant scientist who, after being exposed to gamma radiation during an experiment gone wrong, transforms into a gigantic, green-skinned creature known as the Hulk whenever he experiences extreme anger or stress. The Hulk possesses immense strength, near invulnerability, and regenerative abilities, but struggles with a childlike, often uncontrollable rage.")
        superHerosDescription.append("Captain America, also known as Steve Rogers, is a fictional superhero in Marvel Comics, created by writer Joe Simon and artist Jack Kirby, first appearing in Captain America Comics #1 in 1941. A frail young man with a strong sense of justice, Steve Rogers undergoes a secret military experiment during World War II, receiving the Super-Soldier Serum, which transforms him into the peak of human physical potential. With his enhanced strength, agility, and endurance, he dons a patriotic costume and wields a virtually indestructible shield made of vibranium.")
        superHerosDescription.append("Thor is a fictional superhero in Marvel Comics, created by writer Stan Lee, scripter Larry Lieber, and artist Jack Kirby, first appearing in Journey into Mystery #83 in 1962. Based on the Norse god of thunder, Thor is the prince of Asgard and the son of Odin, the All-Father. He wields the enchanted hammer Mjölnir, which grants him the ability to control lightning, fly, and perform incredible feats of strength.")
        
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
            superHerosDescription.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.left)
        }
    }

    //didSelect
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedName = superHeroNames[indexPath.row]
        selectedImage = superHerosImagesNames[indexPath.row]
        selectedDescription = superHerosDescription[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.selectedHeroName = selectedName
            destinationVC.selectedHeroImages = selectedImage
            destinationVC.selectedHeroDescription = selectedDescription
        }
    }
}

