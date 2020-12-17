
class paginaPrincipal:

    def __init__(self, lenguaje):
         self.lenguaje = lenguaje
         self.rbtOW =  { "ES": "xpath=//div[@class='circle']", "EN": " xpath=//div[@class='circle']"}
         self.lblIda =  { "ES": "xpath=//div[@class='styledSelect styledSelectOrigen']", "EN": "xpath=//div[@class='styledSelect styledSelectOrigen']"}
         self.inpIda =  { "ES": "id=_wingocomponentsibenew_INSTANCE_ctyl_inputOrigen-modal", "EN": "id=_wingocomponentsibenew_INSTANCE_ctyl_inputOrigen-modal"}
         self.inpcIda =  { "ES": "id=_wingocomponentsibenew_INSTANCE_ctyl_inputOrigen-modal", "EN": "id=_wingocomponentsibenew_INSTANCE_ctyl_inputOrigen-modal"}
         self.lblDida =  { "ES": "id=_wingocomponentsibenew_INSTANCE_ctyl_comboModalOrigen", "EN": "id=_wingocomponentsibenew_INSTANCE_ctyl_comboModalOrigen"}
         self.inpcVuelta =  { "ES": "xpath=//div[@class='info-airport info-airport-destino']", "EN": "xpath=//div[@class='info-airport info-airport-destino']"}
         self.inpVuelta =  { "ES": "id=_wingocomponentsibenew_INSTANCE_ctyl_inputDestino-modal", "EN": "id=_wingocomponentsibenew_INSTANCE_ctyl_inputDestino-modal"}
         self.lblDVuelta =  { "ES": "id=_wingocomponentsibenew_INSTANCE_ctyl_comboModalDestino", "EN": "id=_wingocomponentsibenew_INSTANCE_ctyl_comboModalDestino"}
         #MONEDA
         self.inpMoneda =  { "ES": "xpath=//div[@class='select-drop selector-moneda']", "EN": "xpath=//div[@class='select-drop selector-moneda']"}
         self.tipoMoneda =  { "ES": "xpath=//span[@data-moneda='XXX']", "EN": "xpath=//span[@data-moneda='XXX']"}
         #PASAJEROS
         self.inpPasajeros =  { "ES": "id=selectPasj", "EN": "id=selectPasj"}
         self.btnPsajerosAdul =  { "ES": "xpath=(//div[contains(@class,'plus')])[1]", "EN": "xpath=(//div[contains(@class,'plus')])[1]"}
         self.btnPsajerosNin =  { "ES": "xpath=(//div[contains(@class,'plus')])[2]", "EN": "xpath=(//div[contains(@class,'plus')])[2]"}
         self.btnPsajerosInf =  { "ES": "xpath=(//div[contains(@class,'plus')])[3]", "EN": "xpath=(//div[contains(@class,'plus')])[3]"}
         #FECHAS
         self.inpFechaIda =  { "ES": "id=_wingocomponentsibenew_INSTANCE_ctyl_fromDate", "EN": "id=_wingocomponentsibenew_INSTANCE_ctyl_fromDate"}
         self.fechaIda =  { "ES": "xpath=//div[contains(@class, 'month-element') and text() = 'MM']/following-sibling::div[contains(@class, 'month-element') and text() = 'AAAA']/../../../following-sibling::tbody//tr//td//div[contains(@class, 'day') and text() = 'DD']", "EN": "xpath=//div[contains(@class, 'month-element') and text() = 'MM']/following-sibling::div[contains(@class, 'month-element') and text() = 'AAAA']/../../../following-sibling::tbody//tr//td//div[contains(@class, 'day') and text() = 'DD']"}
         self.meses =  { "ES": { '1' : 'Enero' ,'2' : 'Febrero', '3' : 'Marzo', '4' : 'Abril', '5' : 'Mayo', '6' : 'Junio', '7' : 'Julio', '8' : 'Agosto', '9' : 'Septiembre', '10' : 'Octubre', '11' : 'Noviembre', '12' : 'Diciembre'} , "EN": { '1' : 'january' ,'2' : 'February', '3' : 'March', '4' : 'April', '5' : 'May', '6' : 'June', '7' : 'July', '8' : 'August', '9' : 'September', '10' : 'October', '11' : 'November', '12' : 'December'} }
         #BOTON CONTINUAR
         self.btnContinuar =  { "ES": "_wingocomponentsibenew_INSTANCE_ctyl_searchFlight", "EN": "_wingocomponentsibenew_INSTANCE_ctyl_searchFlight"}


    def RbtOW(self):
         return self.rbtOW[self.lenguaje]

    def LblIda(self):
        return self.lblIda[self.lenguaje]

    def InpIda(self):
        return self.inpIda[self.lenguaje]

    def InpcIda(self):
        return self.inpcIda[self.lenguaje]

    def LblDida(self):
        return self.lblDida[self.lenguaje]

    def InpVUelta(self):
        return self.inpcVuelta[self.lenguaje]

    def InpVVUelta(self):
        return self.inpVuelta[self.lenguaje]

    def LblDVuelta(self):
        return self.lblDVuelta[self.lenguaje]

#MONEDA

    def InpMoneda(self):
        return self.inpMoneda[self.lenguaje]

    def TipoMoneda(self):
        return self.tipoMoneda[self.lenguaje]

#PASAJEROS
    def InpPasajeros(self):
        return self.inpPasajeros[self.lenguaje]

    def BtnPasajeroAD(self):
        return self.btnPsajerosAdul[self.lenguaje]

    def BtnPasajeroNI(self):
        return self.btnPsajerosNin[self.lenguaje]

    def BtnPasajeroIN(self):
        return self.btnPsajerosInf[self.lenguaje]

#FECHAS
    def InpVueloIda(self):
        return self.inpFechaIda[self.lenguaje]

    def FechaIda(self):
        return self.fechaIda[self.lenguaje]

    def ListaMeses(self):
        return self.meses[self.lenguaje]

#boton continuar
    def BtnContinuar(self):
        return self.btnContinuar[self.lenguaje]