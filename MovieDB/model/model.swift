//
//  model.swift
//  MovieDB
//
//  Created by sachin singh on 25/08/21.
//

import UIKit

struct MovieResult : Codable {
    var results:[Movie]?
}

struct Movie : Codable {
    var title:String?
    var popularity:Double?
    var release_date:String?
    var backdrop_path:String?
}
