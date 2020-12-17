*** Settings ***
Resource          ../RecursosQA.robot
Test Template    Flujo_compra
#Suite Setup      Register Keyword to Run On Failure    close browser
Suite Teardown   close browser


*** Test Cases ***
Pago_uno                 PROD         OW     BOG      CTG     COP    1     0    0      2020-12-13      x
#Pago_dos                PRODIN       OW     BOG      CCS     USD    1     1    1    2020-03-30      2020-03-29


*** Keywords ***
Flujo_compra
    [Arguments]     ${AMBIENTE}    ${TIPOVUELO}    ${ORIGEN}     ${DESTINO}    ${TIPOMONEDA}    ${NADULTOS}    ${NNINOS}    ${NINFANTES}    ${FECHAIDA}    ${FECHAVUELTA}
    Abrir_Pagina_Principal     ${AMBIENTE}    gc
    Sleep   15s
    Ingresar_tipo_vuelo   ${TIPOVUELO}
    Ingresar_lugares      ${ORIGEN}      ${DESTINO}
    Seleccionar_Fechas    ${FECHAIDA}    ${FECHAVUELTA}
    Seleccionar_moneda    ${TIPOMONEDA}
    Ingresa_Pasajeros     ${NADULTOS}    ${NNINOS}    ${NINFANTES}
    Continuar
    Seleccionar_flex      no
    Llena_datos_viajero
    Agregar_ancillarie    no
    continuar_a_sillas
    Selecciona_sillas
    Wait Until Page Contains Element    xpath=//h3[@class='content-title']      15s
    Capture Page Screenshot
    close browser
