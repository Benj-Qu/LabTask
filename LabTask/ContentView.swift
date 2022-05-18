//
//  ContentView.swift
//  LabTask
//
//  Created by Zhemin Qu on 5/17/22.
//

import SwiftUI



struct ContentView: View {
    
    @State var programNum: Int = 1
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(),GridItem()]) {
                    ForEach(1...programNum, id: \.self) {_ in
                        NavigationLink {
                            ProgramView()
                        } label: {
                            ProView()
                                .aspectRatio(16/9, contentMode: .fit)
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("My ShortCut")
                        .font(.largeTitle)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        programNum += 1
                    }, label: {
                        Image(systemName: "plus.circle")
                    })
                }
            }
        }
        .padding()
    }
}

struct ProView: View {
    var message: String = "My Program"
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            shape.fill().foregroundColor(.gray)
            Text(message)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}






