*** Settings ***
Library               RequestsLibrary
Library               Collections
Test Template         verificar
#Suite Setup           Create Session    cambioVuelo     https://travelagents-api.wingo.com


*** Test Cases ***
1234  udejhed

*** Keywords ***
verificar
    [Arguments]     ${PNR}
    Create Session    apiraddix     http://wng.connectpoint.uat.radixx.com
    ${resp}=          Get Request     apiraddix       /ConnectPoint.Security.svc
    ${json}=          evaluate     json.loads('''${resp.content}''')    json


