//
//  Note.swift
//  Notes WatchKit Extension
//
//  Created by Carlos Amaral on 19/11/21.
//

import Foundation

struct Note : Identifiable, Codable {
    let id : UUID
    let text : String
}
