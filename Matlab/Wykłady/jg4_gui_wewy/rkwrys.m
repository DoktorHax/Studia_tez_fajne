function y=rkwrys();
%Funkcja rkwrys() rysuje wykres dla x w przedziale od -10 do 10.
global u1 h3 a b c h0;
x=-10:0.01:10; % przedzial zmiennosci x
d=get(u1,'String');
if isempty(d{1})==0    a=eval(d{1}); end
if isempty(d{2})==0    b=eval(d{2}); end
if isempty(d{3})==0    c=eval(d{3}); end
if (isempty(a)==1 )|(isempty(b)==1)|(isempty(c)==1)
   warndlg('Do rysowania paraboli potrzebne sa wart. a, b i c. Wprowadz brakujace dane!');  
   else
   if  a==0 
       warndlg('"a" musi byc rozne od zera!');
   else
     d=b^2-4*a*c;%Wyroznik rownania kwadratowego
     if d>=0
        X1=(-b-sqrt(d))/2/a;   X2=(-b+sqrt(d))/2/a;
        % Wyprowadzenie na ekran wartosci X1(1 miejsce zerowe) w postaci lancucha znakow 
        h5= uicontrol('Parent',h0, ...  
         'Units','points',  'BackgroundColor',[1 1 1], 'Position',[200 310 38 10], ...
	     'String',num2str(X1), ...
	     'Style','text', 'Tag','StaticText2');
         % Wyprowadzenie na ekran wartosci X2(2 miejsce zerowe) w postaci lancucha znakow 
         h6= uicontrol('Parent',h0, ...  
        'Units','points',  'BackgroundColor',[1 1 1], 'Position',[200 300 38 10], ...
	    'String',num2str(X2), ...
	    'Style','text',  'Tag','StaticText2');
      else
         X1={'brak'};  X2={'brak'}; % brak rzwiazan rzeczywistych
         % Wyprowadzenie na ekran informacji o braku X1
         h5= uicontrol('Parent',h0, ... 
             'Units','points',  'BackgroundColor',[1 1 1], 'Position',[200 310 38 10], ...
	         'String',X1, 'Style','text', 'Tag','StaticText2');
         % Wyprowadzenie na ekran informacji o braku X2
         h6= uicontrol('Parent',h0, ... 
             'Units','points', 'BackgroundColor',[1 1 1], 'Position',[200 300 38 10], ...
	         'String',X2, 'Style','text',  'Tag','StaticText2');
      end % if d>=0
%Obliczenie wspolrzednych wierzcholka funkcji
xw=(-b/(2*a)); yw=(-d/(4*a));
h7= uicontrol('Parent',h0, ...  %Wyprowadzenie na ekran wartosci xw wierzcholka
   'Units','points', 'BackgroundColor',[1 1 1], 'Position',[260 310 38 10], ...
	'String',num2str(xw), ...
	'Style','text',  'Tag','StaticText2');
h8= uicontrol('Parent',h0, ...  Wyprowadzenie na ekran wartosci yw wierzcholka
   'Units','points', 'BackgroundColor',[1 1 1], 'Position',[260 300 38 10], ...
	'String',num2str(yw), ...
	'Style','text',  'Tag','StaticText2');
end %if a==0   warndlg('"a" musi byc rozne od zera!'); else
% WYKRES paraboli
 y=a.*x.*x+b.*x+c; plot(x,y);  xlabel('X');ylabel('Y'); grid on;
end  %if (isempty(a)==1 )|(isempty(b)==1)|(isempty(c)==1)
return
