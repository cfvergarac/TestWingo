*** Settings ***
Resource    RecursosChekin.robot


*** Test Cases ***
checkin
    Abrir_Pagina_Chekin    QACIPROD    gc
    Loguearse_Chekin        EPGFNL    CERRA
    #Sleep   10s
    Seleccionar_pasajeros
    #Sleep   90s
    Agregar_ancilaries     equip=no
    Selecciona_sillas
    Llenar_datos
    #Preguntas_seguridad


