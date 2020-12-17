*** Settings ***
Resource          ../RecursosQA.robot
#Test Setup       Register Keyword To Run On Failure    close browser

*** Test Cases ***
CP_001
    Abrir_Pagina_Principal     PROD    ff
    Ingresar_tipo_vuelo        OW
    Ingresar_lugares           BOG   CTG
    Seleccionar_Fechas         2021-03-15   2020-12-28
    Seleccionar_moneda         USD
    Ingresa_Pasajeros          14    0    0
    Continuar
    Seleccionar_flex      no
    Llena_datos_viajero
    Agregar_ancillarie    no
    continuar_a_sillas
    Selecciona_sillas
    #hacer_pago    tc
