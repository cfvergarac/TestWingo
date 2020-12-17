*** Settings ***
Resource          ../../Common/User Keywords/MMB/KeywordsMMB.robot


*** Test Cases ***
abrirpagina
    abrir MMB         PROD     gc
    Loguearse        NEHTSH  Doe
    #ir cambio vuelo

