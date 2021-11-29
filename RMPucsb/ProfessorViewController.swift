//
//  ProfessorViewController.swift
//  RMPucsb
//
//  Created by Hao Yi on 11/17/21.
//

import UIKit
import Parse

class ProfessorViewController: UIViewController {
        
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var DeptNameLabel: UILabel!
    @IBOutlet var ratingScoreLabel: UILabel!
    @IBOutlet var takeAgainPercentLabel: UILabel!
    @IBOutlet var DifficultyScoreLabel: UILabel!
    
    @IBOutlet var ratingTableView: UITableView!
    
    @IBAction func rateProf(_ sender: Any) {
        
        
    }
    
    
    var professor = PFObject(className: "Professor")
    var department = PFObject(className: "Department")
    
    var ratings = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = professor["name"] as! String
        ratingScoreLabel.text = "\(round(professor["overallRating"] as! Double * 10) / 10.0)"
        DeptNameLabel.text = department["name"] as! String
        takeAgainPercentLabel.text = "\(round(professor["overallTakeAgain"] as! Double * 10) / 10.0)"
        DifficultyScoreLabel.text = "\(round(professor["overallDifficulty"] as! Double * 10) / 10.0)"
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toRatingTable" {
            let ratingViewController = segue.destination as! RatingViewController
            ratingViewController.professor = professor
        }
        
        if segue.identifier == "toAddRatingScreen" {
            let addRatingViewController = segue.destination as! AddRatingViewController
            addRatingViewController.professor = professor
        }
    }
}
