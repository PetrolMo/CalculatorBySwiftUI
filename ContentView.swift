//
//  ContentView.swift
//  MyCalculator
//
//  Created by 莫仪智 on 2020/11/9.
//

import SwiftUI
struct ContentView: View {
    @State var tap = false
    var body: some View {
        VStack {
            Spacer()
            Text("123,000")
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,  alignment: .trailing)
                .font(.system(size: 75))
                .foregroundColor(Color(.white))
                .padding(20)
            lineView()
                .padding(.bottom,10)
        }
        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .background(Color(.black))
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct GrayWord: View {
    @State var onTap = false
    var item:element
    var body: some View {
        Text(item.text)
            .fontWeight(item.fontWeight)
            .frame(width: item.width, height: 88, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .font(.system(size: 35))
            .background(item.bgColor )
            .cornerRadius(item.radius)
            .foregroundColor(item.fontColor)
            .scaleEffect(onTap ? 1.5 : 1)
            .animation(.easeInOut)
            .onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
                self.onTap.toggle()
                let time:TimeInterval = 0.1
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time){
                    self.onTap.toggle()
                }
                
            })
            
    }
}

struct lineView: View {
    @State var tap = true
    var viewData = elementData
    var body: some View {
        HStack {
            ForEach(viewData[0...3]) { item in
                GrayWord(item: item)
            }

        }
        HStack {
            ForEach(viewData[4...7]) { item in
                GrayWord(item: item)
            }
            
        }
        HStack {
            ForEach(viewData[8...11]) { item in
                GrayWord(item: item)
            }
            
        }
        HStack {
            ForEach(viewData[12...15]) { item in
                GrayWord(item: item)
            }
            
        }
        HStack {
            ForEach(viewData[16...18]) { item in
                GrayWord(item: item)
            }
            
        }
        .padding(.bottom,30)


    }
}
struct element:Identifiable {
    var id = UUID()
    var text:String
    var bgColor:Color = Color(red: 0.524, green: 0.538, blue: 0.559, opacity: 0.5)
    var fontColor:Color = Color(.white)
    var fontWeight:Font.Weight = .regular
    var width:CGFloat = 88
    var radius:CGFloat = 100
    
}
let elementData = [
    element(text: "AC", bgColor: Color(hue: 0.6, saturation: 0.058, brightness: 0.915, opacity: 0.627),fontColor:Color(.black)),
    element(text: "±", bgColor: Color(hue: 0.6, saturation: 0.058, brightness: 0.915, opacity: 0.627),fontColor:Color(.black)),
    element(text: "%", bgColor: Color(hue: 0.6, saturation: 0.058, brightness: 0.915, opacity: 0.627),fontColor:Color(.black)),
    element(text: "÷", bgColor: Color(.orange),fontWeight: .bold),
    element(text: "7"),
    element(text: "8"),
    element(text: "9"),
    element(text: "×", bgColor: Color(.orange),fontWeight: .bold),
    element(text: "4"),
    element(text: "5"),
    element(text: "6"),
    element(text: "－", bgColor: Color(.orange),fontWeight: .bold),
    element(text: "1"),
    element(text: "2"),
    element(text: "3"),
    element(text: "+", bgColor: Color(.orange),fontWeight: .bold),
    element(text: "0",width: 186,radius: 50),
    element(text: "."),
    element(text: "=", bgColor: Color(.orange),fontWeight: .bold),
    
]
