*** Settings ***


*** Variables ***



*** Keywords ***
Asigna PO pagina principal
    [Arguments]      ${IDIOMA}
    Import Library       ${CURDIR}/paginaPrincipal.py    ${IDIOMA}
    ${RbnOW}=            RbtOW
    set test variable    ${RbnOW}
    ${LblIda}=           LblIda
    set test variable    ${LblIda}
    ${InpIda}=           InpIda
    set test variable    ${InpIda}
    ${InpcIda}=           InpcIda
    set test variable    ${InpcIda}
    ${LblDIda}=          LblDida
    set test variable    ${LblDIda}
    ${InpVuelta}=        InpVUelta
    set test variable    ${InpVuelta}
    ${InpvVuelta}=        InpVVUelta
    set test variable     ${InpvVuelta}
    ${LblDVuelta}=        LblDVuelta
    set test variable     ${LblDVuelta}
    ${InpMoneda}=         InpMoneda
    set test variable     ${InpMoneda}
    ${TipoMoneda}=         TipoMoneda
    set test variable     ${TipoMoneda}
    ${InpPasajeros}=      InpPasajeros
    set test variable     ${InpPasajeros}

    ${BtnPasajerosAd}=      BtnPasajeroAD
    set test variable       ${BtnPasajerosAd}
    ${BtnPasajerosNi}=      BtnPasajeroNI
    set test variable       ${BtnPasajerosNi}
    ${BtnPasajerosIn}=      BtnPasajeroIN
    set test variable       ${BtnPasajerosIn}
    ${InpVueloIda}=         InpVueloIda
    set test variable       ${InpVueloIda}
    ${FechaIda}=            FechaIda
    set test variable       ${FechaIda}
    ${ListaMeses}=          ListaMeses
    set test variable       &{ListaMeses}
    ${BtnContinuarIBE}=     BtnContinuar
    set test variable       ${BtnContinuarIBE}









