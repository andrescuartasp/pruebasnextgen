      *--------------------------

     HAlwNull(*UsrCtl)
     HDftActGrp(*No)
     HFixNbr(*Zoned)
     HOption(*Nodebugio : *SrcStmt)
     HDatedit(*YMD)

     FDATO1     IF   E             DISK

     DPasardato        Pr

      /Free
         Pasardato();

      /End-Free


     PPasardato        B
      /Free
        Setll *Start DATO1;
        Read DATO1;
        Dow Not%EOF(DATO1);
        enddo;
        close DATO1;

      /End-Free
     PPasardato        E









