//JCDATEJO JOB (ACCT#),'STEEVE',MSGCLASS=H,REGION=4M,                   00010001
//    CLASS=A,MSGLEVEL=(1,1),NOTIFY=&SYSUID,COND=(4,LT)                 00020000
//*                                                                     00030000
//*  ETAPE DE COMPILATION                                               00040000
//*                                                                     00050000
//COMPIL   EXEC IGYWCL,PARM.COBOL=(DYNAM,ADV,OBJECT,LIB,TEST,APOST)     00060000
//COBOL.SYSIN  DD DSN=API11.SOURCE.COBOL(DATEJOUR),DISP=SHR             00070001
//COBOL.SYSLIB DD DSN=CEE.SCEESAMP,DISP=SHR                             00080000
//*            DD DSN=API2.COB.CPY,DISP=SHR                             00090000
//*                                                                     00100000
//*  ETAPE DE LINKEDIT                                                  00110000
//*                                                                     00120000
//LKED.SYSLMOD DD DSN=API11.COBOL.LOAD,DISP=(SHR,KEEP,KEEP)             00130000
//LKED.SYSIN DD *                                                       00140000
 NAME DATEJOUR(R)                                                       00150001
/*                                                                      00160000
