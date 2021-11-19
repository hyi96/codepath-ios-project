//
//  ProfessorListViewController.swift
//  RMPucsb
//
//  Created by Hao Yi on 11/17/21.
//

import UIKit
import Parse

class ProfessorListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    var professors = [PFObject]()
    var department = PFObject(className: "Department")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(department["name"] as! String)
        
        let query = PFQuery(className:"Professor")
        query.includeKey("objectId")
        query.whereKey("department", equalTo: department)
        query.findObjectsInBackground { professors, error in
            if professors != nil {
                self.professors = professors!
                self.tableView.reloadData()
            }
        }
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return professors.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfessorCell") as! ProfessorCell
        let professor = professors[indexPath.row]
        cell.professorNameLabel.text = professor["name"] as! String
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)!
        let professor = professors[indexPath.row]
        
        let professorViewController = segue.destination as! ProfessorViewController
        professorViewController.professor = professor
        
        tableView.deselectRow(at: indexPath, animated: true)
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
