*** Settings ***
Library               RequestsLibrary
Library               Collections
Test Template         verificar
Suite Setup           Create Session    cambioVuelo    ${URLQA}



*** Variables ***
${URLQA}       https://travelagents-api-qa.wingo.com
${URLPROD}     https://travelagents-api.wingo.com


*** Test Cases ***
1a	22EMAO	11284	2020-05-13	False	False
1b	1QG847	11567	2020-05-11	False	False
18	WVJI0Q	11542	2020-05-17	True	True


*** Keywords ***
verificar
    [Arguments]     ${PNR}    ${IDVUELO}     ${FECHA}    ${PENALIDAD}    ${DIFERENCIA}
    ${resp}=          Get Request     cambioVuelo     /v1/segmentPenaltyValidation?confirmationNum=${PNR}&logicalFlightId=${IDVUELO}&departureDate=${FECHA}
    ${json}=          evaluate     json.loads('''${resp.content}''')    json

    ${numPasajeros}=     Get length   ${json['response']}
    Log    ${numPasajeros}

    : FOR    ${INDEX}    IN RANGE    0    ${numPasajeros}
        \    ${PENALIDADJSON}=      Convert To String    ${json['response'][${INDEX}]['penalty']}
        \    ${DIFERENCIAJSON}=     Convert To String    ${json['response'][${INDEX}]['differences']}
        \    Run Keyword If  ('${json['response'][${INDEX}]['ptcIdPersona']}' == '1')         Should Be Equal         ${PENALIDADJSON}     ${PENALIDAD}
        \    Run Keyword If  ('${json['response'][${INDEX}]['ptcIdPersona']}' == '1')         Should Be Equal         ${DIFERENCIAJSON}    ${DIFERENCIA}


#Run Keyword If  ('${json['response'][${INDEX}]['ptcIdPersona']}' == '5')