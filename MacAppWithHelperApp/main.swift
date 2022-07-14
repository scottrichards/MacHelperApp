//
//  main.swift
//  MacAppWithHelperApp
//
//  Created by Scott Richards on 7/14/22.
//

import Foundation
import AppKit
// 1
let app = NSApplication.shared
let delegate = AppDelegate()
app.delegate = delegate

// 2
_ = NSApplicationMain(CommandLine.argc, CommandLine.unsafeArgv)
