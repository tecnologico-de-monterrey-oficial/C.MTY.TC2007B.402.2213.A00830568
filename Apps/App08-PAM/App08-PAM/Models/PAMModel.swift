//
//  PAMModel.swift
//  App08-PAM
//
//  Created by Edgar Alexandro on 26/09/22.
//

import SwiftUI
import Alamofire
import SwiftyJSON

class PAMModel: ObservableObject{
    
    @Published var pams = [PAM]()
    
    init() {
        loadPAMs()
    }
    
    func loadPAMs(){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        pams.removeAll()
        let URL = "http://10.14.255.61:3000/api/getPams"
        
        AF.request(URL, method: .get, encoding: URLEncoding.default).responseData { data in
            let json = try! JSON(data: data.data!)
            //            print(json)
            var auxPam: PAM
            for pam in json{
                auxPam = PAM(
                    id: pam.1["pam_id"].intValue,
                    name:pam.1["name"].stringValue,
                    birth_date:formatter.date(from:pam.1["birth_day"].stringValue)!,
                    gender:pam.1["gender"].stringValue)
                self.pams.append(auxPam)
            }
        }
    }
    
    func deletePAM(pam: PAM){
        let URL = "http://10.14.255.61:3000/api/deletePam/\(pam.id)"
        AF.request(URL, method: .get, encoding: URLEncoding.default).responseData { data in
            print(data.data!)
        }
    }
    
    func addPAM(pam: PAM){
        let URL = "http://10.14.255.61:3000/api/addPam"
        var body: [String: Any] = [
            "name": pam.name,
            "birth_day": "2001-09-12",
            "gender": pam.gender
        ]
        print(body)
        AF.request(URL, method: .post, parameters: body, encoding: URLEncoding.default).responseJSON { data in
            print(data.response)
        }
    }
}
