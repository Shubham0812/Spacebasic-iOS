//
//  ViewController.swift
//  SpaceBasic
//
//  Created by Shubham Singh on 22/02/20.
//  Copyright © 2020 Shubham Singh. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    static let identifier = "HomeViewController"
    
    var patientData = [SBPatient]()
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK:- lifecycle methods for the view controller
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: "PatientTableViewCell", bundle: nil), forCellReuseIdentifier: PatientTableViewCell.identifier)
        
        SBAPI.getPatientData(pageNo: 2) {(res) in
            print("res", res)
            self.patientData = res!
            self.tableView.reloadData()
        }
    }
    
    //MARK:- table view controller delegates
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return patientData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: PatientTableViewCell.identifier, for: indexPath) as? PatientTableViewCell {
            cell.patientData = patientData[indexPath.row]
            return cell
        }
        fatalError()
    }
    
    
    //MARK:- outlet functions for the view controller
    
    @IBAction func searchButtonClicked(_ sender: Any) {
    }
    
    
    
}

