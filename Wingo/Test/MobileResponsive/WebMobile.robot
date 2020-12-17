*** Settings ***
Resource          ../../Common/User Keywords/WebResposive/KeywordsWR.robot



*** Test Cases ***
flujo ibe
    abrir pagina           QAIN     motoe
    tipo vuelo             OW
    ingresar_ruta          BOG     CTG
    ingresar pasajeros     1    0    0
    ingresar moneda        USD
    ingresa fechas         2020-03-29

    #debug



*** Keywords ***
Provided precondition
    Setup system under test

