//
//  ProgramView.swift
//  LabTask
//
//  Created by Zhemin Qu on 5/18/22.
//

import SwiftUI
import Foundation

struct ProgramView: View {
    @EnvironmentObject var dataStore: DataStore

    
    var programName = "My Program"
    
    var body: some View {
        NavigationView {
            List() {
                ForEach(dataStore.instrs) { instr in
                    InstrView(instr: instr)
                }
                .onMove(perform: move)
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle(programName)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    EditButton()
                    Menu {
                        Button("If condition",
                               action: addIfInstr)
                        Button("Declare Variable",
                               action: addDVInstr)
                        Button("Arithmetic Calculation",
                               action: addAOInstr)
                        Button("Memory Operation",
                               action: addMOInstr)
                    } label: {
                        Label("add", systemImage: "plus.circle")
                    }
                }
            }
        }
    }

    func move (from source: IndexSet, to destination: Int) {
        dataStore.instrs.move(fromOffsets: source, toOffset: destination)
        dataStore.dealIndentation()
    }
    
    func addIfInstr ()  {
        dataStore.addInstr(instrName: "if", isIf: true, isEndif: false)
        dataStore.addInstr(instrName: "else", isIf: true, isEndif: false)
        dataStore.addInstr(instrName: "end if", isIf: false, isEndif: true)
    }
    
    func addDVInstr ()  {
        dataStore.addInstr(instrName: "Declare Variable", isIf: false, isEndif: false)
    }
    
    func addAOInstr ()  {
        dataStore.addInstr(instrName: "Arithmetic Calculation", isIf: false, isEndif: false)
    }
    
    func addMOInstr ()  {
        dataStore.addInstr(instrName: "Memory Operation", isIf: false, isEndif: false)
    }
}

struct InstrView: View {
    
    var instr: Instr
    
    
    
    var body: some View {
        if instr.indented {
            HStack {
                Text("   ")
                Text(instr.name)
            }
        }
        else {
            Text(instr.name)
        }
        
    }
    
    

}

struct ProgramView_Previews: PreviewProvider {
    static var previews: some View {
        ProgramView()
            .environmentObject(DataStore())
            .preferredColorScheme(.dark)
    }
}

