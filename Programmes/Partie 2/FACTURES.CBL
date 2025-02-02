000100 IDENTIFICATION DIVISION.
000200  PROGRAM-ID.   FACTURES.
000300
000400 ENVIRONMENT DIVISION.
000500 CONFIGURATION SECTION.
000600  SPECIAL-NAMES.
000700      DECIMAL-POINT IS COMMA.
000800
000810 INPUT-OUTPUT SECTION.
000820 FILE-CONTROL.
000830     SELECT FACTURE ASSIGN TO MESFACTU
000840     ORGANIZATION IS SEQUENTIAL
000850     FILE STATUS IS FS-FACTURES.
000902
000910 DATA DIVISION.
001000 FILE SECTION.
001100 FD FACTURE.
001110 01 ENR-FACTURE PIC X(69).
003000
003100 WORKING-STORAGE SECTION.
003200  77 FS-FACTURES     PIC 99.
003300  77 WS-ANO          PIC 99.
003400  77 WS-DATE         PIC X(10).
003401
003402  77 WS-PRICE        PIC 9(7)V99.
003403  77 WS-TOTAL-LIGNE  PIC 9(8)V99.
003404  77 WS-TOTAL-HT     PIC 9(8)V99.
003405  77 WS-TOTAL-TTC    PIC 9(8)V99.
003406  77 WS-MONTANT-TVA  PIC 9(8)V99.
003407  77 TAUX-TVA        PIC 99V9.
003409  77 WS-TAUX-TVA     PIC 9V999.
003410
003412  77 WS-SSPROG PIC X(8) VALUE 'DATEJOUR'.
003415
003420  01 L-LIGNE-FIN.
003431      05 FILLER  PIC X(19)  VALUE ALL '-'.
003432      05 FILLER  PIC X(28)  VALUE 'FIN DE FACTURE, COMMANDE N� '.
003433      05 FIN-NO  PIC X(3).
003434      05 FILLER  PIC X(19)  VALUE ALL '-'.
003435
003436  01 L-LIGNE-VIDE.
003437      05 FILLER  PIC X(69)  VALUE ALL ' '.
003438
003439  01 L-LIGNE-HAUT.
003440      05 FILLER  PIC X(40)  VALUE ALL ' '.
003441      05 FILLER  PIC X(29)  VALUE ALL '_'.
003442
003443  01 L-LIGNE-BAS.
003444      05 FILLER  PIC X(40)  VALUE ALL ' '.
003445      05 FILLER  PIC X      VALUE '|'.
003446      05 FILLER  PIC X(27)  VALUE ALL '_'.
003447      05 FILLER  PIC X      VALUE '|'.
003448
003449  01 L-TAB-HAUT.
003450      05 FILLER  PIC X(69)  VALUE ALL '_'.
003451
003452  01 L-TAB-BAS.
003454      05 FILLER  PIC X      VALUE '|'.
003455      05 FILLER  PIC X(67)  VALUE ALL '_'.
003456      05 FILLER  PIC X      VALUE '|'.
003457
003458  01 L-ENTETE.
003459      05 FILLER  PIC X(40)  VALUE ALL ' '.
003460      05 FILLER  PIC XXX    VALUE '|  '.
003461      05 FIN-ENT PIC X(25)  VALUE 'EN TETE CLIENT'.
003462      05 FILLER  PIC X      VALUE '|'.
003463
003464  01 L-COMPANY.
003465      05 FILLER  PIC X(40)  VALUE ALL ' '.
003466      05 FILLER  PIC X      VALUE  '|'.
003467      05 WS-COMP PIC X(27).
003468      05 FILLER  PIC X      VALUE  '|'.
003469
003470  01 L-ADDRESS.
003471      05 FILLER     PIC X(40)  VALUE ALL ' '.
003472      05 FILLER     PIC X      VALUE '|'.
003473      05 WS-ADDRESS PIC X(27).
003474      05 FILLER     PIC X      VALUE '|'.
003475
003476  01 L-CITY-ZIP.
003477      05 FILLER      PIC X(40)  VALUE ALL ' '.
003478      05 FILLER      PIC XXX    VALUE '|  '.
003480      05 WS-CITY-ZIP PIC X(25).
003492      05 FILLER      PIC X      VALUE '|'.
003493
003494  01 L-STATE.
003496      05 FILLER   PIC X(40)  VALUE ALL ' '.
003497      05 FILLER   PIC XXX    VALUE '|  '.
003498      05 WS-STATE PIC X(25).
003499      05 FILLER   PIC X      VALUE '|'.
003500
003501  01 L-DATE.
003502      05 FILLER    PIC X(10) VALUE 'PARIS, LE '.
003504      05 WS-DATE2  PIC X(26).
003505      05 FILLER    PIC X(33) VALUE ALL ' '.
003506
003507  01 L-COMMANDE.
003508      05 FILLER    PIC X(24) VALUE 'NUMERO DE LA COMMANDE : '.
003509      05 WS-O-NO   PIC X(3).
003510      05 FILLER    PIC X(42) VALUE ALL ' '.
003511
003512  01 L-COMMANDE-DATE.
003513      05 FILLER    PIC X(24) VALUE 'DATE DE LA COMMANDE   : '.
003514      05 WS-O-DATE PIC X(10).
003515      05 FILLER    PIC X(35) VALUE ALL ' '.
003516
003524  01 L-DEPARTEMENT.
003525      05 FILLER PIC X(30) VALUE 'VOTRE CONTACT AU DEPARTEMENT  '.
003526      05 WS-DEPARTEMENT PIC X(64).
003527
003533  01 L-PRODUITS.
003534      05 FILLER PIC X     VALUE '|'.
003535      05 FILLER PIC X(5)  VALUE 'P_NO '.
003537      05 FILLER PIC X(29) VALUE ' DESCRIPTION        '.
003538      05 FILLER PIC X(10) VALUE ' QUANTITY '.
003539      05 FILLER PIC X(12) VALUE 'ITEMS.PRICE '.
003540      05 FILLER PIC X(11) VALUE 'TOTAL LIGNE'.
003541      05 FILLER PIC X     VALUE '|'.
003543
003556  01 L-PRODUITS2.
003557      05 FILLER           PIC X     VALUE '|'.
003558      05 WS-P-NO          PIC X(3).
003559      05 WS-P-DESCRIPTION PIC X(30).
003560      05 FILLER           PIC X(3) VALUE ALL ' '.
003561      05 WS-QUANTITY      PIC 9(2).
003562      05 FILLER           PIC X(3) VALUE ALL ' '.
003563      05 ED-PRICE         PIC Z(6)9,99.
003564      05 FILLER           PIC X(3) VALUE ALL ' '.
003565      05 ED-TOTAL-LIGNE   PIC Z(7)9,99.
003566      05 FILLER           PIC X(3)  VALUE '  |'.
003570
003571  01 L-TOTAL-HT.
003572      05 FILLER        PIC X(40) VALUE ALL ' '.
003573      05 FILLER        PIC X(17) VALUE 'TOTAL HT        :'.
003574      05 ED-TOTAL-HT   PIC Z(7)9,99.
003575
003576  01 L-MONTANT-TVA.
003577     05 FILLER         PIC X(40) VALUE ALL ' '.
003578     05 FILLER         PIC X(10) VALUE 'MONT TVA ('.
003579     05 ED-TVA         PIC 99,9.
003580     05 FILLER         PIC X(3) VALUE '%):'.
003581     05 ED-MONTANT-TVA PIC Z(7)9,99.
003582
003583   01 L-TOTAL-TTC.
003584       05 FILLER       PIC X(40) VALUE ALL ' '.
003585       05 FILLER       PIC X(17) VALUE 'TOTAL TTC       :'.
003586       05 ED-TOTAL-TTC PIC Z(7)9,99.
003590
003598     EXEC SQL
003600       INCLUDE SQLCA
003700     END-EXEC
003800
003900     EXEC SQL
004000       INCLUDE ORDERS
004100     END-EXEC
004200
004210     EXEC SQL
004220       INCLUDE PROD
004230     END-EXEC
004292
004300     EXEC SQL
004400       INCLUDE CUSTOMER
004500     END-EXEC
004510
004600     EXEC SQL
004700       INCLUDE EMP
004800     END-EXEC
004900
005000     EXEC SQL
005100       INCLUDE DEP
005200     END-EXEC
005210
005300     EXEC SQL
005400       INCLUDE ITEMS
005500     END-EXEC
005600
005700* DECLARATION DU CURSEUR ORDERS
005800      EXEC SQL
005900         DECLARE CORDERS CURSOR
006000         FOR
006100         SELECT O_NO, S_NO, C_NO, O_DATE
006200         FROM ORDERS
006300      END-EXEC
009800
009900* DECLARATION DU CURSEUR ITEM
010000      EXEC SQL
010100         DECLARE CITEMS CURSOR
010200         FOR
010300         SELECT O_NO, P_NO, QUANTITY, PRICE
010400         FROM ITEMS
010410         WHERE O_NO = :ORD-O-NO
010500      END-EXEC
010600
010700 PROCEDURE DIVISION.
010808
010809****** RECEPTION DU TAUX TVA *****
010810     ACCEPT TAUX-TVA FROM SYSIN
010811*    DISPLAY TAUX-TVA
010812     MOVE TAUX-TVA TO ED-TVA
010813*    DISPLAY ED-TVA
010814     COMPUTE WS-TAUX-TVA = TAUX-TVA / 100
010815*    DISPLAY WS-TAUX-TVA
010817
010818
010820************ APPEL DU SOUS-PROGAMME  ********
010821     CALL WS-SSPROG USING BY REFERENCE WS-DATE2
010822*********************************************
010823
010824*******OUVERTURE DU FICHIER*******
010825     PERFORM OUV-FACTURES
010830
010900     EXEC SQL
011000         OPEN CORDERS
011100     END-EXEC
011200     PERFORM TEST-SQLCODE
011300     INITIALIZE ST-ORD
011400     PERFORM FETCH-ORDERS
011810
011900     PERFORM UNTIL SQLCODE = +100
012000
012220*****ECRITURE DANS FICHIER*****
012402
012403       EXEC SQL
012404           OPEN CITEMS
012405       END-EXEC
012406       PERFORM TEST-SQLCODE
012414       PERFORM FETCH-ITEMS
012420
012510       PERFORM UNTIL ORD-O-NO NOT EQUAL ITEM-O-NO
012511         DISPLAY "BOUCLE 2"
012515         PERFORM FETCH-ITEMS
012540       END-PERFORM
012542
012543       DISPLAY " "
012550       EXEC SQL
012560          CLOSE CITEMS
012570       END-EXEC
012572       PERFORM TEST-SQLCODE
012580
012581*ECRITURE DANS FICHIER
012582       PERFORM ECRITURE-TOTAL-PRODUITS
012584       PERFORM ECRITURE-MONTANT-TVA
012585       PERFORM ECRITURE-TOTAL-TTC
012586       MOVE ZERO TO WS-TOTAL-HT
012587       MOVE ZERO TO WS-TOTAL-TTC
012588
012590       INITIALIZE ST-ORD
012591       PERFORM FETCH-ORDERS
012592
012595
012600     END-PERFORM
012720
012800     EXEC SQL
012900        CLOSE CORDERS
013000     END-EXEC
013100     PERFORM TEST-SQLCODE
013200
013210     EXEC SQL ROLLBACK END-EXEC
013211     PERFORM TEST-SQLCODE
013220
013230     PERFORM FERM-FACTURES
013300     GOBACK.
013400
014100
014200 TEST-SQLCODE.
014300      EVALUATE TRUE
014400         WHEN SQLCODE = ZERO
014500                 CONTINUE
014600          WHEN SQLCODE > 0
014700              IF SQLCODE = +100
014800                  DISPLAY "JEU DE DONNEES VIDE OU FINI"
014900              ELSE
015000                  DISPLAY "WARNING : ", SQLCODE
015100              END-IF
015200          WHEN SQLCODE < ZERO
015300              PERFORM ABEND-PROG
015400      END-EVALUATE.
015410
015500 ABEND-PROG.
015600       DISPLAY "ANOMALIE GRAVE : ", SQLCODE
015700       COMPUTE WS-ANO = 1 / WS-ANO.
015800
015900 FETCH-ORDERS.
016000      EXEC SQL
016100          FETCH CORDERS
016200          INTO :ORD-O-NO, :ORD-S-NO, :ORD-C-NO, :ORD-O-DATE
016300      END-EXEC
016400      PERFORM TEST-SQLCODE
016401      IF SQLCODE NOT EQUAL +100 THEN
016410         DISPLAY "NUM COMMANDE  : ", ORD-O-NO
016420         DISPLAY "NUM EMPLOYE   : ", ORD-S-NO
016430         DISPLAY "NUM CLIENT  : ", ORD-C-NO
016440         DISPLAY "DATE COMMANDE   : ", ORD-O-DATE
016450         DISPLAY " "
016451
016452         PERFORM FETCH-CUSTOMERS
016454         PERFORM FETCH-EMPLOYEES
016455         PERFORM ECRITURE-DEPARTEMENT
016456         PERFORM ENTETE-PRODUITS
016460      END-IF.
016500
016502 FETCH-CUSTOMERS.
016516     EXEC SQL
016518        SELECT C_NO, COMPANY, ADDRESS, CITY, STATE, ZIP
016519        INTO :CUST-C-NO, :CUST-COMPANY, :CUST-ADDRESS,
016520             :CUST-CITY, :CUST-STATE, :CUST-ZIP
016521        FROM CUSTOMERS
016522        WHERE C_NO = :ORD-C-NO
016523     END-EXEC
016526     PERFORM TEST-SQLCODE
016527
016528*    DISPLAY "CUST-C-NO    : ", CUST-C-NO
016529*    DISPLAY "CUST-COMPANY : ", CUST-COMPANY
016530*    DISPLAY "CUST-ADDRESS : ", CUST-ADDRESS
016531*    DISPLAY "CUST-CITY    : ", CUST-CITY
016532*    DISPLAY "CUST-STATE   : ", CUST-STATE
016533     DISPLAY "CUST-ZIP     : ", CUST-ZIP
016534     PERFORM ECRITURE-ENTETE.
016539
016541 FETCH-EMPLOYEES.
016557     EXEC SQL
016558        SELECT E_NO, DEPT, LNAME, FNAME
016559        INTO :EMP-E-NO, :EMP-DEPT, :EMP-LNAME,
016560        :EMP-FNAME
016561        FROM EMPLOYEES
016562        WHERE E_NO= :ORD-S-NO
016563     END-EXEC
016564     PERFORM TEST-SQLCODE
016565
016566     IF SQLCODE NOT EQUAL +100 THEN
016567*        DISPLAY "EMP-E-NO     : ", EMP-E-NO
016568*        DISPLAY "EMP-DEPT     : ", EMP-DEPT
016569*        DISPLAY "EMP-LNAME    : ", EMP-LNAME
016570         DISPLAY "EMP-FNAME    : ", EMP-FNAME
016571
016573         PERFORM FETCH-DEPTS
016574     END-IF.
016580
016582 FETCH-DEPTS.
016593     EXEC SQL
016596        SELECT DEPT, DNAME
016597        INTO :DEP-DEPT, :DEP-DNAME
016598        FROM DEPTS
016599        WHERE DEPT = :EMP-DEPT
016600     END-EXEC
016601
016602     PERFORM TEST-SQLCODE
016603*    DISPLAY "DEP-DEPT     : ", DEP-DEPT
016604     DISPLAY "DEP-DNAME    : ", DEP-DNAME.
016605
016611
016612 FETCH-ITEMS.
016614     INITIALIZE ST-ITEM
016615
016616     EXEC SQL
016617         FETCH CITEMS
016618         INTO :ITEM-O-NO, :ITEM-P-NO, :ITEM-QUANTITY, :ITEM-PRICE
016619     END-EXEC
016620     PERFORM TEST-SQLCODE
016621     IF ORD-O-NO EQUAL ITEM-O-NO THEN
016622        DISPLAY "NUMERO PRODUIT: ", ITEM-P-NO
016623        PERFORM FETCH-PRODUCTS
016624     END-IF.
016625
016626 FETCH-PRODUCTS.
016640
016642     EXEC SQL
016643        SELECT P_NO, DESCRIPTION, PRICE
016644        INTO :PROD-P-NO, :PROD-DESCRIPTION, :PROD-PRICE
016645        FROM PRODUCTS
016646        WHERE P_NO = :ITEM-P-NO
016647     END-EXEC
016649     PERFORM TEST-SQLCODE
016650
016651     DISPLAY "DESCRIPTION: ", PROD-DESCRIPTION
016652*    DISPLAY "P_NO: ", PROD-P-NO
016653*    DISPLAY "PRICE: ", PROD-PRICE
016654     PERFORM ECRITURE-PRODUITS.
016655
016660 OUV-FACTURES.
016661     OPEN OUTPUT FACTURE
016662     IF FS-FACTURES NOT = ZERO THEN
016663         DISPLAY "ERR OPEN - FILE STATUS : ", FS-FACTURES
016664         PERFORM ABEND-PROG
016665     END-IF.
016666
016667 FERM-FACTURES.
016668     CLOSE FACTURE
016669     IF FS-FACTURES NOT = ZERO THEN
016670         DISPLAY "ERR CLOSE - FILE STATUS : ", FS-FACTURES
016671         PERFORM ABEND-PROG
016672     END-IF.
016673
016674 ECRITURE-ENTETE.
016676      WRITE ENR-FACTURE FROM L-LIGNE-HAUT
016677      WRITE ENR-FACTURE FROM L-ENTETE
016678
016679      MOVE CUST-COMPANY TO WS-COMP
016680      WRITE ENR-FACTURE FROM L-COMPANY
016682
016683      MOVE CUST-ADDRESS TO WS-ADDRESS
016684      WRITE ENR-FACTURE FROM L-ADDRESS
016685
016686      STRING
016688         CUST-CITY-TEXT(1:CUST-CITY-LEN) DELIMITED BY SIZE
016689         ', ' DELIMITED BY SIZE
016690         CUST-ZIP DELIMITED BY SPACE
016691         INTO WS-CITY-ZIP
016692      END-STRING
016696      WRITE ENR-FACTURE FROM L-CITY-ZIP
016697
016698      MOVE CUST-STATE TO WS-STATE
016699      WRITE ENR-FACTURE FROM L-STATE
016700      WRITE ENR-FACTURE FROM L-LIGNE-BAS
016701
016702      PERFORM ECRITURE-DATE.
016703
016705 ECRITURE-DATE.
016707      WRITE ENR-FACTURE FROM L-DATE
016708      WRITE ENR-FACTURE FROM L-LIGNE-VIDE
016709      PERFORM ECRITURE-COMMANDE.
016710
016712 ECRITURE-COMMANDE.
016713      MOVE ORD-O-NO TO WS-O-NO
016714      MOVE ORD-O-NO TO FIN-NO
016715      MOVE ORD-O-DATE TO WS-O-DATE
016716      WRITE ENR-FACTURE FROM L-COMMANDE
016717      WRITE ENR-FACTURE FROM L-COMMANDE-DATE
016718      WRITE ENR-FACTURE FROM L-LIGNE-VIDE.
016719
016720 ENTETE-PRODUITS.
016721      WRITE ENR-FACTURE FROM L-TAB-HAUT
016722      WRITE ENR-FACTURE FROM L-PRODUITS.
016728
016729 ECRITURE-PRODUITS.
016730      MOVE PROD-P-NO TO WS-P-NO
016731      MOVE PROD-DESCRIPTION TO WS-P-DESCRIPTION
016732      MOVE ITEM-QUANTITY TO WS-QUANTITY
016733      MOVE PROD-PRICE TO WS-PRICE
016734      MOVE WS-PRICE TO ED-PRICE
016735      COMPUTE WS-TOTAL-LIGNE = WS-QUANTITY * WS-PRICE
016736      MOVE WS-TOTAL-LIGNE TO ED-TOTAL-LIGNE
016737      WRITE ENR-FACTURE FROM L-PRODUITS2
016739      COMPUTE WS-TOTAL-HT = WS-TOTAL-HT + WS-TOTAL-LIGNE.
016740
016741 ECRITURE-TOTAL-PRODUITS.
016742      WRITE ENR-FACTURE FROM L-TAB-BAS
016743      WRITE ENR-FACTURE FROM L-LIGNE-VIDE
016744      MOVE WS-TOTAL-HT TO ED-TOTAL-HT
016745      WRITE ENR-FACTURE FROM L-TOTAL-HT.
016746
016750 ECRITURE-MONTANT-TVA.
016751     DISPLAY WS-TAUX-TVA
016752     COMPUTE WS-MONTANT-TVA = WS-TAUX-TVA * WS-TOTAL-HT
016753     MOVE WS-MONTANT-TVA TO ED-MONTANT-TVA
016754     WRITE ENR-FACTURE FROM L-MONTANT-TVA.
016755
016756 ECRITURE-TOTAL-TTC.
016757     COMPUTE WS-TOTAL-TTC = WS-TOTAL-HT + WS-MONTANT-TVA
016758     MOVE WS-TOTAL-TTC TO ED-TOTAL-TTC
016759     WRITE ENR-FACTURE FROM L-TOTAL-TTC
016760     WRITE ENR-FACTURE FROM L-LIGNE-VIDE
016761     WRITE ENR-FACTURE FROM L-LIGNE-FIN
016762     WRITE ENR-FACTURE FROM L-LIGNE-VIDE.
016763
016764 ECRITURE-DEPARTEMENT.
016765     STRING
016766       DEP-DNAME-TEXT(1:DEP-DNAME-LEN) DELIMITED BY SIZE
016767        ': ' DELIMITED BY SIZE
016768       EMP-LNAME-TEXT(1:EMP-LNAME-LEN) DELIMITED BY SIZE
016769        ', ' DELIMITED BY SIZE
016770       EMP-FNAME-TEXT(1:EMP-FNAME-LEN) DELIMITED BY SIZE
016771        INTO WS-DEPARTEMENT
016772        ON OVERFLOW
016773        DISPLAY "TROP PETIT"
016774     END-STRING
016775
016776     DISPLAY WS-DEPARTEMENT
016780     DISPLAY "L-DEPARTEMENT ", L-DEPARTEMENT
016800     WRITE ENR-FACTURE FROM L-DEPARTEMENT
016900     WRITE ENR-FACTURE FROM L-LIGNE-VIDE.
017000
