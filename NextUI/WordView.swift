//
//  WordView.swift
//  NextUI
//
//  Created by 이성수 on 2022/05/30.
//
import SwiftUI

struct WordView: View{
@Binding var num:Int
@State var words:[String] = []
var body: some View{
    VStack{
        Stepper("Count \(num)", value: $num)
        Button("Generate", action:{
            Task{
                do{
                    let url = URL(string: "https://random-word-api.herokuapp.com/word?number=\(num)")
                    let (data, _) = try await URLSession.shared.data(from: url!)
                    let decoder = JSONDecoder()
                    let decoded = try decoder.decode([String].self, from: data)
                    words = decoded
                }catch{
                    
                }
            }
        })
        
        List{
            ForEach(words, id: \.self) { word in
                Text(word)
            }
            
        }
        
    }.task{
        do{
            let url = URL(string: "https://random-word-api.herokuapp.com/word?number=\(num)")
            let (data, _) = try await URLSession.shared.data(from: url!)
            let decoder = JSONDecoder()
            let decoded = try decoder.decode([String].self, from: data)
            words = decoded
        }catch{
            
        }
    }
    
}
}

