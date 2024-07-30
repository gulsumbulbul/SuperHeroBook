//
//  DetailsViewController.swift
//  SuperHeroBook
//
//  Created by Gülsüm Bülbül on 30.07.2024.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var selectedHeroName = ""
    var selectedHeroImages = ""
    var selectedHeroDescription = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = UIImage(named: selectedHeroImages)
        label.text = selectedHeroName
        descriptionLabel.text = selectedHeroDescription
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
