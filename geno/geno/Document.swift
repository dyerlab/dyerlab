//
//  Document.swift
//  geno
//
//  Created by Rodney Dyer on 11/22/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Cocoa

class Document: NSDocument {
    
    var population: Population?
    var viewController: ViewController? {
        return windowControllers[0].contentViewController as? ViewController
    }

    override init() {
        super.init()
        // Add your subclass-specific initialization here.
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

    @IBAction func OnImportData(_ sender: AnyObject ) {
        //self.population = getArapatPopulation()
        
        
        let dialog = NSOpenPanel();
        
        dialog.title                   = "Choose a .vcf or .csv file";
        dialog.showsResizeIndicator    = true;
        dialog.showsHiddenFiles        = false;
        dialog.canChooseDirectories    = true;
        dialog.canCreateDirectories    = true;
        dialog.allowsMultipleSelection = false;
        dialog.allowedFileTypes        = ["vcf","csv"];
        
        if (dialog.runModal() == NSApplication.ModalResponse.OK) {
            let result = dialog.url // Pathname of the file
            
            if (result != nil) {
                let path = result!.path
                if path.hasSuffix("vcf") {
                    self.population = loadVCF(path: path)
                    self.viewController?.addPopulation( self.population! )
                }
                else if path.hasSuffix("csv") {
                    // pass
                }
            }
        } else {
            // User clicked on "Cancel"
            return
        }
        
        
        
        
        
        
    }

}




extension Document {
    
    func getArapatPopulation() -> Population {
        return loadArapat()
    }
}
