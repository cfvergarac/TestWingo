*** Settings ***


*** Variables ***



*** Keywords ***
Asigna PO pagina tarifas
    [Arguments]      ${IDIOMA}
    Import Library       ${CURDIR}/paginaTarifas.py    ${IDIOMA}
    ${TxtInfantes}=      TxtInfantes
    set test variable    ${TxtInfantes}
    ${BtnINFANTES}=      BtnInfantes
    set test variable    ${BtnINFANTES}
    ${Txttarifas}=       TxtTarifas
    set test variable    ${Txttarifas}
    ${BtnCONTINUART}=    BtnContinuarTarifas
    set test variable    ${BtnCONTINUART}












