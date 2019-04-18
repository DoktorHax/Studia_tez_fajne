function epv
% moc EPV na D-1 -  doby
moc=[
%godz    2602    1804    2307
    1       0       0       0                           
    2       0       0       0                           
    3       0       0       0                           
    4       0       0       0                           
    5       0       0       0 
    6       0       0       0     
    7       0       0.1     0.3                           
    8       0       1.2     2.2                           
    9       0.1     3.6     4.9                           
    10      0.5     6.4     6.5                           
    11      0.55    8.42    8.4
    12      0.8     9.7     10.0 
    13      0.8     10.42   11.8 
    14      0.45    10.0    11.4 
    15      0.4     8.4     10.6 
    16      0.38    7.0     9.6 
    17      0.05    6.8     7.6 
    18      0.0     4.1     5.2 
    19      0.0     1.2     2.9 
    20      0.0     0.2     1.5 
    21      0.0     0.05    0.1 
    22      0       0       0                           
    23      0       0       0                           
    24      0       0       0 
];
h=moc(:,1);
luty=moc(:,2);
kwiecien=moc(:,3);
lipiec=moc(:,4);
plot(h,luty,'k-.',h,kwiecien,'k--',h,lipiec,'k-');
title('Mikroinstalacja PV 15 kW - wytwarzanie mocy w typowych dobach 2014 roku');
legend('luty','kwiecien','lipiec');
grid on; xlabel('godziny'); ylabel('kW');
axis tight;
%axis=[0 24 0 15];
disp('ENTER'); pause; 
close;
 


% energia EPV na D-1 -  miesiace 2014
energia=[
%miesiac  mono    poly    cigs
 1	137.4	85.6	126.3
2	373.7	253.0	365.2
3	501.9	391.4	494.3
4	539.3	438.8	531.8
5	640.1	534.7	638.6
6	713.9	639.4	733.9
7	757.5	617.0	776.2
8	595.9	487.5	602.2
9	510.1	400.7	512.8
10	383.6	294.7	378.4
11	158.7	120.7	148.2
12	104.0	65.5	92.6

];
m=energia(:,1);
mono=energia(:,2);
poly=energia(:,3);
cigs=energia(:,4);
enpv=mono+poly+cigs;
plot(m,mono,'k-.',m,poly,'k--',m,cigs,'k:',m,enpv,'k-');
title('Mikroinstalacja PV 15 kW - wytwarzanie energii w miesiacach 2014 roku');
legend('MONO','POLY','CIGS','mikroinstalacja');
grid on; xlabel('miesiac'); ylabel('kWh');
axis tight;
%axis=[0 24 0 15];
disp('ENTER'); pause; 
close;


% energia EPV w latach 2012-2014
en=[
    % 2012 2013 2014
    1    15.540
    2    13.672
    3    15.146
];
t=en(:,1); e=en(:,2);
ezero=e*0;
axis auto;
plot(t,e,'k-o', t,ezero,'k-');
title('Mikroinstalacja PV 15 kW - wytwarzanie energii w latach 2012-14');
grid on; xlabel('rok'); ylabel('MWh');
%axis=[1 3 0 16];
disp('ENTER'); pause; 
close;

%bar(e);
%bar(e), colormap(cool);
%close;
%disp('ENTER'); pause; 

% produkcja energii miesieczna w 2012 roku w MWh
em=[0.420	0.705	1.418	1.744	2.154	1.803	2.002	2.029	1.464	1.036	0.429	0.334];
tm=1:12;
emzero=em*0;
%axis auto;
%axis tight;
plot(tm,em,'k-', tm,emzero,'k-');
title('Mikroinstalacja PV 15 kW - miesieczne wytwarzanie energii w 2012 roku');
grid on; xlabel('miesiace'); ylabel('MWh');
disp('ENTER'); pause; 
close;

% generacja wiatrowa 8 lipca 2014 r
gw=[
 %godz  Pgen,MW
1	656.325
2	499.45
3	359.125
4	446.613
5	509.1
6	540.863
7	379.725
8	287.9
9	269.688
10	373.05
11	573.275
12	829.063
13	1031.075
14	1120.488
15	1126.238
16	1257.65
17	1574
18	1352.213
19	1179.4
20	1247.138
21	1112.7
22	1190.313
23	1426.138
24	1616.063
];
h=[]; h=gw(:,1); lipiec=[]; lipiec=gw(:,2);
plot(h,lipiec,'k-');
title('Generacja wiatrowa 8 lipca 2014 r');
grid on; xlabel('godziny'); ylabel('MW');
axis tight;
%axis=[0 24 0 1700];
disp('ENTER'); pause; 
close;
return