*** Settings ***
Library               RequestsLibrary
Library               Collections
Library               SeleniumLibrary
Test Template         verificar
Suite Setup           Run Keywords      Create Session    meta    ${URLPROD.URL}
...         AND       Open Browser      https://www.google.com/     gc




*** Variables ***
&{URLQA}         URL=http://metasearch-api-qa.wingo.com    Token=a2F5YWt0b2tlbmRlcHJ1ZWJh
&{URLPROD}       URL=http://metasearch-api.wingo.com       Token=U2t5cHJvZEFQSXJlcXVlc3Q=



*** Test Cases ***
1    BOG	PTY   OW	COP 	2020-12-20	  2020-12-27



*** Keywords ***
verificar
    [Arguments]     ${ORIGEN}    ${DESTINO}     ${TIPORUTA}    ${MONEDA}     ${FECHAIDA}    ${FECHAVUELTA}

    AsignarUrl     ${ORIGEN}    ${DESTINO}     ${TIPORUTA}    ${MONEDA}     ${FECHAIDA}    ${FECHAVUELTA}
    Log to console    ${URL}
    Go To     ${URL}

    #&{headers}=        Create Dictionary     Cache-Control=no-cache    Postman-Token=<calculated when request is sent>    Host=<calculated when request is sent>     User-Agent=PostmanRuntime/7.26.8       Accept=*/*     Accept-Encoding=gzip, deflate, br      Connection=keep-alive     X-WINGO-TOKEN=a2F5YWt0b2tlbmRlcHJ1ZWJh
    &{headers}=        Create Dictionary      X-WINGO-TOKEN=${URLPROD.Token}
    ${resp}=           Get Request     meta    /v1/metasearch/availableflights?origin=${ORIGEN}&destination=${DESTINO}&currency=${MONEDA}&adults=1&children=0&infants=0&flightType=${TIPORUTA}&startDate=${FECHAIDA}&endDate=${FECHAVUELTA}      headers=${headers}
    ${json}=           evaluate     json.loads('''${resp.content}''')    json

     ${ruta} =   Catenate    ${ORIGEN}   ${DESTINO}   ${TIPORUTA}    ${MONEDA}     ${FECHAIDA}    ${FECHAVUELTA}
     Log to console    ${ruta}
     Log to console    '${json['response']['outboundFlights'][0]['amount']}'
     ${TIPORUTA}=  convert to string    ${TIPORUTA}
     Run Keyword If  ('${TIPORUTA}' == 'RT')    Log to console    '${json['response']['returnFlights'][0]['amount']}'
     Log                ${resp.content}
    #log to console     ${resp.content}

    #${json}=          evaluate     json.loads('''${resp.content}''')    json


AsignarUrl
   [Arguments]     ${ORIGEN}    ${DESTINO}     ${TIPORUTA}    ${MONEDA}     ${FECHAIDA}    ${FECHAVUELTA}
   ${TIPORUTA}=  convert to string    ${TIPORUTA}
   Run Keyword If  ('${TIPORUTA}' == 'RT')    asigna url RT    ${ORIGEN}    ${DESTINO}     ${FECHAIDA}    ${FECHAVUELTA}    ${MONEDA}
   Run Keyword If  ('${TIPORUTA}' == 'OW')    asigna url OW    ${ORIGEN}    ${DESTINO}     ${FECHAIDA}      ${MONEDA}

asigna url RT
    [arguments]    ${UCIUDADIDA}   ${UCIUDADVUELTA}   ${UFECHAIDA}    ${UFECHAVUELTA}   ${UMONEDA}
    ${URL}=    Catenate  SEPARATOR=/   https://booking.wingo.com/es/search   ${UCIUDADIDA}   ${UCIUDADVUELTA}   ${UFECHAIDA}   ${UFECHAVUELTA}   1   0   0   0   ${UMONEDA}   0   0
    set test variable   ${URL}
    ${TVUELO}=  set variable  RT
    set test variable   ${TVUELO}
	#    ${UMONEDA}   multicurrency

asigna url OW
    [arguments]   ${UCIUDADIDA}   ${UCIUDADVUELTA}   ${UFECHAIDA}     ${UMONEDA}
    ${URL}=    Catenate  SEPARATOR=/    https://booking.wingo.com/es/search    ${UCIUDADIDA}   ${UCIUDADVUELTA}   ${UFECHAIDA}   1   0   0    0   1   ${UMONEDA}   0   0
    set test variable   ${URL}
    ${TVUELO}=  set variable  OW
    set test variable   ${TVUELO}
