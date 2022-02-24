//
//  ViewController.swift
//  URLSessionStartProject
//
//  Created by Alexey Pavlov on 29.11.2021.
//

import UIKit

let publicKey = "938b87d66cedff099f79d7b772d3a1f9"
let privateKey = "8536545c3439cee74d2ea74fa27c7795d35682a8"

class ViewController: UIViewController {

    private let endpointClient = EndpointClient(applicationSettings: ApplicationSettingsService())
    
    var hashParam: String {
        let timestamp = Date().currentTimeInMillis()
        let result = "&ts=\(timestamp)&hash=" + ("\(timestamp)\(privateKey)\(publicKey)".md5Value)
        return result
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        executeCall()
    }
    
    func executeCall() {
        let endpoint = GetNameEndpoint()
        let completion: EndpointClient.ObjectEndpointCompletion<Employees> = { result, response in
            guard let responseUnwrapped = response else { return }

            print("\n\n response = \(responseUnwrapped.allHeaderFields) ;\n \(responseUnwrapped.statusCode) \n")
            switch result {
            case .success(let team):
                print("team = \(team)")
                
            case .failure(let error):
                print(error)
            }
        }
        
        endpointClient.executeRequest(endpoint, completion: completion)
    }


}

final class GetNameEndpoint: ObjectResponseEndpoint<Employees> {
    
    override var method: RESTClient.RequestType { return .get }
    //override var path: String { "/v1/public/characters/1010743/series" }
    override var path: String { "/example.json" }
    override var ts: String { "?ts=1645689698425" }
    override var publicKey: String { "&apikey=938b87d66cedff099f79d7b772d3a1f9" }
    override var hash: String { "&hash=bd6a437af10eddd2f19982c3cbe31ae7" }
    
//    override var queryItems: [URLQueryItem(name: "id", value: "1")]?
    
    override init() {
        super.init()

//        queryItems = [URLQueryItem(name: "name", value: "Black Lotus")]
    }
    
}

func decodeJSONOld() {
    let str = """
        {\"team\": [\"ios\", \"android\", \"backend\"]}
    """
    
    let data = Data(str.utf8)

    do {
        if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
            if let names = json["team"] as? [String] {
                print(names)
            }
        }
    } catch let error as NSError {
        print("Failed to load: \(error.localizedDescription)")
    }
}



