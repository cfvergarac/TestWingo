*** Settings ***
Resource          ../../Common/User Keywords/WebResposive/KeywordsWR.robot



*** Test Cases ***
flujo ibe
    ${URL}=    concatena url       QA    BOG    BLB    2020-10-10    x    1   0   0    USD    gc
    abrir pagina tarifas    ${URL}      motoe

    #debug



*** Keywords ***
Provided precondition
    Setup system under test

