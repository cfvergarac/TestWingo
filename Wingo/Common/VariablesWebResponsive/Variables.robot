*** Variables ***

${APPIUM_SERVER1}    http://127.0.0.1:4723/wd/hub

&{motoE}             version=8.1.0       nombre=ZY326H4WS8
&{j1mini}            version=6.0.1       nombre=92010e17091d344a
&{motoc}             version=7.0         nombre=ZY326BW5BP
&{motog}             version=9         nombre=ZY322TLT3P

&{CELULARES}         motoe=${motoE}    j1mini=${j1mini}    motoc=${motoc}    motog=${motog}

#DATOS AMBIENTE

&{URL}          QA=https://vuela-uat.wingo.com/      QAIN=https://vuela-uat.wingo.com/en/home     PROD=https://www.wingo.com/     PRODIN=https://www.wingo.com/en/home     QAL=http://vuela.wingo.landsoft.com.co/    QALIN=http://vuela.wingo.landsoft.com.co/en/inicio
&{LENGUAJE}     QA=ES       QAIN=EN    QAL=ES    QALIN=EN

@{PAGINASESP} =    QA   QAL   PROD
@{PAGINASIN} =    QAIN   QALIN   PRODIN

#Desde tarifas

&{URLBOOKING}    QA=https://booking-uat.wingo.com/es/search     PROD=https://booking.wingo.com/es/search    QAIN=https://booking-uat.wingo.com/en/search    PRODIN=https://booking.wingo.com/en/search    QAL=https://ibe.wingo.landsoft.com.co/es/search/