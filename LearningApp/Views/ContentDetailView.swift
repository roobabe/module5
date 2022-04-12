//
//  ContentDetailView.swift
//  LearningApp
//
//  Created by Kynda Montero-Langston on 4/12/22.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        let lesson = model.currentLesson
        let url = URL(string: Constants.videoHostURL + (lesson?.video ?? ""))
     
        VStack {
            //Only show video if we get a valid URL
            if url != nil {
                VideoPlayer(player: AVPlayer(url: url!))
                    .cornerRadius(10)
            }
            //TODO: Description
            
            //Next Lesson button
            if model.hasNextLesson() {
                Button(action: {
                    //Advance the lesson
                    model.nextLesson()
                }, label: {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.green)
                            .cornerRadius(10)
                            .shadow(color: .gray, radius: 5, x: 5, y: 5)
                            .frame(height: 48)
                        Text("Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex + 1].title)")
                            .foregroundColor(.white)
                            .bold()
                    }
            })
    }
        }
        .padding()
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}
