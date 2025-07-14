//
//  DashboardView.swift
//  Reminder
//
//  Created by Chaudhry Umair on 14/07/2025.
//



import SwiftUI

struct DashboardView: View {
    @AppStorage("reminders") private var reminderData: Data = Data()
    @State private var reminders: [Reminder] = []
    @State private var showAddReminder = false
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                List {
                    ForEach(reminders) { reminder in
                        VStack(alignment: .leading) {
                            Text(reminder.title)
                                .font(.headline)
                            Text(reminder.description)
                                .font(.subheadline)
                            Text(reminder.date.formatted(date: .long, time: .shortened))
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        .padding(.vertical, 4)
                    }
                }
                .navigationTitle("Reminders")
                .toolbar {
                    Button {
                        showAddReminder = true
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                    }
                }
                .onAppear(perform: loadReminders)
                .sheet(isPresented: $showAddReminder) {
                    AddReminderView(reminders: $reminders)
                }
            }
        } else {
            // Fallback on earlier versions
        }
    }
    
    private func loadReminders() {
        if let decoded = try? JSONDecoder().decode([Reminder].self, from: reminderData) {
            reminders = decoded
        }
    }
}
