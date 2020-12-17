*** Settings ***


*** Variables ***



*** Keywords ***
Asigna PO pagina ssr
    [Arguments]      ${IDIOMA}
    Import Library              ${CURDIR}/paginaSSR.py    ${IDIOMA}
    ${TxtPasajeros}=            TxtPasajeros
    set test variable           ${TxtPasajeros}

    ${TxtNOMBREADULTO}=         InpNombreAdulto
    set test variable           ${TxtNOMBREADULTO}
    ${TxtAPELLIDO}=             InpApellidoAdulto
    set test variable           ${TxtAPELLIDO}
    ${LblSEXO}=                 InpSexo
    set test variable           ${LblSEXO}
    ${LblANO}=                  InpAno
    set test variable           ${LblANO}
    ${LblMES}=                  inpMes
    set test variable           ${LblMES}
    ${LblDIA}=                  InpDia
    set test variable           ${LblDIA}








