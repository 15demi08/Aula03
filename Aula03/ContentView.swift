//
//  ContentView.swift
//  Aula03
//
//  Created by IOS SENAC on 14/08/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var nome:String = ""
    @State private var email:String = ""
    @State private var mensagem:String = ""
    @State private var newsletter:Bool = false
    
    @State private var mostrarAlerta:Bool = false
    @State private var textoAlerta:String = ""
    
    var body: some View {
        
        VStack( alignment: .leading, spacing: 20.0 ) {
            
            Text("Entre em Contato")
                .font(.title)
                .foregroundColor(Color.red)
            
            HStack(){
                
                Text("Nome")
                TextField("Digite seu nome", text: $nome)
                    .border(Color.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                
            }
            
            HStack(){
                
                Text("E-mail")
                TextField("exemplo@email.com", text: $email)
                    .border(Color.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    
            }
            
            VStack( alignment: .leading ){
                
                Text("Mensagem")
                TextEditor(text: $mensagem)
                    .frame(height: 100.0)
                    .background(Color.red)
                    .border(Color.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)

                
            }
            
            HStack(){
                
                Text("Assinar a newsletter?")
                Toggle(isOn: $newsletter){}
                
            }
            
            HStack() {
                
                Button(action: {
                    alertar( texto:"Operação Cancelada!" )
                }) { Text("Cancelar") }
                    .foregroundColor(.gray)
                Button(action: {
                    alertar( texto: "Mensagem enviada com sucesso!" )
                }) { Text("Enviar") }
                    .foregroundColor(.red)
                
            }.frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, minHeight: 0, idealHeight: 100, maxHeight: .infinity, alignment: .bottomTrailing)
            
        }.alert(isPresented: $mostrarAlerta, content: {
            return Alert(
                title: Text("Aviso"), message: Text(textoAlerta), dismissButton: .default(Text("OK")))
        })
            .padding(.all, 30.0)
            .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, minHeight: 0, idealHeight: 100, maxHeight: .infinity, alignment: .top)
        
        
    }
    
    func alertar( texto:String ){
        
        textoAlerta = texto
        mostrarAlerta = true
        
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
