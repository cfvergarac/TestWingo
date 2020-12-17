*** Settings ***
Resource    ../../PO/Checkin/Login.robot
Resource    ../../PO/Checkin/Ancillaries.robot
Resource    ../../PO/Checkin/Pagos.robot
Resource    ../../Common/TodasLasLibrerias.robot
Resource    ../../variables.robot


*** Keywords ***

Abrir_Pagina_Chekin
    [Arguments]     ${AMBIENTE}     ${NAVEGADOR}
    Open Browser    ${URLCHECKIN.${AMBIENTE}}    ${NAVEGADOR}
    Set Test Variable    ${NAVEGADOR}
    Maximize Browser Window


Loguearse_Chekin
    [Arguments]     ${PNR}     ${APELLIDO}
    Input Text      ${InpCODIGOCH}    ${PNR}
    Input Text      ${InpAPELLIDOSCH}    ${APELLIDO}
    click element   ${BtnLoginCH}
    wait until page contains    Check - In
    #debug
    Sleep  8s
    ${presentpopupcovid}=   Run Keyword And Return Status    Wait Until Page Contains Element    xpath=//button[contains(.,'OK')]    5s
    Run Keyword If  ('${presentpopupcovid}' == 'True')       click javascript    xpath=//button[contains(.,'OK')]
    Set Test Variable    ${TIENEANCILLARIES}    no

