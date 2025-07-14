📱 Reminder Alarm App (SwiftUI + Speech)
A simple iOS app built with SwiftUI to save reminders and trigger local notifications (alarms) that speak the title aloud when tapped. Ideal for quick task reminders with a vocal alert!

✨ Features
📋 Dashboard to display all saved reminders (title, description, date).

➕ Add Reminder screen to schedule alarms easily.

⏰ Local Notification Alarm that triggers at your chosen time.

🔊 Speaks the Title Aloud when you open the app via notification tap.

💾 Data Saved Locally (no internet needed).

📱 Beautiful, simple SwiftUI design.

✅ Clean code structure: MVVM-lite, AppStorage, UNUserNotificationCenter, AVSpeechSynthesizer.

📸 Screenshots
Dashboard	Add Reminder	Notification

(Screenshots go in assets/ folder)

🚀 How to Install & Run
1. Clone the Repo
bash
Copy
Edit
git clone https://github.com/yourusername/reminder-alarm-swiftui.git
cd reminder-alarm-swiftui
2. Open in Xcode
Open ReminderApp.xcodeproj.

Select Simulator or your iPhone.

3. Run the App
✅ Grant Notification Permission on first launch.

✅ Add a reminder with title, description, and time.

✅ When alarm triggers:

A notification appears.

When you tap it, the app speaks the title aloud.

📌 Requirements
Xcode 15+

iOS 17+

Swift 5.9+

⚙️ Tech Stack
SwiftUI (UI)

UserDefaults (AppStorage) (Persistence)

UNUserNotificationCenter (Notifications)

AVSpeechSynthesizer (Text-to-Speech)

UIKit AppDelegate Integration for notification handling.

