//
//  Document.swift
//  populationgraphs
//
//  Created by Rodney Dyer on 11/17/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation
import Cocoa
import SceneKit

class Document: NSDocument {

    var log: String
    var graph: Graph?
    
    var viewControllers: [PopgraphViewController] {
        var result: [PopgraphViewController] = []
        for windowController in windowControllers {
            if let viewController = windowController.contentViewController as? PopgraphViewController {
                result.append(viewController)
            }
        }
        return result
    }
    
    override init() {
        self.log = ""
        //self.graph = Graph.makeHumanGraph()
        super.init()
    }

    override class var autosavesInPlace: Bool {
        return true
    }

    override func makeWindowControllers() {
        // Returns the Storyboard that contains your Document window.
        let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
        let windowController = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier("Document Window Controller")) as! NSWindowController
        self.addWindowController(windowController)
    }

    override func data(ofType typeName: String) throws -> Data {
        // Insert code here to write your document to data of the specified type, throwing an error in case of failure.
        // Alternatively, you could remove this method and override fileWrapper(ofType:), write(to:ofType:), or write(to:ofType:for:originalContentsURL:) instead.
        throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
    }

    override func read(from data: Data, ofType typeName: String) throws {
        // Insert code here to read your document from the given data of the specified type, throwing an error in case of failure.
        // Alternatively, you could remove this method and override read(from:ofType:) instead.
        // If you do, you should also override isEntireFileLoaded to return false if the contents are lazily loaded.
        throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
    }
    
    @IBAction func OnImportGraph(_ sender: AnyObject ) {
        let dialog = NSOpenPanel()
        
        dialog.title = "Import Population Graph File"
        dialog.showsResizeIndicator = true
        dialog.showsHiddenFiles = false
        dialog.canChooseDirectories = false
        dialog.canCreateDirectories = false
        dialog.allowsMultipleSelection = false
        dialog.allowedFileTypes = ["json","pgraph"]
        
        if( dialog.runModal() == NSApplication.ModalResponse.OK ) {
            let result = dialog.url
            
            if result != nil {
                let path = result!.path
                let ext = URL(fileURLWithPath: path).pathExtension
                if ext == "pgraph" {
                    NSLog("Loading pgraph")
                    graph = Graph.importFromPGraph(path)!
                    
                    viewControllers.first?.scene.removeAllNodes()
                    viewControllers.first?.scene.addGraph( graph: graph! )
//                    viewControllers.first?.scene.rootNode.addChildNode( graph!.root )
                }
                else if ext == "json" {
                    NSLog("not implemented yet")
                }
                NSLog( path )
            }
        }
        else {
            return
        }
    }


}

