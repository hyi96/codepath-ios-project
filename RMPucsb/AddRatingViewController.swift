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
    
    @IBOutlet weak var commentField: UITextView!
    
    
    @IBAction func onAddButton(_ sender: Any) {
        
        let rating = PFObject(className: "Rating")
        let quality = Int(qualityField.text!)
        let difficulty = Int(difficultyField.text!)
        
//        rating['toProfessor'] = ???
        rating["author"] = PFUser.current()!
        rating["courseName"] = courseField.text!
        rating["quarter"] = quarterField.text!
        rating["score"] = quality
        rating["difficulty"] = difficulty
        rating["grade"] = gradeField.text!
        
        if (attendanceField.text! == "yes"){
            rating["attendance"] = true
        } else {
            rating["attendance"] = false
        }
        
        if (takeagainField.text! == "yes"){
            rating["toTakeAgain"] = true
        } else {
            rating["toTakeAgain"] = false
        }
        
        rating.saveInBackground {(success, error) in
            if success {
                self.dismiss(animated: true, completion: nil)
                print("saved!")
            } else{
                print("error!")
            }
        }
        
        
        
    }
    
    
    @IBAction func onCancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
