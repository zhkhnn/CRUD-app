//
//  Models.swift
//  HW3
//
//  Created by Aruzhan Zhakhan on 05.04.2023.
//

import Foundation
import SwiftUI

struct DataModel: Decodable{
    let error: Bool
    let message: String
    let data: [PostModel]
}
struct PostModel: Decodable{
    let id: Int
    let title: String
    let post: String
}
