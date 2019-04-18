function [sbus,slin,stra,Sbase]=ormdatTEST
% Dane testowe do programu orm
 Sbase =   100; % moc bazowa w MVA
% Uwaga! Dane wezlowe i galeziowe w jednostkach mianowanych.
%        W programie nastapi przeliczonie na pu w odniesieniu do Sb i Un.
% DANE WEZLOWE
 sbus={
% typ - sposob udzialu wezla w regulacji napiecia:
%   1 - PQ  - odbiorczy,  wymaga podania P,Q
%   2 - PU  - generacyjny bez ograniczen Q, wymaga podania Pg,Ug, nie wymaga podania Qmin, Qmax
%   3 - Pdelta   - wezel bilansujacy caly rozplyw, wymaga podania U oraz Uk=0
%   4 - izolowany - nie bierze udzialu w obliczeniach itearcyjnych
%   5 - PQ - odbiorczy z reg. przekl. TRANSF. pod obc., wymaga podania regulowanego nap. U
%   6 - PU - generacyjny z ograniczeniami Q, wymaga podania Pg oraz Qmin, Qmax
%   7 - PU - z ogr. Qmin, Qmax, przy czym Q=Qmin - typ=7 jest nadawany w trakcie obliczen
%   8 - PU - z ogr. Qmin, Qmax, przy czym Q=Qmax - typ=8 jest nadawany w trakcie obliczen
%    Pd(+), MW    - moc czynna odbierana w wezle, Pd(-)  - moc czynna doplywajaca do wezla
%    Qd(+), Mvar  - moc bierna odbierana w wezle,tzn. bierna indukcyjna,
%    Qd(-)  - moc bierna doplywajaca do wezla, tzn. bierna pojemnosciowa
%    Pg(+), MW    - moc czynna generowana w wezle,
%    Pg(-)  - moc czynna generowana z ujemnym znakiem,tzn. moc czynna odbierana w wezle
%    Qg(+), Mvar  - moc bierna gen. indukcyjna,tzn.oddawana do sieci
%    Qg(-), Mvar  - moc bierna gen. pojemnosciowa, tzn. moc bierna pobierana z sieci
%    Gsh(+) - moc czynna odb. jako konduktancja w mikroS (shunt - np. straty ulotu
%    Bsh(+) - moc bierna odb. jako susceptancja pojemnosciowej w mikroS(shunt),np. kondensator
%    Bsh(-) - moc bierna odb. w postaci susceptancji indukcyjnej w mikroS(shunt),np. dlawik
%    Qgmin, Mvar  - minimalna  moc bierna generowana w wezle,
%    Qgmax, Mvar  - maksymalna moc bierna generowana w wezle,
%    Qkomp  - moc bierna kompensatora w Mvar, przy UN: (-)poj, (+)ind
%    nazwa   typ   Un_kV     Um Uk_st    Pd     Qd      Pg     Qg  Gsh   Bsh    Qgmin  Qgmax Qkomp  
%             1       2       3     4     5      6       7      8    9    10      11      12    13  
 'SEE'        3   110.0    1.00   0.0   0.0    0.0     0.0    0.0  0.0   0.0     0.0     0.0   0.0;
 'GPZ110kV'   1   110.0    1.00   0.0   0.0    0.0     0.0    0.0  0.0   0.0     0.0     0.0   0.0;
 'GPZ10kV'    5    10.0    1.05   0.0   0.54   0.162   0.0    0.0  0.0   0.0     0.0     0.0  -2.0;
 'generator'  6    10.0    1.05   0.0   0.0    0.0     9.12  6.84  0.0   0.0  -0.684   7.524   0.0;
 'odczep'     1    10.0    1.00   0.0   0.0    0.0     0.0    0.0  0.0   0.0     0.0     0.0   0.0; 
 'RO'         1    10.0    1.00   0.0   0.0    0.0     0.0    0.0  0.0   0.0     0.0     0.0   0.0; 
 'odbior  '   1   0.525    1.00   0.0   2.0    0.8     0.0    0.0  0.0   0.0     0.0     0.0   0.0;
};
%
% DANE LINII
 slin={
%   R,X w ohmach
%   G,B w mikroSimensach cala wartosc
%   LINIA         : B  >  0  - dodatnia wartosc
%   Imax    - dopuszczalne obciazenie termiczne linii w A
%   Smax    - dopuszczalne obciazenie termiczne transformtora w MVA
%   st: 1 - zal., 0 - wyl.,  lkm - dlugosc w km, Smm2 - przekroj w mm2
%  nazwg    nazwpk     nazwk        R          X     G       B Imax/Smax  st   lkm  Smm2
%                                   1          2     3       4      5    6     7      8 
 'XQ'       'SEE'      'GPZ110kV'  0.0      8.873    0      0     9999    1    0.0  0.0;
 'lacznik'  'GPZ10kV' 'generator'  0.0      0.0001   0      0     9999    1    0.0  0.0;
 'Linia'    'GPZ10kV' 'odczep'     1.056    0.888    0    7.68    290.0   1    2.4   70;
 'Kabel'    'odczep'  'RO'         0.357    0.171    0   100.8    262.0   1    1.4  120;
};


% DANE TRANSFORMATOROW
  stra={
% R,X w ohmach,  G,B w mikroSimensach - wartosci do nap. znam. wezla poczatkowego /GORNEGO NAPIECIA/
% TRANSFORMATOR : B  <  0  - ujemna wartosc
% Przekladnia znam. transf.  tn = Uwpn/Uwkn, Uwpn - nap. znam. wez. pocz., Uwkn - nap. znam. wez. konc.
% Przekladnia znam. sieciowa tns = Uwpns/Uwkns
% Przekladnia aktualna tact = Up/Uk, Up - nap. aktualne w wez. pocz., Uk - nap. aktualne w wez. konc
% Przekladnia TRANSF. aktualna w jednostkach wzglednych  t = tact/tns
% dt - przyrost przekladni przypadajacy na zaczep,w pu
% tmin, tmax - minimalna i maksymalna wartosc przekl., w pu
% Kat przekladni tk musi byc podany w stopniach.
% Smax    - dopuszczalne obciazenie termiczne transformtora w MVA
%  st: 1 - zal., 0 - wyl.
% nazwg      nazwp      nazwk        R       X     G      B  Smax   to     tk   tmin   tmax     dt st
%                                    1       2     3      4     5    6      7      8      9     10 11     
 'T1'     'GPZ110kV'  'GPZ10kV' 2.02508 37.63681  2.8  -16.3  40.0 0.9504  0.0 0.7904 1.1104 0.0133  1;
 'T2'     'RO'        'odbior'  0.31421  3.51398 22.7 -253.97  2.0 1.05    0.0 1.05   1.05   0.0     1;
};

 return; 
