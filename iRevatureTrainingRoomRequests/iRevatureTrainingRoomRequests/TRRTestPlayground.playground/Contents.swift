import UIKit
import AlamoFire

AF.request(
    URL(string: "https://private-dbd7b7-security14.apiary-mock.com/coredata/location?type=training")!,
       method: .get,
       parameters: currentUserDefaults.string(forKey: userInfo.getUserInfo()!.token),
       encoder: JSONParameterEncoder.default
).validate().responseDecodable(of: locationStatus.self){(response) in
    guard let location = response.value else{
        print("Error appeared")
        print(response.error?.errorDescription! ?? "Unknown error found")
        return
    }
    completionHandler(location.locationsArray)
}
