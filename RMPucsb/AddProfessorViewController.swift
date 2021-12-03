//
//  AddProfessorViewController.swift
//  RMPucsb
//
//  Created by Hao Yi on 12/3/21.
//

import UIKit
import Parse

class AddProfessorViewController: UIViewController {

    
    @IBOutlet var nameLabel: UITextField!
    @IBOutlet var departmentNameLabel: UILabel!
    
    var department = PFObject(className: "Department")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        departmentNameLabel.text = department["name"] as! String
    }
    
    @IBAction func on_cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func on_add(_ sender: Any) {
        if nameLabel.text != "" {
            let professor = PFObject(className: "Professor")
            professor["name"] = nameLabel.text
            professor["ratingCount"] = 1
            professor["overallTakeAgain"] = 100
            professor["overallRating"] = 3.0
            professor["overallDifficulty"] = 3.0
            
            let relation = professor.relation(forKey: "department")
            relation.add(department)
            
            professor.saveInBackground {(success, error) in
                if success {
                    print("professor added!")
                    self.dismiss(animated: true, completion: nil)
                } else{
                    print("error!")
                }
            }
        }
    }
    
}
