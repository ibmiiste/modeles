000100200930             PGM
000200200930             DCL &JOB *CHAR 10
000300200930             DCL &USER *CHAR 10
000400200930             DCL &RPLY *CHAR 1
000500200930             RTVJOBA    JOB(&JOB) USER(&USER)
000600200930             CLRMSGQ    MSGQ(&JOB)
000700200930             MONMSG CPF0000
000800200930             CLRMSGQ    MSGQ(&USER)
000900200930             MONMSG CPF0000
001000200930             CHGMSGQ    MSGQ(&JOB) DLVRY(*BREAK)
001100200930             MONMSG CPF0000
001200200930 OPT3:       SNDUSRMSG  MSG('''**** VOUS ALLEZ ARRETER LE SYSTEME +
001300200930                          G=OUI C=NON. ****''''''') VALUES(C C G G) +
001400200930                          TOMSGQ(&JOB) MSGRPY(&RPLY)
001500200930
001600200930             IF         COND((&RPLY *NE 'G') & (&RPLY *NE 'g')) +
001700200930                          THEN(GOTO CMDLBL(FIN))
001800200930
001900200930             ELSE DO
002000200930/*           QSYS/PWRDWNSYS OPTION(*IMMED) RESTART(*YES)  */
002100200930             ENDDO
002200200930 FIN:        ENDPGM
