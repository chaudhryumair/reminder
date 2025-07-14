//
//  Reminder.swift
//  Reminder
//
//  Created by Chaudhry Umair on 14/07/2025.
//

import Foundation


struct Reminder: Identifiable, Codable {
    let id: UUID
    let title: String
    let description: String
    let date: Date
}

