//
//  RatingViewController.swift
//  RMPucsb
//
//  Created by Hao Yi on 11/26/21.
//

import UIKit
import Parse

class RatingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    var ratings = [PFObject]()
    var professor = PFObject(className: "Professor")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let query = PFQuery(className:"Rating")
        query.includeKey("objectId")
        query.whereKey("toProfessor", equalTo: professor)
        query.findObjectsInBackground { ratings, error in
            if ratings != nil {
                self.ratings = ratings!
                self.tableView.reloadData()
            }
        }
    }
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ratings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rating = ratings[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "RatingCell") as! RatingCell
        
        cell.userNameLabel.text = rating["author"] as! String
        cell.commentLabel.text = rating["comment"] as! String
        cell.courseNameLabel.text = rating["courseName"] as! String
        cell.qualityLabel.text = "\(rating["score"] as! Float)"
        cell.difficultyLabel.text = "\(rating["difficulty"] as! Float)"
        cell.gradeLabel.text = rating["grade"] as! String
        cell.attendanceLabel.text = rating["attendance"] as! Bool == true ? "Yes" : "No"
        cell.takeAgainLabel.text = rating["toTakeAgain"] as! Bool == true ? "Yes" : "No"
        let date = rating.updatedAt!
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/YY" //FIXME: date type is not converted properly.
        cell.dateLabel.text = dateFormatter.string(from: date)
        
        return cell
    }

}