Seleccionar_pasajeros
    ${pasajeros} =   Get Matching Xpath Count   (//label[contains(.,'Hacer Check-in')])
    : FOR    ${INDEX}    IN RANGE    1    ${pasajeros}+1
    \    ${INDEXSTR}=    Convert To String    ${INDEX}
    \    ${CHKPASAJEROSCH}=  Replace String	  ${CHKPASAJEROSCH}	   XXX	  ${INDEXSTR}
    \    Click Javascript    ${CHKPASAJEROSCH}
    \    ${CHKPASAJEROSCH}=  Replace String	  ${CHKPASAJEROSCH}	   ${INDEXSTR}    XXX
    click javascript    ${BtnContinuarCH}


Agregar_ancilaries
    [Arguments]   ${equip}=no
    Sleep  1s
    wait until page contains    Agrega servicios adicionales a cada pasajero para armar tu experiencia de viaje
    Execute javascript       $('.wng-loader').remove()
    ${numancillaries} =   Get Element Count     //div[@class='header-item-check-in-ancillare']
    Set Test Variable    ${numancillaries}
    Sleep    2s
    Run Keyword If    ('${equip}' == 'si')    click element     ${OTROEQUIPAJE}
    Run Keyword If    ('${equip}' == 'si')    Set Test Variable    ${TIENEANCILLARIES}    si
    #scroll element into view    ${BtnContinuarCH}
    click element    ${BtnContinuarCH}

Selecciona_sillas
    wait until page contains     ¿Quieres escoger tu silla?
    Sleep   10s
    #debug
    Click Element     ${BtnNoGracias}
    Sleep   3s
    Click Element     ${BtnNoGracias2}
    #Execute javascript       $('.wng-loader').remove()
    #wait until page contains element     ${BtnContinuarCH}
    #Click Javascript     ${BtnContinuarCH}
    #click     ${BtnNoGracias}

pagar
    wait until page contains    Escoge tu medio de pago preferido   30s
    Input Text     ${NUMTARJETACH}      ${NumeroTarjeta}
    Input Text     ${CODTARJETACH}      ${CodigoExpiracion}
    Input Text     ${EXPTARJETACH}      ${FechaExpiracion}
    Input Text     ${NOMTARJETACH}      PEDRO
    Input Text     ${APETARJETACH}      SQDM
    Input Text     ${IDETARJETACH}      8911103434
    Input Text     ${MAITARJETACH}      a@a.com
    Input Text     ${DIRTARJETACH}      Cra 45 K # 23 -12
    select from list by label     ${PAITARJETACH}      Colombia
    Input Text      ${CIUTARJETACH}      Bogota
    click element   ${TERMINOSUNCH}
    click element   ${BTNPAGOCH}
    wait until page contains     Detalle de vuelo
    click element     ${BTNPAGOCH2}
    wait until page contains     RECIBIMOS TU PAGO     30s
    click element     ${BTNPAGOCH3}

Llenar_datos
     Run Keyword If    ('${TIENEANCILLARIES}' == 'si')     pagar
     wait until page contains    Datos importantes para tu viaje   30s
     wait until page contains element     //span[@class='label-name']
     ${numpasajeros}=    Get Element Count     //span[@class='label-name']
     set test variable    ${numpasajeros}
     ${NOMBRE}=           Set Variable   crf    #FakerLibrary.first_name
     ${APELLIDO}=         Set Variable   ferf     #FakerLibrary.last_name
     input text          id=emergency_name0        ${NOMBRE}
     input text          id=emergency_lastname0    ${APELLIDO}
     ${CELULAR}=         Set Variable       310
     #${TOKEN}=           FakerLibrary.Numerify  %######
     ${TOKEN}=           Set Variable   53654645
     ${CELULAR}=         Catenate   ${CELULAR}    ${TOKEN}
     ${CELULAR}=         Evaluate   '${CELULAR}'.replace(" ", "")
     input text          id=emergency_contact0     ${CELULAR}
     ${ESINTERNACIONAL}=   get matching xpath count    //*[@id="nationality0"]
     set test variable    ${ESINTERNACIONAL}
     Run Keyword If  (${ESINTERNACIONAL} == 1)   llena_pasaporte    0
     Run Keyword If  ('${numpasajeros}' == 0)    click element    ${BtnSiguienteCH}
     Run Keyword If  ('${numpasajeros}' > 0)     ingresar_contactos

llena_pasaporte
    [Arguments]      ${ELEMENTO}
    select from list by label    id=nationality${ELEMENTO}    Colombia
    select from list by label    id=residenceCountry${ELEMENTO}    Colombia
    ${INDICENUM} =   evaluate    ${ELEMENTO}+1
    Run Keyword If  (${ELEMENTO} == 0)    input text    xpath=//input[@name='passportNumber']    236453875
    Run Keyword If  (${ELEMENTO} <> 0)    input text    xpath=(//input[@name='passportNumber'])[${INDICENUM}]    236453875
    select from list by label    id=issueCountry${ELEMENTO}    Colombia
    select from list by label    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Expedido en*'])[${INDICENUM}]/following::select[1]      2032
    select from list by label    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Expedido en*'])[${INDICENUM}]/following::select[2]      Ene
    select from list by label    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Expedido en*'])[${INDICENUM}]/following::select[3]      1

ingresar_contactos
    : FOR    ${INDEX}    IN RANGE    1    ${numpasajeros}
    \    click element    xpath=//a[@href='#collapsePassengerInformation${INDEX}']
    \    ${NOMBRE}=       Set Variable    cristian
    \    ${APELLIDO}=     Set Variable    vergara
    \    ${CELULAR}=     Set Variable       310
    \    ${TOKEN}=       Set Variable       6456536       # FakerLibrary.Numerify  %######
    \    ${CELULAR}=     Catenate   ${CELULAR}    ${TOKEN}
    \    ${CELULAR}=     Evaluate   '${CELULAR}'.replace(" ", "")
    \    Run Keyword If  ('${NAVEGADOR}' == 'gc')    Scroll Element Into View      id=emergency_name${INDEX}
    \    input text       id=emergency_name${INDEX}      ${NOMBRE}
    \    input text       id=emergency_lastname${INDEX}    ${APELLIDO}
    \    input text       id=emergency_contact${INDEX}    ${CELULAR}
    \    Run Keyword If  (${ESINTERNACIONAL} == 1)   llena_pasaporte    ${INDEX}
    click element    ${BtnSiguienteCH}

Preguntas_seguridad
    wait until page contains    Preguntas de seguridad
    wait until page contains element    id=inlineRadio1-0
    ${pestañas} =   Get Element Count   //div[@class='titulo-seguridad']
    #${pestañas} =    Get Element Count   //input[@name='inlineRadioOptions']
    : FOR    ${INDEX}    IN RANGE    0      ${pestañas}
    \    execute javascript   document.getElementById("inlineRadio1-${INDEX}").click();
    #scroll element into view    ${BtnPasabordoCH}
    click element    ${BtnPasabordoCH}
    wait until page contains    CHEQUEADO     60s

Click Javascript
    [Arguments]      ${ELEMENTO}
    ${CADENAJS}=     Set Variable     document.evaluate("XXX", document.body, null, 9, null).singleNodeValue.click();
    ${ELEMENTO}=    Get Substring   ${ELEMENTO}   6
    ${ELEMENTOCLICK} =	 Replace String	  ${CADENAJS}	   XXX	  ${ELEMENTO}
    Execute Javascript    ${ELEMENTOCLICK}

