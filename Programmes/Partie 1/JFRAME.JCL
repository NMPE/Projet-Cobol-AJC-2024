//JFRAME   JOB NOTIFY=&SYSUID,CLASS=A,MSGCLASS=H,                       00010000
//       TIME=(0,30),MSGLEVEL=(1,1)                                     00020000
//***********************************************************           00030000
//*  ====> JCL D'APPEL DE LA PROCEDURE COMPDB2  BATCH       *           00040000
//*                                                         *           00050000
//*  ====> COMPIL COBOL/DB2 + BIND   (BATCH)                *           00060000
//*        =======================   *******                *           00070000
//*        REMPLACER API? PAR VOTRE USER TSO                *           00080000
//*           ? : Nì DU GROUPE,  $ : N¢ DU PROGRAMME        *           00090000
//*                  API?DB$ PAR LE NOM DU PROGRAMME        *           00100000
//*                                                         *           00110000
//***********************************************************           00120000
//PROCLIB  JCLLIB ORDER=SDJ.FORM.PROCLIB                                00130000
//*                                                                     00140000
//         SET SYSUID=API11,                                            00150000
//             NOMPGM=AJCFRAME                                          00160000
//*                                                                     00170000
//APPROC   EXEC COMPDB2                                                 00180000
//STEPDB2.SYSLIB   DD DSN=&SYSUID..SOURCE.DCLGEN,DISP=SHR               00190000
//*                DD DSN=&SYSUID..SOURCE.COPY,DISP=SHR                 00200000
//STEPDB2.SYSIN    DD DSN=&SYSUID..SOURCE.COBOL(&NOMPGM),DISP=SHR       00210003
//STEPDB2.DBRMLIB  DD DSN=&SYSUID..SOURCE.DBRMLIB(&NOMPGM),DISP=SHR     00220000
//STEPLNK.SYSLMOD  DD DSN=&SYSUID..SOURCE.PGMLIB(&NOMPGM),DISP=SHR      00230000
//*TEPCOB.SYSLIB   DD DSN=&SYSUID..DB2FILES.COPY,DISP=SHR               00240000
//*                                                                     00250000
//*--- ETAPE DE BIND --------------------------------------             00260000
//*                                                                     00270000
//BIND     EXEC PGM=IKJEFT01,COND=(4,LT)                                00280000
//DBRMLIB  DD  DSN=&SYSUID..SOURCE.DBRMLIB,DISP=SHR                     00290000
//SYSTSPRT DD  SYSOUT=*,OUTLIM=25000                                    00300000
//SYSTSIN  DD  *                                                        00310000
  DSN SYSTEM (DSN1)                                                     00320000
  BIND PLAN      (AJCFRAME) -                                           00330000
       QUALIFIER (API11)   -                                            00340000
       ACTION    (REPLACE) -                                            00350000
       MEMBER    (AJCFRAME) -                                           00360000
       VALIDATE  (BIND)    -                                            00370000
       ISOLATION (CS)      -                                            00380000
       ACQUIRE   (USE)     -                                            00390000
       RELEASE   (COMMIT)  -                                            00400000
       EXPLAIN   (NO)                                                   00410000
/*                                                                      00420000
//**************************************************************        00430000
//*                EXECUTION                                   *        00440000
//**************************************************************        00450000
//STEPRUN  EXEC PGM=IKJEFT01,COND=(4,LT)                                00460000
//STEPLIB  DD DSN=&SYSUID..SOURCE.PGMLIB,DISP=SHR                       00470000
//SYSTSPRT DD  SYSOUT=*,OUTLIM=2500                                     00480000
//SYSOUT   DD  SYSOUT=*,OUTLIM=1000                                     00490000
//VENTESA  DD DSN=API11.PROJET.VENTESAS.DATA,DISP=SHR                   00491000
//VENTESE  DD DSN=API11.PROJET.VENTESEU.DATA,DISP=SHR                   00492000
//*SYSIN    DD *                                                        00493000
//*50                                                                   00494000
//*                                                                     00495000
//SYSTSIN  DD  *                                                        00496000
  DSN SYSTEM (DSN1)                                                     00497000
  RUN PROGRAM(AJCFRAME) PLAN(AJCFRAME)                                  00498000
/*                                                                      00499000
