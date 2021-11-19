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
    @IBOutlet var ratingScoreLabel: UILabel!
    
    
    var professor = PFObject(className: "Professor")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = professor["name"] as! String
        ratingScoreLabel.text = "\(professor["overallRating"] as! Float)"
        
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
