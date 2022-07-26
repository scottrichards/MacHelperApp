//
//  HelperAppVC.swift
//  MacAppWithHelperApp
//
//  Created by Scott Richards on 7/26/22.
//

import Cocoa

class HelperAppVC: NSViewController {
    @IBOutlet weak var tabView: NSTabView!
    @IBOutlet weak var addButton: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    func launchMainApp() {
        let runningApps = NSWorkspace.shared.runningApplications
        let isRunning = runningApps.contains {
            $0.bundleIdentifier == "Seboya.TruHu.MacApp"
        }
        
        if !isRunning {
            var path = Bundle.main.bundlePath as NSString
            for _ in 1...4 {
                path = path.deletingLastPathComponent as NSString
            }
            NSWorkspace.shared.launchApplication(path as String)
        }
    }
    
    @IBAction func onAddProfile(_ sender: Any) {
        print("Launch Main App")
        launchMainApp()
    }
}
