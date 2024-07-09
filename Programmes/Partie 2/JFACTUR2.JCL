//JFACTURE JOB NOTIFY=&SYSUID,CLASS=A,MSGCLASS=H,                       00010001
//       TIME=(0,30),MSGLEVEL=(1,1)                                     00020001
//***********************************************************           00030001
//*  ====> JCL D'APPEL DE LA PROCEDURE COMPDB2  BATCH       *           00040001
//*                                                         *           00050001
//*  ====> COMPIL COBOL/DB2 + BIND   (BATCH)                *           00060001
//*        =======================   *******                *           00070001
//*        REMPLACER API? PAR VOTRE USER TSO                *           00080001
//*           ? : Nì DU GROUPE,  $ : N¢ DU PROGRAMME        *           00090001
//*                  API?DB$ PAR LE NOM DU PROGRAMME        *           00100001
//*                                                         *           00110001
//***********************************************************           00120001
//PROCLIB  JCLLIB ORDER=SDJ.FORM.PROCLIB                                00130001
//*                                                                     00140001
//         SET SYSUID=API11,                                            00150001
//             NOMPGM=FACTURES                                          00160001
//*                                                                     00170001
//APPROC   EXEC COMPDB2                                                 00180001
//STEPDB2.SYSLIB   DD DSN=&SYSUID..SOURCE.DCLGEN,DISP=SHR               00190001
//*                DD DSN=&SYSUID..SOURCE.COPY,DISP=SHR                 00200001
//STEPDB2.SYSIN    DD DSN=&SYSUID..SOURCE.COBOL(&NOMPGM),DISP=SHR       00210001
//STEPDB2.DBRMLIB  DD DSN=&SYSUID..SOURCE.DBRMLIB(&NOMPGM),DISP=SHR     00220002
//STEPLNK.SYSLMOD  DD DSN=&SYSUID..SOURCE.PGMLIB(&NOMPGM),DISP=SHR      00230001
//*TEPCOB.SYSLIB   DD DSN=&SYSUID..DB2FILES.COPY,DISP=SHR               00240001
//*                                                                     00250001
//*--- ETAPE DE BIND --------------------------------------             00260001
//*                                                                     00270001
//BIND     EXEC PGM=IKJEFT01,COND=(4,LT)                                00280001
//DBRMLIB  DD  DSN=&SYSUID..SOURCE.DBRMLIB,DISP=SHR                     00290001
//SYSTSPRT DD  SYSOUT=*,OUTLIM=25000                                    00300001
//SYSTSIN  DD  *                                                        00310001
  DSN SYSTEM (DSN1)                                                     00320001
  BIND PLAN      (FACTURES) -                                           00330001
       QUALIFIER (API11)   -                                            00340001
       ACTION    (REPLACE) -                                            00350001
       MEMBER    (FACTURES) -                                           00360001
       VALIDATE  (BIND)    -                                            00370001
       ISOLATION (CS)      -                                            00380001
       ACQUIRE   (USE)     -                                            00390001
       RELEASE   (COMMIT)  -                                            00400001
       EXPLAIN   (NO)                                                   00410001
/*                                                                      00420001
//******************************************                            00421003
//*ETAPE DE SUPPRESSION DU FICHIER EXISTANT*                            00422003
//******************************************                            00423003
//SUPP     EXEC PGM=IDCAMS                                              00424022
//SYSPRINT DD SYSOUT=*                                                  00425022
//SYSIN    DD *                                                         00426022
  DELETE API11.PROJET.FACTURES.DATA                                     00427022
/*                                                                      00428022
//**************************************************************        00430002
//*                EXECUTION                                   *        00440001
//**************************************************************        00450001
//STEPRUN  EXEC PGM=IKJEFT01,COND=(4,LT)                                00460001
//STEPLIB  DD DSN=&SYSUID..SOURCE.PGMLIB,DISP=SHR                       00470002
//* NEW                                                                 00470109
//         DD DSN=&SYSUID..COBOL.LOAD,DISP=SHR                          00471009
//SYSTSPRT DD  SYSOUT=*,OUTLIM=2500                                     00480001
//SYSOUT   DD  SYSOUT=*,OUTLIM=1000                                     00490001
//MESFACTU DD DSN=API11.PROJET.FACTURES.DATA,DISP=(NEW,CATLG,CATLG),    00491001
//      SPACE=(TRK,(1,1),RLSE),DCB=(LRECL=69,RECFM=FB,BLKSIZE=690)      00492007
//*SYSIN!!!!                                                            00492113
//SYSIN    DD *                                                         00492213
200                                                                     00492323
/*                                                                      00492413
                                                                        00492513
//SYSTSIN  DD  *                                                        00496001
  DSN SYSTEM (DSN1)                                                     00497001
  RUN PROGRAM(FACTURES) PLAN(FACTURES)                                  00498001
/*                                                                      00499001
