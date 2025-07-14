//
//  ReminderApp.swift
//  Reminder
//
//  Created by Chaudhry Umair on 14/07/2025.
//

import SwiftUI
import AVFoundation

@main
struct ReminderApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            DashboardView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    let synthesizer = AVSpeechSynthesizer()
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        
        UNUserNotificationCenter.current().delegate = self
        NotificationManager.instance.requestPermission()
        return true
    }
    
    // Called when user taps the notification
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        let title = response.notification.request.content.title
        speak(text: "Reminder: \(title)")
        completionHandler()
    }
    
    private func speak(text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        synthesizer.speak(utterance)
    }
}
