//
//  File.swift
//  Timeline-Work
//
//  Created by Thorsten Boldin on 19/10/2016.
//  Copyright © 2016 Thorsten Boldin. All rights reserved.
//

import Foundation

/*
 // AppDelegate:
 
 0.) Import UserNotification
 
 1.) Insert UNUserNotificationCenterDelegate
 2.) Insert Request User Authorization for Notifications
 
 func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
 // Override point for customization after application launch.
 
 
 UNUserNotificationCenter.current().delegate = self
 UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (_, error) in
 if let error = error {
 NSLog("Error requesting authorization for notifications: \(error)")
 return
 }
 }
 
 UIApplication.shared.registerForRemoteNotifications()
 return true
 
 }
 
 3.) Register for Remote Notifications
 
 func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
 MessageController.sharedController.subscribeToPushNotificationsForMessages()
 }
 
 4.) Create Listener for Received RemoteNotification to Update local Data and Views
 
 func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
 MessageController.sharedController.refresh()
 }
 
 
 
 
 // Modell Controller
 
 1.) Subscribe to PushNotifications for changed Data in CloudKitManager
 
 func subscribeToPushNotificationsForMessages(completion: @escaping ((Error?) -> Void) = { _ in }) {
 
 cloudKitManager.subscribeToCrationOfRecords(ofType: Message.kRecordType) { (error) in
 
 if let error = error {
 NSLog("Error saving subscription: \(error.localizedDescription)")
 } else {
 NSLog("Subscribe to push notification for new messages ")
 }
 completion(error)
 }
 }
 
 
 // CloudKitManager
 
 1.)  Create Predicate for CKQuerySubscription and save it to the database object
 
 func subscribeToCrationOfRecords(ofType type: String, completion: @escaping ((Error?) -> Void) = { _ in }) {
 
 // Make a subscription
 
 let predicate = NSPredicate(value: true)
 
 let subscription = CKQuerySubscription(recordType: type, predicate: predicate, options: .firesOnRecordCreation)
 
 // Make notificationInfo (which will tell CloudKit to make what look like
 // a UNNotification (bann or lockscreen notification) and specifies what will be on it
 
 let notificationInfo = CKNotificationInfo()
 notificationInfo.alertBody = "There´s a new message on the bulletin board"
 
 subscription.notificationInfo = notificationInfo
 
 // Save the subscription to CloudKit to begin observing changes based on the subscription
 
 database.save(subscription) { (_, error) in
 
 if let error = error {
 NSLog("Error saving subscription: \(error.localizedDescription)")
 }
 completion(error)
 
 }
 
 */
