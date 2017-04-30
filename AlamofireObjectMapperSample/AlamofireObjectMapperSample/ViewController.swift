//
//  ViewController.swift
//  AlamofireObjectMapperSample
//
//  Created by Javal Nanda on 5/1/17.
//  Copyright © 2017 Javal Nanda. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class ViewController: UIViewController {
    
    var projects:[Project] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fetchData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchData(){
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let apiUrl = "https://raw.githubusercontent.com/javalnanda/AlamofireObjectMapperSample/master/AOMsample.json"
        Alamofire.request(apiUrl).validate().responseArray(keyPath: "result") { (response: DataResponse<[Project]>) in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            switch response.result {
            case .success:
                self.projects = response.result.value ?? []
                for project in self.projects {
                    print(project.name)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

