//
//  DataCollection.swift
//  FrameworkFlagright
//
//  Created by tanishq on 06/12/22.
//

import Foundation
import UIKit
import Contacts
import ContactsUI
import CoreTelephony

let networkInfo = CTTelephonyNetworkInfo()

public class DataCollection {
    
    public init() {
    }
     
    public let deviceID = UIDevice.current.identifierForVendor!.uuidString
    public let language = NSLocale.current.languageCode
    public let country = NSLocale.current.regionCode
    public let ram = ProcessInfo.processInfo.physicalMemory
    public let systemVersion = UIDevice.current.systemVersion
    public let maker = "Apple"
    public let modelName = UIDevice.modelName 
    
    public let jailBreakStatus = UIDevice.isJailBroken(UIDevice.current)
    
  //  public func carrierCount() -> String {
  //  let carrierCount:Int? =  networkInfo.serviceSubscriberCellularProviders?.count
    public let carrier1:String? = Array(arrayLiteral: networkInfo.serviceSubscriberCellularProviders)[0]?.first?.value.carrierName
    //public let carrier2 = Array(arrayLiteral: networkInfo.serviceSubscriberCellularProviders)[1]?.first?.value.carrierName
//    if carrierCount == 1{
//        return networkInfo.serviceSubscriberCellularProviders?.first?.value.carrierName ?? ""
//    }
        //if networkInfo.serviceSubscriberCellularProviders?.first?.value.carrierName == nil{
            //return networkInfo.serviceSubscriberCellularProviders?.f
              //  .value.carrierName
        //}
       // return a
//}
       
    public func isSimulator() -> String{
#if targetEnvironment(simulator)
  return "Simulator"
#else
  return "Real Device"
#endif
    }
    
    public func checkAccessibilityEnabled()->Bool{
        if UIAccessibility.isAssistiveTouchRunning{
            return true
        }
        if UIAccessibility.isBoldTextEnabled{
            return true
        }
        if UIAccessibility.isClosedCaptioningEnabled{
            return true
        }
        if UIAccessibility.isDarkerSystemColorsEnabled{
            return true
        }
        if UIAccessibility.isGrayscaleEnabled{
            return true
        }
        if UIAccessibility.isGuidedAccessEnabled{
            return true
        }
        if UIAccessibility.isInvertColorsEnabled{
            return true
        }
        if UIAccessibility.isMonoAudioEnabled{
            return true
        }
        if UIAccessibility.isOnOffSwitchLabelsEnabled{
            return true
        }
        if UIAccessibility.isReduceMotionEnabled{
            return true
        }
        if UIAccessibility.isReduceTransparencyEnabled{
            return true
        }
        if UIAccessibility.isSpeakScreenEnabled{
            return true
        }
        if UIAccessibility.isSpeakSelectionEnabled{
            return true
        }
//        if UIAccessibility.isShakeToUndoEnabled{
//            return true
//        }
        if UIAccessibility.isSwitchControlRunning{
            return true
        }
//        if UIAccessibility.isVideoAutoplayEnabled{
//            return true
//        }
        if UIAccessibility.isVoiceOverRunning{
            return true
        }
        if UIAccessibility.shouldDifferentiateWithoutColor{
            return true
        }
        return false
    }
 
    public func availableMemory(){
    let fileURL = URL(fileURLWithPath: NSHomeDirectory() as String)
    do {
        let values = try fileURL.resourceValues(forKeys: [.volumeAvailableCapacityKey])
        if let capacity = values.volumeAvailableCapacity{
            print("Available capacity: \(capacity)")
        } else {
            print("Capacity is unavailable")
        }
    } catch {
        print("Error retrieving capacity: \(error.localizedDescription)")
    }
    }
    
    public func totalMemory(){
    let fileURL = URL(fileURLWithPath: NSHomeDirectory() as String)
    do {
        let values = try fileURL.resourceValues(forKeys: [.volumeTotalCapacityKey])
        if let capacity = values.volumeTotalCapacity {
            print("Total capacity: \(capacity)")
        } else {
            print("Capacity is unavailable")
        }
    } catch {
        print("Error retrieving capacity: \(error.localizedDescription)")
    }
    }
    
    public var localTimeZoneAbbreviation: String { return TimeZone.current.abbreviation() ?? "" }
    
    public func getBattery()->Float{
        UIDevice.current.isBatteryMonitoringEnabled = true
        let level = UIDevice.current.batteryLevel
        return level
    }
    
    public var isConnectedToVpn: Bool {
        if let settings = CFNetworkCopySystemProxySettings()?.takeRetainedValue() as? Dictionary<String, Any>,
            let scopes = settings["__SCOPED__"] as? [String:Any] {
            for (key, _) in scopes {
             if key.contains("tap") || key.contains("tun") || key.contains("ppp") || key.contains("ipsec") {
                    return true
                }
            }
        }
        return false
    }
    
}

