//
//  ContentView.swift
//  LearningApp
//
//  Created by Kynda Montero-Langston on 4/12/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model:ContentModel
    
    var body: some View {
        
        ScrollView {
            LazyVStack {
                //Confirm that currenModule is set
                if model.currentModule != nil {
                    ForEach(0..<model.currentModule!.content.lessons.count) {index in
                        
                        NavigationLink(
                            destination:
                                ContentDetailView()
                                .onAppear(perform: {model.beginLesson(index)
                                }),
                            label: {
                                ContentViewRow(index: index)
                                
                            })
                    }
                }
            }
            .accentColor(.black)
            .padding()
            .navigationTitle("Learn \(model.currentModule?.category ?? "")")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
