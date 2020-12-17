# -*- coding: utf-8 -*-
class paginaTarifas:

    def __init__(self, lenguaje):
         self.lenguaje = lenguaje
         self.txtInfantes =  { "ES": "¿Viajas con un infante?", "EN": "Do you travel with an infant?"}
         self.btnInfantes =  { "ES": "xpath=//button[@class='bt-wingo-blue-pop-up']", "EN": "xpath=//button[@class='bt-wingo-blue-pop-up']"}
         self.txtTarifas =  { "ES": "Elige tu mejor tarifa", "EN": "Select your best fare"}
         self.btnContinuarTarifas =  { "ES": "xpath=(//button[contains(.,'Continuar')])[1]", "EN": "xpath=(//button[contains(.,'Continue')])[1]"}

#Infantes
    def TxtInfantes(self):
         return self.txtInfantes[self.lenguaje]

    def BtnInfantes(self):
        return self.btnInfantes[self.lenguaje]

    def TxtTarifas(self):
        return self.txtTarifas[self.lenguaje]

    def BtnContinuarTarifas(self):
        return self.btnContinuarTarifas[self.lenguaje]

