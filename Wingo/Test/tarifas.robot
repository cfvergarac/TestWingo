*** Settings ***
Resource          ../RecursosQA.robot


*** Test Cases ***
CP_001
   ${URL}=    concatena url       QA   BOG   BLB   2020-04-03   x    1   0   0   COP   gc
   Manejo_flex
   Seleccionar_flex      no
   Sleep  3s
   close browser
   #Llena_datos_viajero
   #Agregar_ancillarie    no
   #continuar_a_sillas
   #Selecciona_sillas
   #hacer_pago    tc




