

  TABELA gen
 Lp nazw_gen     nazwa_wez     nrw        R1     X1       R0     X0
                                1         2       3       4       5 
 GS           GPZ10kV       2      0.3     1.7 100000000.0 100000000.0 
 MAS          silnik        4      2.2    14.8 100000000.0 100000000.0 
 SEE          GPZ110kV      1      0.0     0.1     0.0     0.1 

 WYMIAR tab.    bus=[]: nbus=   7,  mbus=   3


 WYMIAR tab. branch=[]:  nbr=  10,   mbr=   6


 TABELA branch
 nazwg        nazwp        nazwk           wp - wk     R1     X 1    R0     X0
                                           1    2      3       4     5       6
 LK           GPZ10kV      RO              2    3   1.630   1.247       1.82      3.47
 T1-A         GPZ110kV     *T1             1    5   0.009   0.169       0.01      0.17
 T1-B         GPZ10kV      *T1             2    5   0.009   0.169  100000000.00 100000000.00
 T1-C         *T1          ZIEMIA          5    0 100000000.000 100000000.000       0.01      0.28
 T2-A         RO           *T2             3    6   0.219   1.610  100000000.00 100000000.00
 T2-B         silnik       *T2             4    6   0.219   1.610       0.22      1.61
 T2-C         *T2          ZIEMIA          6    0 100000000.000 100000000.000       0.19      1.49
 GS           GPZ10kV      ZIEMIA          2    0   0.267   1.679  100000000.00 100000000.00
 MAS          silnik       ZIEMIA          4    0   2.223  14.819  100000000.00 100000000.00
 SEE          GPZ110kV     ZIEMIA          1    0   0.000   0.055       0.00      0.06

 TABELA bus
              nrwez      Un_kV      tn 
 GPZ110kV        1     110.000     10.455
 GPZ10kV         2      10.000      1.000
 RO              3      10.000      1.000
 silnik          4       0.525      0.053
 *T1             5     110.000     10.455
 *T2             6      10.000      1.000
 ZIEMIA          0       0.000      0.000

 POLACZENIA : wez. - gal.
    1  -   GPZ110kV      gal.:    2 - T1-A        ,       10 - SEE         ,     galezi w wezle = 2
    2  -   GPZ10kV       gal.:    1 - LK          ,        3 - T1-B        ,        8 - GS          ,     galezi w wezle = 3
    3  -   RO            gal.:    5 - T2-A        ,        1 - LK          ,     galezi w wezle = 2
    4  -   silnik        gal.:    6 - T2-B        ,        9 - MAS         ,     galezi w wezle = 2
    5  -   *T1           gal.:    4 - T1-C        ,        2 - T1-A        ,        3 - T1-B        ,     galezi w wezle = 3
    6  -   *T2           gal.:    7 - T2-C        ,        5 - T2-A        ,        6 - T2-B        ,     galezi w wezle = 3
    7  -   ZIEMIA        gal.:    4 - T1-C        ,        7 - T2-C        ,        8 - GS          ,        9 - MAS         ,       10 - SEE         ,     galezi w wezle = 5