//
//  Note.swift
//  Notes Watch App
//
//  Created by Kathiravan Murali on 01/03/24.
//

import Foundation

struct Note : Identifiable,Codable
{
    var id : UUID
    var text : String
}

var notee : Note = Note(id: UUID(), text: "kathir")
