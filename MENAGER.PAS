Uses Crt, Michal, Dos, Pomoce;
Procedure Info;
Begin
Ramka2(20,7,60,20,15,'POMOC');
PiszXY(23,7,12,'POMOC');
PiszXY(23,9,12,'F1 POMOC');
PiszXY(23,10,12,'F2 ZMIANA MENAGERA');
PiszXY(23,11,12,'F3 ZMIANA DRUZYNY');
PiszXY(23,12,12,'F4 GRAJ MECZ');
PiszXY(23,13,12,'F10 EXIT');
PiszXY(23,16,15,'MENAGER`99 BY MICHAL RYGIELSKI');
PiszXY(23,17,15,'COPYRIGHT (C) 1999 TORUN');
PiszXY(23,18,15,'FREEWARE');
ReadKey;
End;
Procedure Puchar(Kolor : Word);
Begin
PiszXY(20,7,Kolor,'лллллллллллллллллллллллллллллллллллллллл');
PiszXY(21,8,Kolor,'лллллллллллллллллллллллллллллллллллллл');
PiszXY(22,9,Kolor,'лллллллллллллллллллллллллллллллллллл');
PiszXY(23,10,Kolor,'лллллллллллллллллллллллллллллллллл');
PiszXY(24,11,Kolor,'лллллллллллллллллллллллллллллллл');
PiszXY(25,12,Kolor,'лллллллллллллллллллллллллллллл');
PiszXY(26,13,Kolor,'лллллллллллллллллллллллллллл');
PiszXY(27,14,Kolor,'лллллллллллллллллллллллллл');
PiszXY(28,15,Kolor,'лллллллллллллллллллллллл');
PiszXY(33,16,Kolor,'лллллллллллллл');
PiszXY(32,17,Kolor,'лллллллллллллллл');
PiszXY(32,18,Kolor,'лллллллллллллллл');
PiszXY(34,19,Kolor,'лллллллллллл');
PiszXY(35,20,Kolor,'лллллллллл');
PiszXY(31,21,Kolor,'лллллллллллллллллл');
End;
Procedure Logo(X, Y : Liczby; Kolor : Word);
Begin
PiszXY(X,Y,Kolor,'лл    лл ллллллл лл    лл    лл      ллллл   ллллллл ллллл         ');
PiszXY(X,Y+1,Kolor,'ллл  ллл лл      ллл   лл  лл  лл  лл        лл      лл   лл    ');
PiszXY(X,Y+2,Kolor,'лл лл лл лл      лл л  лл  лл  лл  лл        лл      лл   лл ');
PiszXY(X,Y+3,Kolor,'лл    лл лллллл  лл л  лл лл    лл лл        лллллл  ллллл    ');
PiszXY(X,Y+4,Kolor,'лл    лл лл      лл  л лл лллллллл лл   лллл лл      лл   лл    ');
PiszXY(X,Y+5,Kolor,'лл    лл лл      лл   ллл лл    лл лл     лл лл      лл   лл ');
PiszXY(X,Y+6,Kolor,'лл    лл ллллллл лл    лл лл    лл   ллллл   ллллллл лл   лл');
PiszXY(X+25,Y+8,Kolor,'лллл лллл');
PiszXY(X+25,Y+9,Kolor,'л  л л  л');
PiszXY(X+25,Y+10,Kolor,'лллл лллл');
PiszXY(X+25,Y+11,Kolor,'   л    л');
PiszXY(X+25,Y+12,Kolor,'лллл лллл');
End;
Var
   L1, L2, Pieniadze, Meczy, MX, MY, Zyski, Z, N, Miejsce, Kibice : Longint;
   Znak, Znak2 : Key;
   Menager, Druzyna, P : Pisanie;
   F : File of String;
