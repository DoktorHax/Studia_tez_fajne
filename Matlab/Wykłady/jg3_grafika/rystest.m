function rystest
% Wykres tlumionych funkcji sinus i cosinus
t=0:0.1:20; % przedzial
y1=sin(t).*exp(-0.1*t); % tlumiona sinusoida
% wykres sinusoidy y1
plot(t,y1,'-r'); grid on; title(' y1');
xlabel('t,s'); ylabel('y1'); % opis osi
disp(' Wskaz myszka, gdzie ma byc umieszczony text');
gtext('y1 - sinusoida tlumiona'); % miejsce textu wg wskazania myszki
saveas(gcf,'Rys0','pcx');
input('Dalej? Wcisnij dowolny klawisz.'); % zatrzymanie do obejrzenia
% Po nacisnieciu ENTER na wykres sinusoidy y1 nakladany jest wykres cosinusoidy y2
hold on;
y2=cos(t).*exp(-0.2*t); % tlumiona cosinusoida
plot(t,y2,'--b'); grid on;
xmin=0; xmax=25; ymin=-1.0; ymax=1.2;
axis([xmin xmax ymin ymax]); % ustalany jest nowy zakres osi x,y
xlabel('t,s'); ylabel('y1,y2'); % nowy opis osi x,y
opis1=' Marian Sobierajski';    %1-szy lancuch do tytulu rysunku
opis2='y1=sin(t)*exp(-0.1*t)';  %2-gi  lancuch do tytulu rysunku
opis3='y2=cos(t)*exp(-0.2*t)';  %3-ci  lancuch do tytulu rysunku
opis=[opis1 ' - ' opis2 ', ' opis3]; % pelny tytul rysunku
title(opis);
text(1,-0.2,'y2 - cosinusoida tlumiona'); %text umieszczony na sztywno
legend('y1 - sinusoida tlumiona','y2 - cosinusoida tlumiona');
% zapisywanie okna graficznego w pliku w roznych formatach
saveas(gcf,'Rys1','png');
saveas(gcf,'Rys2','jpg');
saveas(gcf,'Rys3','emf');
saveas(gcf,'Rys4','fig');
saveas(gcf,'Rys5','m');
saveas(gcf,'Rys6','pdf');
% zatrzymanie programu w celu umozliwienia skopiowania w innym formacie
input('Dalej? Wcisnij dowolny klawisz.');
close; % zamyka otwarte okna graficzne
return
