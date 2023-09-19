//  ContentView.swift
//  SwiftUI_Calculator

import SwiftUI

struct ContentView: View {
    @State var numberOne : String = "0"
    @State var operand : NSInteger = 0
    @State var resultant : Double = 0.0
    @State var firstNum : NSInteger = 0
    @State var secondNum : NSInteger = 0
    
    let PLUS = 0
    let MINUS = 1
    let MULTI = 2
    let DIV = 3
    
    var body: some View {
        
        VStack(spacing: 15)
        {
            Text("Calculator")
                .padding()
                .foregroundColor(.blue)
                .font(.system(size: 30))
            
            
            Text("0")
                .padding()
                .font(.system(size: 30))
                .frame(width: 300, height: 30, alignment: .trailing)
            
            HStack(spacing: 25){
                
                Button("7"){
                    
                }.buttonStyle(CalculatorButtonStyle())
                
                Button("8"){
                    
                }.buttonStyle(CalculatorButtonStyle())
                
                Button("9"){
                    
                }.buttonStyle(CalculatorButtonStyle())
                
                Button("+"){
                    
                }.buttonStyle(CalculatorButtonStyle())
            
            }
            HStack(spacing: 25){
                
                Button("4"){
                    
                }.buttonStyle(CalculatorButtonStyle())
                
                Button("5"){
                    
                }.buttonStyle(CalculatorButtonStyle())
                
                Button("6"){
                    
                }.buttonStyle(CalculatorButtonStyle())
                
                Button("-"){
                    
                }.buttonStyle(CalculatorButtonStyle())
            
            }
            HStack(spacing: 25){
                
                Button("1"){
                    
                }.buttonStyle(CalculatorButtonStyle())
                
                Button("2"){
                    
                }.buttonStyle(CalculatorButtonStyle())
                
                Button("3"){
                    
                }.buttonStyle(CalculatorButtonStyle())
                
                Button("X"){
                    
                }.buttonStyle(CalculatorButtonStyle())
            
            }
            HStack(spacing: 25){
                
                Button("C"){
                    
                }.buttonStyle(CalculatorButtonStyle())
                
                Button("0"){
                    
                }.buttonStyle(CalculatorButtonStyle())
                
                Button("="){
                    
                }.buttonStyle(CalculatorButtonStyle())
                
                Button("%"){
                    
                }.buttonStyle(CalculatorButtonStyle())
            
            }
        }
    }
}

struct CalculatorButtonStyle: ButtonStyle{
    
    public func makeBody(configuration: ButtonStyle.Configuration) -> some View {
        configuration.label
            .font(.title)
            .padding()
            .background(Color.blue)
            .cornerRadius(5)
            .foregroundColor(Color.white)
            .compositingGroup()
            .shadow(color: .black, radius: 3)
            .opacity(configuration.isPressed ? 0.75 : 1.0)
            .scaleEffect(configuration.isPressed ? 0.85 : 1.0)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
