//  ViewController.swift
//  AlamofireObjectMapperSample
//
//  Created by Javal Nanda on 5/1/17.
//  Copyright © 2017 Javal Nanda. All rights reserved.
//

import Foundation
import ObjectMapper

class Project: NSObject, Mappable {

	var projectId: Int?
    var accountId: Int?
	var dateCreated: Int?
	var dateModified: Int?
	var name: String?
	var status: String?

    override init() {
        super.init()
    }

    convenience required init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        projectId <- map["id"]
        accountId <- map["account_id"]
        dateCreated <- map["date_created"]
        dateModified <- map["date_modified"]
        name <- map["name"]
        status <- map["status"]
    }

}
