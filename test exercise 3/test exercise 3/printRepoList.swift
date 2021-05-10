//
//  printRepoList.swift
//  test exercise 3
//
//  Created by Vladimir Gorbunov on 09.05.2021.
//

import Foundation
import Alamofire

func printRepoList (forUser user: String) {
    
    let userName = user.addingPercentEncoding(withAllowedCharacters: .urlUserAllowed)
    
    let url = "https://api.github.com/users/\(userName!)/repos"
    
    //maybe bug, AF don't work whithout new queue(default .main)
    let queue = DispatchQueue(label: "my.af.queue", attributes: .concurrent)
    
    AF.request(url).responseJSON(queue: queue) { response in
        
        switch response.result {
        case .success:
            
            //1 check JSON data
            guard let valueArray = response.value as? [[String: Any]] else {
                print("\nUser (\(user)) Not found")
                return
            }
            
            //2 check what inside JSON data
            guard let repList = (valueArray as AnyObject).value(forKey: "name") as? [String] else {
                print("\nCould not get repositories from JSON data")
                return
            }
            
            //3 print user replist
            print("\nUser (\(user)) has (\(repList.count)) repositories")
            for i in repList {
                print(i)
            }
            print("\nInput user name or --EXIT:")
            
        case .failure (let error):
            print(error.errorDescription!) //print description from AF session manager
        }
    }
}
