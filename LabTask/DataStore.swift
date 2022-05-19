//
//  DataStore.swift
//  LabTask
//
//  Created by Zhemin Qu on 5/18/22.
//

import SwiftUI
import Foundation

class DataStore: ObservableObject {
    @Published var instrs:[Instr] = []
    
    init () {}
    
    func addInstr (instrName: String, isIf: Bool, isElseif: Bool, isEndif: Bool) {
        instrs.append(Instr(name: instrName, isIf: isIf, isElseif: isElseif, isEndif: isEndif))
        dealIndentation()
    }
    
    func dealIndentation () {
        for i in instrs.indices {
            if i == 0 {
                instrs[i].indented = false
            }
            else {
                if instrs[i-1].isIf || instrs[i-1].isElseif || instrs[i-1].indented {
                    if instrs[i].isIf || instrs[i].isElseif || instrs[i].isEndif {
                        instrs[i].indented = false
                    }
                    else {
                        instrs[i].indented = true
                    }
                }
                else {
                    instrs[i].indented = false
                }
            }
        }
    }
}

struct Instr: Identifiable, Codable {
    var id: String = UUID().uuidString
    var name: String
    var isIf: Bool = false
    var isElseif: Bool = false
    var isEndif: Bool = false
    var indented: Bool = false
    
    
    static var sampleData: [Instr] {
        []
    }
}
