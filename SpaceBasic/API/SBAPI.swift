//
//  SBAPI.swift
//  SpaceBasic
//
//  Created by Shubham Singh on 22/02/20.
//  Copyright © 2020 Shubham Singh. All rights reserved.
//

import Foundation
import Alamofire


enum SBAPI : URLRequestConvertible {
    
    
    
    class SBPatient: ResponseObjectSerializable, Codable {
        let id: Int
        let userImg: String
        let from: String
        let to: String
        let leaveType: String
        let category: String
        let title: String
        let description: String
        let studentName: String
        let studentRoomNo: String
        let studentBlock: String
        let createdDate: String
        let updatedDate: String
        let leaveStatus: String
        let iconColor: String
        let statusColor: String
        
        required init?(response: HTTPURLResponse, representation: Any) {
            guard
                let representation = representation as? [String: Any],
                let id = representation["id"] as? Int,
                let userImg = representation["user_img"] as? String,
                let from = representation["from"] as? String,
                let to = representation["to"] as? String,
                let leaveType = representation["leavetype"] as? String,
                let category = representation["category"] as? String,
                let title = representation["title"] as? String,
                let description = representation["description"] as? String,
                let studentName = representation["student_name"] as? String,
                let studentRoomNo = representation["student_room_no"] as? String,
                let studentBlock = representation["student_block"] as? String,
                let createdDate = representation["created_date"] as? String,
                let updatedDate = representation["updated_date"] as? String,
                let leaveStatus = representation["leave_status"] as? String,
                let iconColor = representation["icon_color"] as? String,
                let statusColor = representation["status_color"] as? String
                else {
                    return nil
            }
            self.id = id
            self.userImg = userImg
            self.from = from
            self.to = to
            self.leaveType = leaveType
            self.category = category
            self.title = title
            self.description = description
            self.studentName = studentName
            self.studentRoomNo = studentRoomNo
            self.studentBlock = studentBlock
            self.createdDate = createdDate
            self.updatedDate = updatedDate
            self.leaveStatus = leaveStatus
            self.iconColor = iconColor
            self.statusColor = statusColor
        }
        
        private enum CodingKeys: String, CodingKey{
            case id = "id"
            case userImg = "user_img"
            case from = "from"
            case to = "to"
            case leaveType = "leavetype"
            case category = "category"
            case title = "title"
            case description = "description"
            case studentName = "student_name"
            case studentRoomNo = "student_room_no"
            case studentBlock = "student_block"
            case createdDate = "created_date"
            case updatedDate = "updated_date"
            case leaveStatus = "leave_status"
            case iconColor = "icon_color"
            case statusColor = "status_color"
            
        }
    }
    
    case patientData(pageNo: Int)
    
    
    static let endpoint = URL(string: "http://sandbox.spacebasic.com/api/test/")
    
    var path: String {
        switch  self {
        case .patientData(_):
            return "list"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .patientData(_):
            return .get
        }
    }
    
    var encoding : URLEncoding {
        switch self {
        default:
            return .default
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        var request = URLRequest(url: SBAPI.endpoint!.appendingPathComponent(path))
        request.httpMethod = method.rawValue
        var parameters = Parameters()
        
        switch self {
        case .patientData(let pageNo):
            parameters["page"] = pageNo
        }
        
        
        request.addValue("iphone", forHTTPHeaderField: "User-Agent")
        request = try encoding.encode(request, with: parameters)
        
        return request
    }
    
    
    static func getPatientData(pageNo: Int, onCompletion: @escaping([SBPatient]?) -> Void ){
        Alamofire.request(SBAPI.patientData(pageNo: pageNo)).responseJSON {(json) in
            
            if  let payload = json.result.value as?[String: Any], let leaves = payload["leaves"] {
                let jsonData = try! JSONSerialization.data(withJSONObject: leaves, options: .sortedKeys)
                let jsonDecoder = JSONDecoder()
                let patientInfo = try! jsonDecoder.decode([SBPatient].self, from: jsonData)
                onCompletion(patientInfo)
            } else {
                onCompletion(nil)
            }
        }
    }
}





// Alamofire Extensions
protocol ResponseObjectSerializable {
    init?(response: HTTPURLResponse, representation: Any)
}
