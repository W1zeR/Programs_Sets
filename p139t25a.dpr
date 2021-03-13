{Пусть дан текст, оканчивающийся точкой. Напечатайте:
а)	первые вхождения символов в текст, сохраняя их исходный порядок}
program p139t25a;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Windows;

const
  nMax=256; {Длина текста}

type
  TTxt = array[1..nMax] of char;

var
  Symb: set of char;
  Txt,Temp: TTxt;
  n: integer; {Фактическая длина}
  i,j: integer;

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

  Symb:=[];
  j:=0;
  for i:=1 to n do
    if not(Txt[i] in Symb)
      then
        begin
          inc(j);
          Symb:=Symb+[Txt[i]];
          Temp[j]:=Txt[i];
        end; {if not}

  writeln('Ответ:');
  for i:=1 to j do
    write(Temp[i]);
  writeln;
  readln;
end.

 