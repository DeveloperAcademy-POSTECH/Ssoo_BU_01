//
//  NumbersView.swift
//  NextUI
//
//  Created by 이성수 on 2022/05/29.
//

import SwiftUI

struct NumbersView: View {
    @State var num: Int = 0
    let step = 1
    let range = 1...15

    
    var body: some View {
        NavigationView{
        VStack{
                Stepper(value: $num,
                        in: range,
                        step: step) {
                    Text("단어 갯수 : \(num)" + "/15")
                }
            NavigationLink(destination: WordView(num: $num)) {
                Label("Word", systemImage: "text.book.closed.fill")
            }

            
//            Text("\(num)")
        }
        .padding(100.0)
      }
    }
}


    
    struct NumbersView_Previews: PreviewProvider {
        static var previews: some View {
            NumbersView()
        }
    }
//struct EngView_Previews: PreviewProvider {
//    static var previews: some View {
//        EngView()
//    }
//}
