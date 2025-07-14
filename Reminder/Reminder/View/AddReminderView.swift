//
//  AddReminderView.swift
//  Reminder
//
//  Created by Chaudhry Umair on 14/07/2025.
//

import SwiftUI

struct AddReminderView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var reminders: [Reminder]
    @AppStorage("reminders") private var reminderData: Data = Data()
    
    @State private var title = ""
    @State private var description = ""
    @State private var date = Date()
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                Form {
                    TextField("Title", text: $title)
                    TextEditor(text: $description)
                        .frame(height: 100)
                    DatePicker("Reminder Date", selection: $date, displayedComponents: [.date, .hourAndMinute])
                }
                .navigationTitle("Add Reminder")
                .toolbar {
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Save") {
                            saveReminder()
                        }
                    }
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") {
                            dismiss()
                        }
                    }
                }
            }
        } else {
            // Fallback on earlier versions
        }
    }
    
    private func saveReminder() {
        let newReminder = Reminder(id: UUID(), title: title, description: description, date: date)
        reminders.append(newReminder)
        if let encoded = try? JSONEncoder().encode(reminders) {
            reminderData = encoded
        }
        NotificationManager.instance.scheduleNotification(for: newReminder)
        dismiss()
    }
}
