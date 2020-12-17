
*** Variables ***
${InpCODIGOCH}         id=reservation
${InpAPELLIDOSCH}      id=lastName
${BtnLoginCH}          xpath=//input[@value='Buscar']


${CHKPASAJEROSCH}          xpath=(//label[contains(.,'Hacer Check-in')])[XXX]
${BtnContinuarCH}          xpath=//button[contains(.,'Continuar')]

${BtnNoGracias}            xpath=(//button[@class='noThanksLink'])[1]
${BtnNoGracias2}            xpath=(//button[@class='noThanksLink'])[2]

${BtnSiguienteCH}          id=nextInfoAd
${BtnPasabordoCH}          xpath=//button[contains(.,'Descarga tu pasabordo')]

#SILLAS
#${BtnNoGracias}           xpath=(//button[contains(@class,'noThanksLink')])[1]