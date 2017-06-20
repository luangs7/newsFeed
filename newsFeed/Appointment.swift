//
//  Appointment.swift
//  newsFeed
//
//  Created by Luan Silva on 19/06/17.
//  Copyright © 2017 Luan Silva. All rights reserved.
//

import UIKit

@objc(Appointment)
class Appointment: NSObject, NSCoding {
    var custoMercadoria: Double?
    var custoServico: Double?
    var aliquotaSimples: Double?
    var margem: Double?
    var fretePreco: Double?
    var cobrancaPreco: Double?
    var otherCost: Double?
    
    override init(){
        
    }
    
  


        required init(coder aDecoder: NSCoder) {
            self.custoMercadoria = aDecoder.decodeObject(forKey:"custoMercadoria") as? Double
            self.custoServico = aDecoder.decodeObject(forKey: "custoServico") as? Double
            self.aliquotaSimples = aDecoder.decodeObject(forKey: "aliquotaSimples") as? Double
            self.margem = aDecoder.decodeObject(forKey: "margem") as? Double
            self.fretePreco = aDecoder.decodeObject(forKey: "fretePreco") as? Double
            self.cobrancaPreco = aDecoder.decodeObject(forKey: "cobrancaPreco") as? Double
            self.otherCost = aDecoder.decodeObject(forKey: "otherCost") as? Double

        }
    
        func encode(with aCoder: NSCoder){
            aCoder.encode(self.custoMercadoria, forKey: "custoMercadoria")
            aCoder.encode(self.custoServico, forKey: "custoServico")
            aCoder.encode(self.aliquotaSimples, forKey: "aliquotaSimples")
            aCoder.encode(self.margem, forKey: "margem")
            aCoder.encode(self.fretePreco, forKey: "fretePreco")
            aCoder.encode(self.cobrancaPreco, forKey: "cobrancaPreco")
            aCoder.encode(self.otherCost, forKey: "otherCost")
        }
}


