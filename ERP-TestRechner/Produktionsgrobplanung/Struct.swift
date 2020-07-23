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
    var Kategorie: int
    var vorherigerMonat: Einstufig_Produktionsgrobplanung
    
    var Absatz: int = int.random(100...600)
    var Ziellagerbestand: int = int.random(10...self.Absatz)
    var Zielreichweite:int int.random(0...30)
    
    var Produktion: int
    var Lagerbestand: int
    
    var Alpha: float
    var ExPostPrognose: int
    var Prognose: int
    var Historie: int
        
    init(letzterMonat: Einstufig_Produktionsgrobplanung){
        self.vorherigerMonat = letzterMonat
        if(letzterMonat == nil){
            // neues Object
            self.Kategorie = int.random(in: 1 ... 4)
            self.Alpha = float.random(in: 0.0 ... 0.8)
        }else{
            //Vortführen
            self.Kategorie = letzterMonat.Kategorie
            self.Alpha = letzterMonat.Alpha
        }
        if (self.Kategorie == 1){
            // Historische Daten mit Alpha
        }
        if (self.Kategorie == 2){
            // absatzsynchron
        }
        if (self.Kategorie == 3){
            // Ziellagerbestand
        }
        if (self.Kategorie == 4){
            // Zielreichweite
        }
        
        self.Produktion =
        self.Lagerbestand =
    }
    
}
