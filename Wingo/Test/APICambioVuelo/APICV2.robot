*** Settings ***
Library               RequestsLibrary
Library               Collections
Test Template         verificar
Suite Setup           Create Session    cambioVuelo    ${URLPROD}



*** Variables ***
${URLQA}       https://travelagents-api-qa.wingo.com
${URLPROD}     https://travelagents-api.wingo.com


*** Test Cases ***
#1a	 11HSOS  	11438	2020-11-12    11318  	2020-11-23  	False 	True
1a	 CBBUDW		11489	2020-09-21	  11414	    2020-09-21  	True 	True




*** Keywords ***
verificar
    [Arguments]     ${PNR}    ${IDVUELO}     ${FECHA}    ${IDVUELO2}     ${FECHA2}    ${PENALIDAD}    ${DIFERENCIA}
    ${resp}=          Get Request     cambioVuelo     /v1/segmentPenaltyValidationV2?confirmationNum=${PNR}&logicalFlightId=${IDVUELO}&departureDate=${FECHA}&logicalFlightId2=${IDVUELO2}&departureDate2=${FECHA2}
    ${json}=          evaluate     json.loads('''${resp.content}''')    json

    ${numPasajeros}=     Get length   ${json['response']}
    Log    ${numPasajeros}

    : FOR    ${INDEX}    IN RANGE    0    ${numPasajeros}
        \    ${PENALIDADJSON}=      Convert To String    ${json['response'][${INDEX}]['penalty']}
        \    ${DIFERENCIAJSON}=     Convert To String    ${json['response'][${INDEX}]['differences']}
        \    Run Keyword If  ('${json['response'][${INDEX}]['ptcIdPersona']}' == '1')         Should Be Equal         ${PENALIDADJSON}     ${PENALIDAD}
        \    Run Keyword If  ('${json['response'][${INDEX}]['ptcIdPersona']}' == '1')         Should Be Equal         ${DIFERENCIAJSON}    ${DIFERENCIA}


#Run Keyword If  ('${json['response'][${INDEX}]['ptcIdPersona']}' == '5')