//
//  ContentView.swift
//  hw1
//
//  Created by User07 on 2019/10/4.
//  Copyright © 2019 User07. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State public var h:Double = 1
    @State public var s:Double = 0
    @State public var b:Double = 1
    @State public var o:Double = 1
    @State public var ale:Bool=false
    @State public var select_pic = 0
    @State public var a:String="input"
    @State public var show:Bool=true
    var pic = ["1","2","5900"]
    var body: some View {
        GeometryReader { (geometry) in
            NavigationView {
        VStack {
            if(self.show==true){
            Image(String(self.pic[self.select_pic])).resizable()
            .scaledToFill()
            .frame(width: geometry.size.width, height: geometry.size.width / 4 * 3)
                .clipped().colorMultiply(Color(hue: self.h, saturation: self.s, brightness: self.b, opacity: self.o))}
            Form{
                Toggle(isOn: self.$show) {
                Text("show")
                }
                Slider(value: self.$h, in: 0...1 )
                Slider(value: self.$s, in: 0...1)
                Slider(value: self.$b, in: 0...1)
            ExtractedView(ale:self.$ale,h:self.$h,s:self.$s,b:self.$b)
                DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, label: { /*@START_MENU_TOKEN@*/Text("Date")/*@END_MENU_TOKEN@*/ })
                Picker(selection: self.$select_pic, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/) {
                    Text("hide the pain").tag(0)
                    Text("爽啊").tag(1)
                    Text("rx 5900xt").tag(2)
                    
                }
                TextField(self.a, text: self.$a)
            }
            
            
        }
        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ExtractedView: View {
    @Binding var ale:Bool
    @Binding var h:Double
    @Binding var s:Double
    @Binding var b:Double
    var body: some View {
        Button(action: {self.ale=true}) {
            Text(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/)
        }.alert(isPresented: $ale) { () -> Alert in
        return Alert(title: Text(String(h)+"\n"+String(s)))
        }
    }
}
