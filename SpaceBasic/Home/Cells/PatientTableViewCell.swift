//
//  PatientTableViewCell.swift
//  SpaceBasic
//
//  Created by Shubham Singh on 22/02/20.
//  Copyright © 2020 Shubham Singh. All rights reserved.
//

import UIKit
import Alamofire

class PatientTableViewCell: UITableViewCell {

    static let identifier = "PatientTableViewCell"
    
    //MARK:- outlets for the cell
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var regularView: UIView!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var leaveTypeImageView: UIImageView!
    @IBOutlet weak var leaveTypeLabel: UILabel!
    @IBOutlet weak var appliedOnLabel: UILabel!
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryTypeLabel: UILabel!
    @IBOutlet weak var studentNameLabel: UILabel!
    @IBOutlet weak var studentBlockLabel: UILabel!
    
    @IBOutlet weak var studentRoomLabel: UILabel!
    
    
    var patientData: SBPatient? {
        didSet{
            print(URL(string: patientData!.userImg))
            Alamofire.request(URL(string: patientData!.userImg)!, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).response { (response ) in
                
                switch response {
                    
                }
                self.userImage.image  = UIImage(data: response, scale: 1)
                print (response)
            }
//            Alamofire.request().response { (request, response, data, error) in
//                 self.myImageView.image = UIImage(data: data, scale:1)
//             }
//            userImage.image = af_setImage(for: .normal, url: URL(string: patientData?.userImg))

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
