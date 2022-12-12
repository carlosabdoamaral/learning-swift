//
//  MessageModel.swift
//  DailyMessage
//
//  Created by Carlos Amaral on 17/01/22.
//

import Foundation

class MessageModel : Identifiable, Decodable {
    var id : Int
    var content : String
}
