//
//  DepartmentListViewController.swift
//  RMPucsb
//
//  Created by Hao Yi on 11/17/21.
//

import UIKit
import Parse

class DepartmentListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    var departments = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let query = PFQuery(className: "Department")
        query.includeKey("objectId")
        
        //return all objects from Department class
        query.findObjectsInBackground { departments, error in
            if departments != nil {
                self.departments = departments!
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return departments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DepartmentCell") as! DepartmentCell
        let department = departments[indexPath.row]
        cell.departmentNameLabel.text = department["name"] as! String
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)!
        let department = departments[indexPath.row]
        
        let professorListViewController = segue.destination as! ProfessorListViewController
        
        //pass selected department object to ProfessorList screen
        professorListViewController.department = department
        
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
