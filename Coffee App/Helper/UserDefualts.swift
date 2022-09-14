

import Foundation
class projectUserDefualts {
    static let USER_TOKEN = "user token"
    static func setUserToken(token:String){
        UserDefaults.standard.set(token,forKey: USER_TOKEN)
    }

    static func getUserToken ()-> String {
        if let token = UserDefaults.standard.string(forKey: USER_TOKEN){return token}
        return "nothing found"
    }




}
