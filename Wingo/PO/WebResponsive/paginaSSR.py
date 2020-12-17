
class paginaSSR:

    def __init__(self, lenguaje):
         self.lenguaje = lenguaje
         self.txtPasajeros =  { "ES": "Completa datos de los viajeros", "EN": "Complete passenger data"}
         self.inpNombreAdulto =  { "ES": "id=name-ad-XXX", "EN": "id=name-ad-XXX"}
         self.inpApellidoAdulto =  { "ES": "id=lastname-ad-XXX", "EN": "id=lastname-ad-XXX"}
         self.inpSexo =  { "ES": "id=sex-ad-XXX", "EN": "id=sex-ad-XXX"}
         self.inpAno =  { "ES": "xpath=(//div[contains(@class,'mobile-combo-datepicker-year')])", "EN": "xpath=(.//*[normalize-space(text()) and normalize-space(.)='Birth Date'])[XXX]/following::select[1]"}
         self.inpMes =  { "ES": "xpath=(.//*[normalize-space(text()) and normalize-space(.)='Fecha de nacimiento'])[XXX]/following::select[2]", "EN": "xpath=(.//*[normalize-space(text()) and normalize-space(.)='Birth Date'])[XXX]/following::select[2]"}
         self.inpDia =  { "ES": "xpath=(.//*[normalize-space(text()) and normalize-space(.)='Fecha de nacimiento'])[XXX]/following::select[3]", "EN": "xpath=(.//*[normalize-space(text()) and normalize-space(.)='Birth Date'])[XXX]/following::select[3]"}


#Llenar pasajeros
    def TxtPasajeros(self):
        return self.txtPasajeros[self.lenguaje]

    def InpNombreAdulto(self):
        return self.inpNombreAdulto[self.lenguaje]

    def InpApellidoAdulto(self):
        return self.inpApellidoAdulto[self.lenguaje]

    def InpSexo(self):
        return self.inpSexo[self.lenguaje]

    def InpAno(self):
        return self.inpAno[self.lenguaje]

    def InpMes(self):
        return self.inpMes[self.lenguaje]

    def InpDia(self):
            return self.inpDia[self.lenguaje]