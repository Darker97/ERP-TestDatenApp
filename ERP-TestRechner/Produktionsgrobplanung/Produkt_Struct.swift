//
//  Struct.swift
//  ERP-TestRechner
//
//  Created by Christian Baltzer on 23.07.20.
//

import Foundation

/*
 Kategorie
 1  Historische Daten mit Alpha
 2  Absatzsynchron
 3  Ziellagerbestand
 4  Zielreichweite
 */

struct Einstufig_Produktionsgrobplanung{
    var Kategorie: Int
    var KategorieString: String
    
    var Absatz: Int = Int.random(in: 300...600)
    var Ziellagerbestand: Int = 0
    var Zielreichweite:Int = Int.random(in: 0...15)
    
    var Produktion: Int? = nil
    var Lagerbestand: Int? = nil
    
    var Alpha: Float? = nil
    var ExPostPrognose: Int? = nil
    var Prognose: Int? = nil
    var Historie: Int? = nil
    
    init(){
        Ziellagerbestand = Int.random(in: 10...self.Absatz)
        
        self.Kategorie = Int.random(in: 2 ... 4)
        self.Alpha = Float.random(in: 0.0 ... 0.8)
        
        if (self.Kategorie == 1){
            // Historische Daten mit Alpha
            self.KategorieString = "Historische Daten nach Alpha"
            //TODO: FEHLT NOCH + MUSS WIEDER ZUR KAT HINZUGEFÜGT WERDEN
            self.Prognose = self.Absatz
        }
        if (self.Kategorie == 2){
            // absatzsynchron
            self.KategorieString = "Absatzsynchron"
            self.Produktion = self.Absatz
            self.Lagerbestand = 0
        }
        if (self.Kategorie == 3){
            // Ziellagerbestand
            self.KategorieString = "Ziellagerbestand"
            self.Produktion = self.Absatz + self.Ziellagerbestand
            self.Lagerbestand = self.Ziellagerbestand
        }else{
            // Zielreichweite
            // Absatzsynchron Produktion = Absatz * Zielreichweite/Arbeitstage + Absatz - Lagerbestand
            self.KategorieString = "Zielreichweite bei 30 Tagen"
            let Arbeitstage = 30.0
            
            var TempProduktion = self.Absatz
            var zwischen: Double = Double(self.Zielreichweite)/Arbeitstage
            var TempZusatz = Double(self.Absatz) * zwischen
            self.Produktion = TempProduktion + Int(TempZusatz)
            
            self.Lagerbestand = Int(TempZusatz)
        }
    }
    
    init(letzterMonat: Einstufig_Produktionsgrobplanung){
        self.Absatz = letzterMonat.Absatz + Int.random(in: -30 ... 30)
        Ziellagerbestand = Int.random(in: 10...self.Absatz-100)
        
        let vorherigerMonat = letzterMonat
            //Vortführen
        self.Kategorie = letzterMonat.Kategorie
        self.Alpha = letzterMonat.Alpha
        
        if (self.Kategorie == 1){
            // Historische Daten mit Alpha
            self.KategorieString = "Historische Daten nach Alpha"
            
            self.ExPostPrognose = vorherigerMonat.Prognose!
            //TODO: FEHLT NOCH
            self.Prognose = 0
        }
        if (self.Kategorie == 2){
            // absatzsynchron
            self.KategorieString = "Absatzsynchron"
            
            self.Produktion = self.Absatz
            self.Lagerbestand = 0
        }
        if (self.Kategorie == 3){
            // Ziellagerbestand
            self.KategorieString = "Ziellagerbestand"
            self.Produktion = self.Absatz + self.Ziellagerbestand - vorherigerMonat.Lagerbestand!
            self.Lagerbestand = self.Ziellagerbestand
        }else{
            // Zielreichweite
            self.KategorieString = "Zielreichweite bei 30 Tagen"
            // Absatzsynchron Produktion = Absatz * Zielreichweite/Arbeitstage + Absatz - Lagerbestand
            let Arbeitstage = 30.0
            
            var TempProduktion = self.Absatz - vorherigerMonat.Lagerbestand!
            if(TempProduktion < 0){
                var zwischen: Double = Double(self.Zielreichweite)/Arbeitstage
                var TempZusatz = Double(self.Absatz) * zwischen
                self.Produktion = Int(TempZusatz) - TempProduktion
                self.Lagerbestand = Int(TempZusatz)
                
                print("Bei einem vorherigen Lagerstand von \(vorherigerMonat.Lagerbestand!) und einem Ziel von \(self.Zielreichweite)")
                print("Bei einem Absatz von \(self.Absatz)")
                
                print("\(Int(TempProduktion)) + \(Int(TempZusatz)) = \(Produktion)")
                print("--------------------------------------")
            }else{
                var zwischen: Double = Double(self.Zielreichweite)/Arbeitstage
                var TempZusatz = Double(self.Absatz) * zwischen
                self.Produktion = TempProduktion + Int(TempZusatz)
                self.Lagerbestand = Int(TempZusatz)
                
                print("Bei einem vorherigen Lagerstand von \(vorherigerMonat.Lagerbestand!) und einem Ziel von \(self.Zielreichweite)")
                print("Bei einem Absatz von \(self.Absatz)")
                
                print("\(Int(TempProduktion)) + \(Int(TempZusatz)) = \(Produktion)")
                print("--------------------------------------")
            }
            

        }
    }
    
}
