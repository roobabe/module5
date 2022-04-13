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
    //Learn Swift for Beginner video is 910X511
    let videoRatio: CGFloat = 511/910
    
    var body: some View {
        
        let lesson = model.currentLesson
        let url = URL(string: Constants.videoHostURL + (lesson?.video ?? ""))
        GeometryReader {geo in
            VStack {
                //Only show video if we get a valid URL
                if url != nil {
                    VideoPlayer(player: AVPlayer(url: url!))
                        .cornerRadius(10)
                        .frame(height: geo.size.width * videoRatio)
                }
                //Description
                CodeTextView()
                
                //Next Lesson button
                if model.hasNextLesson() {
                    Button(action: {
                        //Advance the lesson
                        model.nextLesson()
                    }, label: {
                        ZStack {
                            RectangleCard(color: Color.green)
                                .frame(height: 48)
                            
                            Text("Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex + 1].title)")
                                .foregroundColor(.white)
                                .bold()
                        }
                    })
                }
                else {
                    //show the complete button instead
                    Button(action: {
                        //Take the user back to the homeView
                        model.currentContentSelected = nil
                    }, label: {
                        ZStack {
                            RectangleCard(color: Color.green)
                                .frame(height:48)
                            
                            Text("Complete")
                                .foregroundColor(.white)
                                .bold()
                        }
                    })
                }
            }
            .padding()
            .navigationTitle(lesson?.title ?? "")
            
        }
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}
