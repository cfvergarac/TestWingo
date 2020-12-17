*** Settings ***
Library               RequestsLibrary
Library               Collections
Test Template         verificar
Suite Setup           Create Session    cambioVuelo    ${URLQA}



*** Variables ***
${URLQA}       http://wng.connectpoint.uat.radixx.com
${URLPROD}     https://travelagents-api.wingo.com



*** Test Cases ***
1a	LDNVRS



*** Keywords ***
verificar
    [Arguments]     ${PNR}

    &{data}=           Create Dictionary     rad:SecurityGUID=d054ae0cfafdm9tbp47d0i6ab54bg3566c265531e826    rad:AccessibleCarrierCode=P5    rad:ActionType=GetReservation      rad:SeriesNumber=299     rad:ConfirmationNumber=6HEPXN    rad:ClientIPAddress=?    rad:HistoricUserName=?
    &{headers}=        Create Dictionary     Cache-Control=no-cache    Postman-Token=<calculated when request is sent>    Content-Type=application/xml    Content-Length=<calculated when request is sent>    Host=<calculated when request is sent>     User-Agent=PostmanRuntime/7.25.0       Accept=*/*     Accept-Encoding=gzip, deflate, br      Connection=keep-alive    Content-Type=text/xml    SOAPAction="http://tempuri.org/IConnectPoint_Reservation/RetrievePNR"
    #${headers}=        Create Dictionary      Content-Type=text/xml
    ${resp}=           Post Request     cambioVuelo     /ConnectPoint.Reservation.svc    data=${data}    headers=${headers}
    Log                ${resp.content}
    log to console     ${resp.content}

    #${json}=          evaluate     json.loads('''${resp.content}''')    json

