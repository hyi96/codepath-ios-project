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
        ratingScoreLabel.text = "\(professor["overallRating"] as! Float)"
        DeptNameLabel.text = department["name"] as! String
        takeAgainPercentLabel.text = "\(professor["overallTakeAgain"] as! Float)"
        DifficultyScoreLabel.text = "\(professor["overallDifficulty"] as! Float)"
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toRatingTable" {
            let ratingViewController = segue.destination as! RatingViewController
            ratingViewController.professor = professor
            
        }
    }
    
}
