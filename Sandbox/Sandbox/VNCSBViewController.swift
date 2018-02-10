//
//  VNCSBViewController.swift
//  Sandbox
//
//  Created by Rodney Dyer on 2/7/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Cocoa

class VNCSBViewController: NSViewController {

    @IBOutlet weak var vncTableView: NSTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        print("VNCSBViewController in EFFECT 'yal")
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector( VNCSBViewController.loadVNC(notification:)),
                                               name: .loadVNCFileNotifiation,
                                               object: nil)
    }
    
    @objc private func loadVNC(notification: Notification) {
        print("pulling VNC from app delegate after receiving notification niño!")
        
        if let delegate = NSApplication.shared.delegate as? MyAppDelegate {
            let path = delegate.importFilePath
            print("loadVNC with path \(path)")
        } else  {
            print("Cannot load path, delegate could not be coerced")
        }
        
        
    }
    

}
