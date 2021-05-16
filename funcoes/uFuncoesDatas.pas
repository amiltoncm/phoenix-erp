unit uFuncoesDatas;

interface

uses DateUtils, System.SysUtils;

function Dia(vfData: TDate): Word;
function Mes(vfData: TDate): Word;
function Ano(vfData: TDate): Word;
function MesExtenso(vfMes: Integer): String;
function UltimoDiaMes(vfMes: TDate): Integer;
function DataExtenso(vfCidade: String; vfData: TDateTime): String;
function CalculaIdade(vfDataIni, vfDataFim : TDateTime) : String;
function AnoInt: Integer;
function ContarDias(vfDataIni, vfDataFim : TDateTime): integer;
function ConverteData(vfData: String): String;
function DiasEntre(vfDataInic: TDate; vfDataFinal: TDate): Integer;
function DiaDaSemana(vfData: TDate): String;

implementation

function Dia(vfData: TDate): Word;
Var
vDia, vMes, vAno: Word;
begin
  DecodeDate(vfData, vAno, vMes, vDia);
  Result := vDia;
end;

function Mes(vfData: TDate): Word;
Var
vDia, vMes, vAno: Word;
begin
  DecodeDate(vfData, vAno, vMes, vDia);
  Result := vMes;
end;

function Ano(vfData: TDate): Word;
Var
vDia, vMes, vAno: Word;
begin
  DecodeDate(vfData, vAno, vMes, vDia);
  Result := vAno;
end;

function MesExtenso(vfMes: Integer): String;
Var
vResult: String;
begin
  Case vfMes Of
    1 : vResult := 'Janeiro';
    2 : vResult := 'Fevereiro';
    3 : vResult := 'Março';
    4 : vResult := 'Abril';
    5 : vResult := 'Maio';
    6 : vResult := 'Junho';
    7 : vResult := 'Julho';
    8 : vResult := 'Agosto';
    9 : vResult := 'Setembro';
    10 : vResult := 'Outubro';
    11 : vResult := 'Novembro';
    12 : vResult := 'Dezembro';
  end;
  Result := vResult;
end;

function UltimoDiaMes(vfMes: TDate): Integer;
begin
  Result := DaysInMonth(vfMes);
end;

function DataExtenso(vfCidade: String; vfData: TDateTime): String;
Const
AMes: Array[1..12] of string = ('janeiro', 'fevereiro', 'março', 'abril', 'maio',
'junho', 'julho', 'agosto', 'setembro', 'outubro', 'novembro', 'dezembro');
Var
vDia, vMes, vAno:Word;
begin
  DecodeDate(vfData, vAno, vMes, vDia);
  Result := vfCidade + ', '+IntToStr(vDia)+' de '+aMes[vMes]+' de '+ IntToStr(vAno);
end;

function CalculaIdade(vfDataIni, vfDataFim : TDateTime) : String;
var
iDia, iMes, iAno, fDia, fMes, fAno: Word;
nDia, nMes, nAno: Double;
begin
  nMes := 0;
  DecodeDate(vfDataIni, iAno, iMes, iDia);
  DecodeDate(vfDataFim, fAno, fMes, fDia);
  nAno := fAno - iAno;
  if nAno > 0 then
    if fMes < iMes then
      nAno := nAno - 1
    else
    if(fMes = iMes) and (fDia < iDia) then
      nAno := nAno - 1;
  if fMes < iMes then
  begin
    nMes := 12 - (iMes-fMes);
    if fDia < iDia then
      nMes := nMes - 1;
    end
    else
    if fMes = iMes then
    begin
      nMes := 0;
      if fDia < iDia then
        nMes := 11;
      end
      else
      if fMes > iMes then
      begin
        nMes := fMes - iMes;
        if fDia < iDia then
          nMes := nMes - 1;
      end;
      nDia := 0;
      if fDia > iDia then
        nDia := fDia - iDia;
      if fDia < iDia then
        nDia := (vfDataFim - IncMonth(vfDataFim, -1)) - (iDia-fDia);
      Result := '';
      if nAno = 1 then
        Result := FloatToStr(nAno)+ ' Ano '
      else
      if nAno > 1 then
        Result := FloatToStr(nAno)+ ' Anos ';
      if nMes = 1 then
        Result := Result + FloatToStr(nMes)+ ' Mês '
      else
      if nMes > 1 then
        Result := Result + FloatToStr(nMes)+ ' Meses ';
      if nDia = 1 then
        Result := Result + FloatToStr(nDia)+ ' Dia '
      else
      if nDia > 1 then
        Result := Result + FloatToStr(nDia)+ ' Dias ';
end;

function AnoInt: Integer;
Var
vAno, vMes, vDia: Word;
begin
  DecodeDate(now, vAno, vMes, vDia);
  result := vAno;
end;

function ContarDias(vfDataIni, vfDataFim : TDateTime): integer;
begin
  Result := DaysBetween(vfDataIni, vfDataFim);
end;

function ConverteData(vfData: String): String;
Var
vData: String;
begin
  vData := vfData[9];
  vData := vData + vfData[10];
  vData := vData + '/';
  vData := vData + vfData[6];
  vData := vData + vfData[7];
  vData := vData + '/';
  vData := vData + vfData[1];
  vData := vData + vfData[2];
  vData := vData + vfData[3];
  vData := vData + vfData[4];
  Result := vData;
end;

function DiasEntre(vfDataInic: TDate; vfDataFinal: TDate): Integer;
Var
vResult: Integer;
begin
  vResult := DaysBetween(vfDataInic, vfDataFinal);
  Result := vResult;
end;

function DiaDaSemana(vfData: TDate): String;
Var
vResult: String;
begin
  if  DayOfWeek(vfData) = 1 then
    vResult := 'Domingo';
  if  DayOfWeek(vfData) = 2 then
    vResult := 'Segunda-feira';
  if  DayOfWeek(vfData) = 3 then
    vResult := 'Terça-feira';
  if  DayOfWeek(vfData) = 4 then
    vResult := 'Quarta-feira';
  if  DayOfWeek(vfData) = 5 then
    vResult := 'Quinta-feira';
  if  DayOfWeek(vfData) = 6 then
    vResult := 'Sexta-feira';
  if  DayOfWeek(vfData) = 7 then
    vResult := 'Sabado';
  Result := vResult;
end;

end.
