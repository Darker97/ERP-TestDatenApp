//
//  View.swift
//  ERP-TestRechner
//
//  Created by Christian Baltzer on 23.07.20.
//

import Foundation
import SwiftUI

/// Historische Daten mit Alpha

/// Absatzsynchron/Zielreichweite/Ziellagerbestand

struct GameScreen1: View {
    @State private var ZeroObject: Einstufig_Produktionsgrobplanung = Einstufig_Produktionsgrobplanung()
    @State private var GameObject: Einstufig_Produktionsgrobplanung = Einstufig_Produktionsgrobplanung()
    
        
    @State var Points: Int = 0
    
    @State var Antwort_Produktion: String = ""
    @State var Antwort_Lagerbestand: String = ""
    
    @State var backroundColor = Color.black
    
    var body: some View {
    //Überschrift mit Punkten
        VStack {
            Text("\(ZeroObject.KategorieString)")
                .font(.title)
                .multilineTextAlignment(.center)
                .padding(.vertical, 3.0)
            Text("Erreichte Punkte: \(Points)")
                .font(.headline)
                .padding(.bottom, 2.0)
                .foregroundColor(backroundColor)
                
            
            VStack{
                HStack(alignment: .top, spacing: 5.0){
                    Legende()
                        .frame(width: 140.0)
                        
                    ///Object 0 - Das was links ist
                    SpieleObject(Object: ZeroObject, ZeroObject: true, Antwort_Produktion: $Antwort_Produktion, Antwort_Lagerbestand: $Antwort_Lagerbestand)
                        .frame(width: 85.0)
                        .disabled(true)
                    
                    
                    /// Object 1 - Das woran gearbeitet wird
                    SpieleObject(Object: GameObject, ZeroObject: false, Antwort_Produktion: $Antwort_Produktion, Antwort_Lagerbestand: $Antwort_Lagerbestand)
                }
                Button(action: {
                    if(String(GameObject.Produktion!) == Antwort_Produktion && String(GameObject.Lagerbestand!) == Antwort_Lagerbestand){
                        Points += 1
                        backroundColor = Color.green
                    }else{
                        backroundColor = Color.red
                    }
                    ZeroObject = GameObject
                    GameObject = Einstufig_Produktionsgrobplanung(letzterMonat: ZeroObject)
                    
                    Antwort_Produktion = ""
                    Antwort_Lagerbestand = ""
                    
                }){Text("Next")}
                .padding(.vertical, 10.0)
                .frame(width: 100.0, height: 50.0)
                .background(Color.green)
                .foregroundColor(Color.white)
                .cornerRadius(10)
            }
            .padding(.vertical, 15.0)
            
        }
        
        
    }
}

struct View_Previews: PreviewProvider {
    static var previews: some View {
        GameScreen1()
    }
}

struct SpieleObject: View{
    var Object: Einstufig_Produktionsgrobplanung
    var ZeroObject: Bool
    
    @Binding var Antwort_Produktion: String
    @Binding var Antwort_Lagerbestand: String
    
    var body: some View{
        /// Absatz, Produktion, Ziellagerbestand, Zielreichweite, Lagerbestand
        
        List{
            Text("\(Object.Absatz)")
            
            if(ZeroObject){
                Text("\(Object.Produktion!)")
            }else{
                TextField("Produktion", text: $Antwort_Produktion)
                    .keyboardType(.numberPad)
            }
            
            Text("\(Object.Ziellagerbestand)")
            
            Text("\(Object.Zielreichweite)")
            
            if(ZeroObject){
                Text("\(Object.Lagerbestand!)")
            }else{
                TextField("Lagerbestand", text: $Antwort_Lagerbestand)
                    .keyboardType(.numberPad)
            }
        }
        
        
    }
}

struct Legende: View{
    var body: some View{
        /// Absatz, Produktion, Ziellagerbestand, Zielreichweite, Lagerbestand
        
        List{
            Text("Absatz")
            Text("Produktion")
            Text("Ziellagerbestand")
            Text("Zielreichweite")
            Text("Lagerbestand")
        }
        
        
    }
}
