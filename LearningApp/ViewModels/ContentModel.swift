//
//  ContentModel.swift
//  LearningApp
//
//  Created by Kynda Montero-Langston on 4/11/22.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var modules = [Module]()
    
    // Current module
    @Published var currentModule: Module?
    var currentModuleIndex = 0
    
    var styleData: Data?
    
    init() {
        getLocalData()
    }
    
    //MARK: - Data Methods
    func getLocalData() {
        //Get a url to the jason file
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        do {
            //Read the file into a data object
            let jsonData = try Data(contentsOf: jsonUrl!)
            //Try to decode the json into array of modules
            let jsonDecoder = JSONDecoder()
            let modules = try jsonDecoder.decode([Module].self, from: jsonData)
            //Assign parsed modules to modules property
            self.modules = modules
        }
        catch {
            //TODO log error
            print("Couldn't parse local data")
        }
        
        //Parse the style data
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do {
            //Read the file into a data object
            let styleData = try Data(contentsOf: styleUrl!)
            
            self.styleData = styleData
        }
        catch {
            //log error
            print("Couldn't parse style data")
        }
    }
    
    //MARK: - Module navigation methods
    func beginModule(_ moduleid:Int) {
        //Find the index for this module id
        for index in 0..<modules.count {
            if modules[index].id == moduleid {
                //Found matching module
                currentModuleIndex = index
                break
            }
        }
        //Set the current module
        currentModule = modules[currentModuleIndex]
        
    }
}
