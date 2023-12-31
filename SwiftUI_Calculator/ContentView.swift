//  ContentView.swift
//  SwiftUI_Calculator

import SwiftUI

struct ContentView: View {
    @State var number : String = "0"
    @State var operand : NSInteger = 0
    @State var resultant : Double? = nil
    @State var firstNum : NSInteger = 0
    @State var secondNum : NSInteger = 0
    @State var multiEqualPress : Bool = false
    
    let PLUS = 1
    let MINUS = 2
    let MULTI = 3
    let DIV = 4
    
    @State private var showingAlert = false
    
    var body: some View {
        
        VStack(spacing: 15)
        {
            Text("Calculator")
                .padding()
                .foregroundColor(.blue)
                .font(.system(size: 30))
            
            
            Text(number)
                .padding()
                .font(.system(size: 30))
                .frame(width: 300, height: 30, alignment: .trailing)
            
            HStack(spacing: 25){
                
                Button("7"){
                    self.numPressed(pressedValue: "7")
                }.buttonStyle(CalculatorButtonStyle())
                
                Button("8"){
                    self.numPressed(pressedValue: "8")
                }.buttonStyle(CalculatorButtonStyle())
                
                Button("9"){
                    self.numPressed(pressedValue: "9")
                }.buttonStyle(CalculatorButtonStyle())
                
                Button("+"){
                    self.operand = self.PLUS
                    self.saveFirstNum()
                }.buttonStyle(CalculatorButtonStyle())
            
            }
            HStack(spacing: 25){
                
                Button("4"){
                    self.numPressed(pressedValue: "4")
                }.buttonStyle(CalculatorButtonStyle())
                
                Button("5"){
                    self.numPressed(pressedValue: "5")
                }.buttonStyle(CalculatorButtonStyle())
                
                Button("6"){
                    self.numPressed(pressedValue: "6")
                }.buttonStyle(CalculatorButtonStyle())
                
                Button("-"){
                    self.operand = self.MINUS
                    self.saveFirstNum()
                }.buttonStyle(CalculatorButtonStyle())
            
            }
            HStack(spacing: 25){
                
                Button("1"){
                    self.numPressed(pressedValue: "1")
                }.buttonStyle(CalculatorButtonStyle())
                
                Button("2"){
                    self.numPressed(pressedValue: "2")
                }.buttonStyle(CalculatorButtonStyle())
                
                Button("3"){
                    self.numPressed(pressedValue: "3")
                }.buttonStyle(CalculatorButtonStyle())
                
                Button("X"){
                    self.operand = self.MULTI
                    self.saveFirstNum()
                }.buttonStyle(CalculatorButtonStyle())
            
            }
            HStack(spacing: 25){
                
                Button("C"){
                    self.clearNumValue()
                }.buttonStyle(CalculatorButtonStyle())
                
                Button("0"){
                    self.numPressed(pressedValue: "0")
                }.buttonStyle(CalculatorButtonStyle())
                
                Button("="){
                    self.calculateValue()
                }.buttonStyle(CalculatorButtonStyle())
                    .alert(isPresented: $showingAlert){
                        
                        Alert(title: Text("Error"), message: Text("Divison by 0 error"), dismissButton: .default(Text("OK")))
                    }
                
                Button("%"){
                    self.operand = self.DIV
                    self.saveFirstNum()
                }.buttonStyle(CalculatorButtonStyle())
            
            }
        }
        //.frame(width: 300, height: 500, alignment: .top)
    }
    
    func numPressed(pressedValue : String){
        
        if(self.number == "0"){
            self.number = pressedValue
        }
        else{
            self.number += pressedValue
        }
        
    }
    
    func saveFirstNum(){
        multiEqualPress = false
        if(resultant == nil){
            firstNum = Int(number)!
        }
        number = "0"
    }
    
    func clearNumValue(){
        number = "0"
        firstNum = 0
        secondNum = 0
        resultant = nil
        operand = 0
    }
    
    func calculateValue(){
        if(self.operand != 0){
            if(!multiEqualPress){
                secondNum = Int(number)!
            }
            
            if(operand == PLUS){
                resultant = Double(firstNum + secondNum)
            }
            if(operand == MINUS){
                resultant = Double(firstNum - secondNum)
            }
            if(operand == MULTI){
                resultant = Double(firstNum * secondNum)
            }
            if(operand == DIV){
                if(secondNum == 0){
                    showingAlert = true
                    clearNumValue()
                    resultant = 0
                }
                else{
                    resultant = Double(firstNum) / Double(secondNum)
                }
                
            }
            number = String(resultant!)
            firstNum = Int(resultant!)
            multiEqualPress = true
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
