//
//  AppDelegate.swift
//  MacAppWithHelperApp
//
//  Created by Scott Richards on 7/14/22.
//

import Cocoa

//@main
class AppDelegate: NSObject, NSApplicationDelegate {
    
    private var window: NSWindow!
    private var statusItem: NSStatusItem!
    var popover: NSPopover!
    var statusBarItem: NSStatusItem!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        // Remove the Window
//        window = NSWindow(
//            contentRect: NSRect(x: 0, y: 0, width: 480, height: 270),
//            styleMask: [.miniaturizable, .closable, .resizable, .titled],
//            backing: .buffered, defer: false)
//        window.center()
//        window.title = "No Storyboard Window"
//        window.makeKeyAndOrderFront(nil)
        // 2
         
        // Create the popover
       let popover = NSPopover()
       popover.contentSize = NSSize(width: 400, height: 500)
       popover.behavior = .transient
//       popover.contentViewController = NSHostingController(rootView: contentView)
       self.popover = popover
        
        self.statusBarItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        // 3
        if let button = statusBarItem.button {
            button.image = NSImage(systemSymbolName: "checkmark.circle", accessibilityDescription: "1")
            button.target = self
            button.action = #selector(showHelperApp)
        }
    }
    
    
    @objc func showHelperApp() {
        print("Openeing Helper App Window")
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        if let helperAppWindowController = storyboard.instantiateController(withIdentifier: "HelperAppWindowController") as? NSWindowController
        {
            if let helperAppWindow = helperAppWindowController.window {
                
                // 2
                if let helperAppVC = helperAppWindow.contentViewController as? HelperAppVC {
                    // 3
                    let application = NSApplication.shared
                    application.runModal(for: helperAppWindow)
                    // 4
                    helperAppWindow.close()
                }
                
                
            }
        }
    }
    
    // Create the status item
    @objc func togglePopover(_ sender: AnyObject?) {
         if let button = self.statusBarItem.button {
              if self.popover.isShown {
                   self.popover.performClose(sender)
              } else {
                   self.popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
              }
         }
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }
    
    
}