Begin
If Pos ('win', ParamStr (1)) <> 0 Then
Begin
Tlo(0);
ClrScr;
Kursor(HIDE);
Logo(10,7,15);
Delay(600);
Logo(10,7,7);
Delay(400);
Logo(10,7,8);
Delay(300);
Logo(10,7,0);
Delay(300);
ClrScr;
Menager:='NO MENAGER';
Druzyna:='NO TEAM';
Pieniadze:=5000;
Meczy:=18;
Miejsce:=5;
Repeat
Kursor(Hide);
PiszXY(2,25,15,'F1');
PiszXY(5,25,12,'POMOC');
PiszXY(2,1,15,'MENAGER`99 by Michal Rygielski');
PiszXY(59,3,15,'Miejsce w tabeli : ');
GotoXY(87,3);
TextColor(12);
Write(Miejsce);
PiszXY(2,3,15,'Menager : ');
PiszXY(12,3,12,Menager);
PiszXY(2,4,15,'Druzyna : ');
PiszXY(12,4,12,Druzyna);
PiszXY(2,5,15,'Pieniadze : ');
Kolor(12);
GotoXY(14,5);
Write(Pieniadze);
PiszXY(2,6,15,'Ilisc meczy : ');
Kolor(12);
GotoXY(16,6);
Write(Meczy);
Znak:=ReadKey;
If (Znak=#60) then begin Kursor(FULL); Kolor(12); GotoXY(12,3); Ile(67,Menager); end;
If (Znak=#61) then begin Kursor(FULL); Kolor(12); GotoXY(12,4); Ile(67,Druzyna); end;
If (Znak=#62) then
begin
N:=Random(15)+2;
Assign(F,'DRUZYNY.DAT');
Reset(F);
For Z:=1 to N do begin Read(F,P);end;
Randomize;
MX:=Random(10);
MY:=0;
Kibice:=Random(20000);
Zyski:=Random(25000);
GotoXY(2,7);
Kolor(12);
Write(Druzyna,' ',MX,' : ',MY,' ',P);
PiszXY(2,9,15,'Ilisc kibicy : ');
GotoXY(17,9);
Kolor(12);
Write(Kibice);
PiszXY(2,10,15,'Zarobione pieniadze : ');
GotoXY(24,10);
Kolor(12);
Write(Zyski);
Meczy:=Meczy-1;
Pieniadze:=Pieniadze+Zyski;
If MX=MY then begin PiszXY(2,8,15,'I znowu remis'); end;
If MX<MY then begin Miejsce:=Miejsce+1; PiszXY(2,8,15,'Czemu moja druzyna przegrala?!'); end;
If MX>MY then begin Miejsce:=Miejsce-1; PiszXY(2,8,15,'Huraa! Zwyciestwo!'); end;
If Miejsce=0 then Miejsce:=1;
Delay(700);
Close(F);
ClrScr;
end;
If Miejsce=3 then begin PiszXY(2,11,12,'Juz masz trzecie miejsce'); end;
If Miejsce=2 then begin PiszXY(2,11,12,'Coraz lepiej juz drugie'); end;
If Miejsce=1 then begin PiszXY(2,11,12,'Narescie pierwsze miejsce!'); end;
If Znak=#59 then begin Info; ClrScr; end;
If Meczy=0 then
begin
If Miejsce=1 then
begin
ClrScr;
Puchar(14);
PiszXY(33,24,15,'ZDOBYLES ZLOTO!');
Repeat
Znak2:=ReadKey;
Until Znak2=ENTER;
Kursor(NORMAL);
ClrScr;
Exit;
end;
end;
If Meczy=0 then
begin
If Miejsce=2 then
begin
ClrScr;
Puchar(7);
PiszXY(32,24,15,'ZDOBYLES SREBRO!');
Repeat
Znak2:=ReadKey;
Until Znak2=ENTER;
Kursor(NORMAL);
ClrScr;
Exit;
end;
end;
If Meczy=0 then
begin
If Miejsce=3 then
begin
ClrScr;
Puchar(6);
PiszXY(33,24,15,'ZDOBYLES BRAZ!');
Repeat
Znak2:=ReadKey;
Until Znak2=ENTER;
Kursor(NORMAL);
ClrScr;
Exit;
end;
end;
If Meczy=0 then begin ClrScr; PiszXY(2,2,15,'TYM RAZEM NIE UDALO SIE ZDOBYC MISTRZOSTWA'); ReadKey; Kursor(NORMAL); Exit; End;
Until (Znak=#68);
Tlo(0);
ClrScr;
PiszXY(2,2,15,'DO NASTEPNEGO MENAGERA');
Kursor(NORMAL);
Halt;
End;
Tlo(0);
ClrScr;
Kursor(HIDE);
Logo(10,7,15);
Delay(600);
Logo(10,7,7);
Delay(400);
Logo(10,7,8);
Delay(300);
Logo(10,7,0);
Delay(300);
ClrScr;
Menager:='NO MENAGER';
Druzyna:='NO TEAM';
Pieniadze:=5000;
Meczy:=18;
Miejsce:=5;
Repeat
Kursor(Hide);
PiszXY(2,25,15,'F1');
PiszXY(5,25,12,'POMOC');
PiszXY(2,1,15,'MENAGER`99 by Michal Rygielski');
PiszXY(59,3,15,'Miejsce w tabeli : ');
GotoXY(87,3);
TextColor(12);
Write(Miejsce);
PiszXY(2,3,15,'Menager : ');
PiszXY(12,3,12,Menager);
PiszXY(2,4,15,'Druzyna : ');
PiszXY(12,4,12,Druzyna);
PiszXY(2,5,15,'Pieniadze : ');
Kolor(12);
GotoXY(14,5);
Write(Pieniadze);
PiszXY(2,6,15,'Ilisc meczy : ');
Kolor(12);
GotoXY(16,6);
Write(Meczy);
Znak:=ReadKey;
If (Znak=#60) then begin Kursor(FULL); Kolor(12); GotoXY(12,3); Ile(67,Menager); end;
If (Znak=#61) then begin Kursor(FULL); Kolor(12); GotoXY(12,4); Ile(67,Druzyna); end;
If (Znak=#62) then
begin
N:=Random(15)+2;
Assign(F,'DRUZYNY.DAT');
Reset(F);
For Z:=1 to N do begin Read(F,P);end;
Randomize;
MX:=Random(10);
MY:=Random(10);
Kibice:=Random(20000);
Zyski:=Random(25000);
GotoXY(2,7);
Kolor(12);
Write(Druzyna,' ',MX,' : ',MY,' ',P);
PiszXY(2,9,15,'Ilisc kibicy : ');
GotoXY(17,9);
Kolor(12);
Write(Kibice);
PiszXY(2,10,15,'Zarobione pieniadze : ');
GotoXY(24,10);
Kolor(12);
Write(Zyski);
Meczy:=Meczy-1;
Pieniadze:=Pieniadze+Zyski;
If MX=MY then begin PiszXY(2,8,15,'I znowu remis'); end;
If MX<MY then begin Miejsce:=Miejsce+1; PiszXY(2,8,15,'Czemu moja druzyna przegrala?!'); end;
If MX>MY then begin Miejsce:=Miejsce-1; PiszXY(2,8,15,'Huraa! Zwyciestwo!'); end;
If Miejsce=0 then Miejsce:=1;
Delay(700);
Close(F);
ClrScr;
end;
If Miejsce=3 then begin PiszXY(2,11,12,'Juz masz trzecie miejsce'); end;
If Miejsce=2 then begin PiszXY(2,11,12,'Coraz lepiej juz drugie'); end;
If Miejsce=1 then begin PiszXY(2,11,12,'Narescie pierwsze miejsce!'); end;
If Znak=#59 then begin Info; ClrScr; end;
If Meczy=0 then
begin
If Miejsce=1 then
begin
ClrScr;
Puchar(14);
PiszXY(33,24,15,'ZDOBYLES ZLOTO!');
Repeat
Znak2:=ReadKey;
Until Znak2=ENTER;
Kursor(NORMAL);
ClrScr;
Exit;
end;
end;
If Meczy=0 then
begin
If Miejsce=2 then
begin
ClrScr;
Puchar(7);
PiszXY(32,24,15,'ZDOBYLES SREBRO!');
Repeat
Znak2:=ReadKey;
Until Znak2=ENTER;
Kursor(NORMAL);
ClrScr;
Exit;
end;
end;
If Meczy=0 then
begin
If Miejsce=3 then
begin
ClrScr;
Puchar(6);
PiszXY(33,24,15,'ZDOBYLES BRAZ!');
Repeat
Znak2:=ReadKey;
Until Znak2=ENTER;
Kursor(NORMAL);
ClrScr;
Exit;
end;
end;
If Meczy=0 then begin ClrScr; PiszXY(2,2,15,'TYM RAZEM NIE UDALO SIE ZDOBYC MISTRZOSTWA'); ReadKey; Kursor(NORMAL); Exit; End;
Until (Znak=#68);
Tlo(0);
ClrScr;
PiszXY(2,2,15,'DO NASTEPNEGO MENAGERA');
Kursor(NORMAL);
End.