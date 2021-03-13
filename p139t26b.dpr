{Пусть дана непустая посл. слов из строчных русских букв.
Между соседними словами запятая, за последним точка.
Напечатать в алфавитном порядке:
b) Согласные буквы, которые не входят ни в одно слово}
program p139t26b;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Windows;

const
  nMax=256; {Длина текста}

type
  TTxt = array[1..nMax] of char;

var
  Sogl: set of char = ['б', 'в', 'г', 'д', 'ж', 'з', 'й', 'к', 'л', 'м', 'н', 'п', 'р', 'с', 'т', 'ф', 'х', 'ц', 'ч', 'ш', 'щ'];
  Lett: array[1..21] of char = ('б', 'в', 'г', 'д', 'ж', 'з', 'й', 'к', 'л', 'м', 'н', 'п', 'р', 'с', 'т', 'ф', 'х', 'ц', 'ч', 'ш', 'щ');
  Txt: TTxt;
  n: integer; {Фактическая длина}
  i: integer;

procedure ReadText(var Txt: TTxt; var n: integer);
  var
    i: integer;
    OK: boolean;
  begin
    i:=1;
    OK:=true;
    while (i<=nMax) and OK and not eoln do
      begin
        read(Txt[i]);
        if Txt[i]='.'
          then OK:=false
          else inc(i);
      end; {while i}
    readln;
    n:=i-1;
  end; {ReadText}
  
begin {main}
  SetConsoleOutputCP(1251);
  SetConsoleCP(1251);

  writeln('Введите текст (1 строка):');
  ReadText(Txt,n);

  for i:=1 to n do
    if Txt[i] in Sogl
      then Sogl:=Sogl-[Txt[i]];

  writeln('Ответ:');
  for i:=1 to 21 do
    if Lett[i] in Sogl
      then write(Lett[i]);
  writeln;
  readln;
end.

 