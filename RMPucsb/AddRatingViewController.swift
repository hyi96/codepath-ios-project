//
//  AddRatingViewController.swift
//  RMPucsb
//
//  Created by xuanedx on 11/27/21.
//

import UIKit
import Parse

class AddRatingViewController: UIViewController{
    
    @IBOutlet weak var courseField: UITextField!
    
    @IBOutlet weak var quarterField: UITextField!
    
    @IBOutlet weak var qualityField: UITextField!
    
    @IBOutlet weak var difficultyField: UITextField!
    
    @IBOutlet weak var gradeField: UITextField!
    
    @IBOutlet weak var attendanceField: UITextField!
    
    @IBOutlet weak var takeagainField: UITextField!
        
    @IBOutlet var commentField: UITextView!
    
    
    var professor = PFObject(className: "Professor")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(professor["name"] as! String)
    }
    
    
    @IBAction func onAddButton(_ sender: Any) {
        
        let rating = PFObject(className: "Rating")
        let quality = Int(qualityField.text!)!
        let difficulty = Int(difficultyField.text!)!
        
        rating["author"] = PFUser.current()?.username as! String
        rating["courseName"] = courseField.text!
        rating["quarter"] = quarterField.text!
        rating["score"] = quality
        rating["difficulty"] = difficulty
        rating["grade"] = gradeField.text!
        rating["comment"] = commentField.text!
        
        let relation = rating.relation(forKey: "toProfessor")
        relation.add(professor)
        
        if (attendanceField.text! == "yes"){
            rating["attendance"] = true
        } else {
            rating["attendance"] = false
        }
        
        var takeAgainCount = 0
        if (takeagainField.text! == "yes"){
            rating["toTakeAgain"] = true
            takeAgainCount = 1
        } else {
            rating["toTakeAgain"] = false
        }
        
        let currRating = professor["overallRating"] as! Double
        let currDifficulty = professor["overallDifficulty"] as! Double
        let currTakeAgain = professor["overallTakeAgain"] as! Double
        let count = professor["ratingCount"] as! Double
        professor["overallRating"] = (currRating * count + Double(quality)) / (count + 1)
        professor["overallDifficulty"] = (currDifficulty * count + Double(difficulty)) / (count + 1)
        professor["overallTakeAgain"] = (currTakeAgain/100.0 * count + Double(takeAgainCount)) / (count + 1) * 100.0
        professor.incrementKey("ratingCount")
        
        rating.saveInBackground {(success, error) in
            if success {
                print("rating saved!")
                self.professor.saveInBackground {(success, error) in
                    if success {
                        print("professor updated")
                    } else {
                        print("error")
                    }
                }
                self.dismiss(animated: true, completion: nil)
            } else{
                print("error!")
            }
        }
    }
    
    @IBAction func onCancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
