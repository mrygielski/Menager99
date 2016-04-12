Uses Crt, Michal;
Procedure OPIS;
Begin
Ramka2(2,2,79,24,15,'OPIS');
PiszXY(4,4,15,'Program MENAGER`99 jest to cos dla kogos kto lubi pilke nozna. W programie');
PiszXY(4,5,15,'grasz z szesnastoma druzynami z polskiej ligi. Moze program nie jest taki');
PiszXY(4,6,15,'ciekawy, ale mozna w niego zawsze pograc.');
PiszXY(4,7,15,'Wymagania:');
PiszXY(4,8,15,'Program uruchmi sie na wszystkich kartach grafiki!');
PiszXY(4,10,15,'UWAGA!');
PiszXY(4,11,15,'MENAGER`99 MOZE BYC ROZPROWADZANY NA ZASADACH FREEWARE');
ReadKey;
End;
Procedure KLOPOTY;
Begin
Ramka2(2,2,79,24,15,'KLOPOTY');
PiszXY(4,4,15,'Gdybys mial(a) klopoty z uruchomieniem gry sprawdz czy w katalogu, w');
PiszXY(4,5,15,'ktorym sie znajdujesz sa te pliki:');
PiszXY(4,6,15,'MENAGER.EXE - PROGRAM MENAGER`99');
PiszXY(4,7,15,'DRUZYNY.DAT - W TYM PLIKU ZNAJDUJA SIE DRUZYNY');
PiszXY(4,8,15,'README.EXE - PROGRAM, W KTORYM SIE ZNAJDUJESZ');
ReadKey;
End;
Procedure TRIKI;
Begin
Ramka2(2,2,79,24,15,'TRIKI');
PiszXY(4,4,15,'Jesli chcesz zawsze wygrywac, albo remisowac napisz MENAGER.EXE win.');
ReadKey;
End;
Var
   X, Y : Liczby;
   Znak : Key;
Begin
Tlo(0);
ClrScr;
Kursor(Hide);
X:=46;
Y:=9;
repeat
PiszXY(28,8,15,'ษออออออออออออออออหอป');
PiszXY(28,9,15,'บ      Opis      บ บ');
PiszXY(28,10,15,'ฬออออออออออออออออฮอน');
PiszXY(28,11,15,'บ     Kopoty    บ บ');
PiszXY(28,12,15,'ฬออออออออออออออออฮอน');
PiszXY(28,13,15,'บ      Triki     บ บ');
PiszXY(28,14,15,'ฬออออออออออออออออฮอน');
PiszXY(28,15,15,'บ      EXIT      บ บ');
PiszXY(28,16,15,'ศออออออออออออออออสอผ');
PIszXY(X,Y,15,#27);
Znak:=ReadKey;
PIszXY(X,Y,0,#27);
If Znak=#72 then Y:=Y-2;
If Znak=#80 then Y:=Y+2;
If (Y=7) then Y:=Y+2;
If (Y=17) then Y:=Y-2;
If (X=46) and (Y=9) and (Znak=#13) then begin Dzwiek(300,50); ClrScr; OPIS; ClrScr; end;
If (X=46) and (Y=11) and (Znak=#13) then begin Dzwiek(300,50); ClrScr; KLOPOTY; ClrScr; end;
If (X=46) and (Y=13) and (Znak=#13) then begin Dzwiek(300,50); ClrScr; TRIKI; ClrScr; end;
If (X=46) and (Y=15) and (Znak=#13) then begin Kursor(NORMAL); Tlo(0); Kolor(7); ClrScr; Dzwiek(300,50); Halt; end;
Until Znak=#3;
Kursor(NORMAL);
Tlo(0);
Kolor(7);
ClrScr;
End.