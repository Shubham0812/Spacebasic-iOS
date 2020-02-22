//
//  PatientTableViewCell.swift
//  SpaceBasic
//
//  Created by Shubham Singh on 22/02/20.
//  Copyright © 2020 Shubham Singh. All rights reserved.
//

import UIKit
import AlamofireImage

class PatientTableViewCell: UITableViewCell {
    
    static let identifier = "PatientTableViewCell"
    
    //MARK:- outlets for the cell
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var regularView: UIView!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var userImageButton: UIButton!
    @IBOutlet weak var leaveTypeImageView: UIImageView!
    @IBOutlet weak var leaveTypeLabel: UILabel!
    @IBOutlet weak var appliedOnLabel: UILabel!
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryTypeLabel: UILabel!
    @IBOutlet weak var studentNameLabel: UILabel!
    @IBOutlet weak var studentBlockLabel: UILabel!
    @IBOutlet weak var leaveType: UILabel!
    
    @IBOutlet weak var studentRoomLabel: UILabel!
    
    fileprivate lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    fileprivate lazy var newDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd yyyy"
        return formatter
    }()
    
    
    var patientData: SBPatient? {
        didSet{
            //            userImageButton.af_setImage(for: .normal, url: URL(string: patientData!.userImg)!)
            self.studentNameLabel.text = patientData?.studentName
            self.studentBlockLabel.text = patientData!.studentBlock + " Block"
            self.studentRoomLabel.text = patientData?.studentRoomNo
            if let date = patientData?.from {
                let splitStartDate = date.components(separatedBy: " ")
                let startDate = self.newDateFormatter.string(from: dateFormatter.date(from: splitStartDate[0])!)
                self.appliedOnLabel.text = "Applied on \(startDate)"
                self.leaveType.text = patientData?.leaveType
                self.durationLabel.text =  "\(startDate)"
            }
            
            
            if let date = patientData?.to {
                let endDate = self.newDateFormatter.string(from: dateFormatter.date(from: date.components(separatedBy: " ")[0])!)
                self.durationLabel.text! += " to " + endDate
            }
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.containerView.layer.shadowColor = UIColor.black.cgColor
        self.containerView.layer.shadowOpacity = 0.4
        self.containerView.layer.shadowRadius = 1
        self.regularView.roundCorners(corners: .topLeft, radius: 15)
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
