/*PROGRAMA: CREACION DE TABLAS TEMPORALES PARA            */
/*          PARAMETRIZACION ITC                           */
/*SOPORTE Y MANTENIMIENTO DE APLICACIONES CORPORATIVAS    */
/*AUTOR: ANDRES CUARTAS - ACCENTURE - NOVIEMBRE 2017      */

      PGM

/*DECLARACION DE VARIABLES                                */
             DCL        VAR(&NAMEFIN) TYPE(*CHAR) LEN(10)
             DCL        VAR(&NAMETEMP) TYPE(*CHAR) LEN(10)
             DCLF       FILE(*LIBL/ITCFFLIST)

/*CICLO PARA CREAR Y COPIAR DATOS A ARCHIVOS TEMPORALES   */

      INICIO:
             RCVF
             MONMSG     MSGID(CPF0864) EXEC(GOTO CMDLBL(FIN))

             CHGVAR     VAR(&NAMEFIN) VALUE(&PFFINAL)
             CHGVAR     VAR(&NAMETEMP) VALUE(&PFTMP)

             CRTDUPOBJ  OBJ(&NAMEFIN) FROMLIB(*LIBL) OBJTYPE(*FILE) +
                          TOLIB(*SAME) NEWOBJ(&NAMETEMP) DATA(*NO) +
                          CST(*NO)
             MONMSG MSGID(CPF0000)

             CPYF       FROMFILE(*LIBL/&NAMEFIN) +
                          TOFILE(*LIBL/&NAMETEMP) MBROPT(*REPLACE) +
                          CRTFILE(*NO)
             MONMSG MSGID(CPF0000)

             GOTO INICIO
/*-----------------------------------------------------------------*/
      FIN:
      ENDPGM
