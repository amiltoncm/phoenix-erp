unit uFuncoesFormatacao;

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
     StdCtrls, ExtCtrls, ComCtrls;

function ValorPorExtenso(vfVlr: Real): String;
function LimpaDoc(vValor: String): String;
function NumeroReal(vfKey: Char ): Char;
function NumeroRealSP(vfKey: Char ): Char;
function NumerosReg(vfKey : Char ): Char;
function Numeros(vfKey : Char ): Char;
function TrocaVirgPPto(vfValor: String): String;
function TrocaPtoPVirg(vfValor: String): String;
function LimpaBarra(vfValor: String): String;
function LimpaReal(vfValor: String): String;
function LimpaCNPJ(vfCNPJ: String): String;
function PontuaCPF(vfCPF: String): String;
function PontuaCNPJ(vfCNPJ: String): String;
function OnlyNum(vfNum: String): String;
function FormatCEP(vfCEP: String): String;
function FormatNCM(vfNCM: String): String;
function FormataReal(vfNumeroReal: String): String;

implementation

uses uVarGlobal;

function ValorPorExtenso(vfVlr: Real): String;
const
ctUnidade: array[1..19] of string = ('um', 'dois', 'três', 'quatro', 'cinco',
             'seis', 'sete', 'oito', 'nove', 'dez', 'onze', 'doze', 'treze',
             'quatorze', 'quinze', 'dezesseis', 'dezessete', 'dezoito', 'dezenove');
ctCentena: array[1..9] of string = ('cento', 'duzentos', 'trezentos', 'quatrocentos',
             'quinhentos', 'seiscentos', 'setecentos', 'oitocentos', 'novecentos');
ctDezena: array[2..9] of string = ('vinte', 'trinta', 'quarenta', 'cinquenta',
             'sessenta', 'setenta', 'oitenta', 'noventa');
ctQualificaS: array[0..4] of string = ('', 'mil', 'milhão', 'bilhão', 'trilhão');
ctQualificaP: array[0..4] of string = ('', 'mil', 'milhões', 'bilhões', 'trilhões');
var
vInteiro: Int64;
vResto: Real;
vVlrS, vS, vSaux, vVlrP, vCentavos: string;
vN, vUnid, vDez, vCent, vTam, vI: Integer;
vUmReal, vTem: Boolean;
begin
  if (vfVlr = 0) then
  begin
    valorPorExtenso := 'zero';
    exit;
  end;
  vInteiro := trunc(vfVlr);
  vResto := vfVlr - vInteiro;
  vVlrS := inttostr(vInteiro);
  if (length(vVlrS) > 15) then
  begin
    ValorPorExtenso := 'Erro: valor superior a 999 trilhões.';
    exit;
  end;
  vS := '';
  vCentavos := IntToStr(Round(vResto * 100));
  vI := 0;
  vUmReal := False;
  vTem := False;
  while (vVlrS <> '0') do
  begin
    vTam := length(vVlrS);
    if (vTam > 3) then
    begin
      vVlrP := copy(vVlrS, vTam - 2, vTam);
      vVlrS := copy(vVlrS, 1, vTam - 3);
    end
    else
    begin
      vVlrP := vVlrS;
      vVlrS := '0';
    end;
    if (vVlrP <> '000') then
    begin
      vSaux := '';
      if (vVlrP = '100') then
        vSaux := 'cem'
    else
    begin
      vN := StrToInt(vVlrP);
      vCent := vN div 100;
      vDez := (vN mod 100) div 10;
      vUnid := (vN mod 100) mod 10;
      if (vCent <> 0) then
        vSaux := ctCentena[vCent];
      if ((vDez <> 0) or (vUnid <> 0)) then
      begin
        if ((vN mod 100) <= 19) then
        begin
          if (length(vSaux) <> 0) then
            vSaux := vSaux + ' e ' + ctUnidade[vN mod 100]
          else vSaux := ctUnidade[vN mod 100];
        end
        else
        begin
          if (Length(vSaux) <> 0) then
            vSaux := vSaux + ' e ' + ctDezena[vDez]
          else
            vSaux := ctDezena[vDez];
          if (vUnid <> 0) then
            if (Length(vSaux) <> 0)then
              vSaux := vSaux + ' e ' + ctUnidade[vUnid]
            else
              vSaux := ctUnidade[vUnid];
          end;
        end;
      end;
      if ((vVlrP = '1') or (vVlrP = '001')) then
      begin
        if (vI = 0) then
          vUmReal := true
        else
          vSaux := vSaux + ' ' + ctQualificaS[vI];
      end
      else
        if (vI <> 0) then
          vSaux := vSaux + ' ' + ctQualificaP[vI];
        if (Length(vS) <> 0) then
          vS := vSaux + ', ' + vS
        else
          vS := vSaux;
      end;
      if (((vI = 0) or (vI = 1)) and (Length(vS) <> 0)) then
        vTem := true;
      vI := vI + 1;
    end;
    if (Length(vS) <> 0) then
    begin
      if (vUmReal) then
        vS := vS + ' real'
      else
        if (vTem) then
          vS := vS + ' reais'
        else
          vS := vS + ' de reais';
      end;
      if (vCentavos <> '0') then
      begin
        if (Length(vS) <> 0) then
          vS := vS + ' e ';
        if (vCentavos = '1') then
          vS := vS + 'um centavo'
        else
        begin
          vN := StrToInt(vCentavos);
          if (vN <= 19) then
            vS := vS + ctUnidade[vN]
          else
          begin
            vUnid := vN mod 10;
            vDez := vN div 10;
            vS := vS + ctDezena[vDez];
            if (vUnid <> 0)  then
              vS := vS + ' e ' + ctUnidade[vUnid];
          end;
          vS := vS + ' centavos';
        end;
      end;
      valorPorExtenso := vS;
end;

function LimpaDoc(vValor: String): String;//by Amilton
Var
vValorNotDot: String;
vTamanho, vIndice: Integer;
Begin
  vTamanho := Length(vValor);
  for vIndice := 1 to vTamanho do
  Begin
    if ((vValor[vIndice] <> '.') and (vValor[vIndice] <> '-') and (vValor[vIndice] <> '/')) then
      vValorNotDot := vValorNotDot + vValor[vIndice];
  end;
  Result := vValorNotDot;
end;

function NumeroReal(vfKey: Char): Char;
begin
  if vfKey in [',', '.'] Then
    vfKey := FormatSettings.DecimalSeparator;
  if not (vfkey in [ '0'..'9', FormatSettings.DecimalSeparator, chr(8)]) then
    Result := #0
  else
    Result := vfKey;
end;

function NumeroRealSP(vfKey: Char): Char;
begin
  if vfKey in [',', '.'] Then
    vfKey := FormatSettings.DecimalSeparator;
  if not (vfkey in [ '0'..'9', FormatSettings.DecimalSeparator]) then
    Result := #0
  else
    Result := vfKey;
end;

function Numeros(vfKey: Char): Char;
begin
  if not (vfkey in [ '0'..'9', chr(8)]) then
    Result := #0
  else
    Result := vfKey;
end;

function NumerosReg(vfKey : Char):Char;
begin
  if not (vfKey in [ '0'..'9', chr(8), chr(45)]) then
    Result := #0
  else
    Result := vfKey;
end;

function TrocaVirgPPto(vfValor: String): String;
var
vI: integer;
begin
  if vfValor <> '' then
  begin
    for vI := 0 to Length(vfValor) do
    begin
      if vfValor[vI] = ',' then
        vfValor[vI] := '.';
    end;
  end;
  Result := vfValor;
end;

function TrocaPtoPVirg(vfValor: String): String;
var
vI: integer;
begin
  if vfValor <> '' then
  begin
    for vI := 0 to Length(vfValor) do
    begin
      if vfValor[vI] = '.' then
        vfValor[vI] := ',';
    end;
  end;
  Result := vfValor;
end;

function LimpaBarra(vfValor: String): String;
Var
  vValorNotDot: String;
  vTamanho, vIndice: Integer;
Begin
  vTamanho := Length(vfValor);
  for vIndice := 1 to vTamanho do
  Begin
    if (vfValor[vIndice] <> '.') and (vfValor[vIndice] <> '-') then
      vValorNotDot := vValorNotDot + vfValor[vIndice];
  end;
  Result := vValorNotDot;
end;

function LimpaReal(vfValor: String): String;
Var
vValorNotDot: String;
vTamanho, vIndice: Integer;
Begin
  vTamanho := Length(vfValor);
  for vIndice := 1 to vTamanho do
  Begin
    if (vfValor[vIndice] <> '.') then
      vValorNotDot := vValorNotDot + vfValor[vIndice];
  end;
  Result := vValorNotDot;
end;

function LimpaCNPJ(vfCNPJ: String): String;
Var
vValorNotDot: String;
vTamanho, vIndice: Integer;
Begin
  vTamanho := Length(vfCNPJ);
  for vIndice := 1 to vTamanho do
  Begin
    if ((vfCNPJ[vIndice] <> '.') and (vfCNPJ[vIndice] <> '/') and (vfCNPJ[vIndice] <> '-')) then
      vValorNotDot := vValorNotDot + vfCNPJ[vIndice];
  end;
  Result := vValorNotDot;
end;

function PontuaCPF(vfCPF: String): String;
Var
vI: Integer;
vCPF: String;
begin
  for vI := 1 to 11 do
  begin
    vCPF := vCPF + vfCPF[vI];
    if ((vI = 3) or (vI = 6)) then
      vCPF := vCPF + '.';
    if vI = 9 then
      vCPF := vCPF + '-';
  end;
  Result := vCPF;
end;

function PontuaCNPJ(vfCNPJ: String): String;
Var
vI: Integer;
vCNPJ: String;
begin
  vCNPJ := '';
  for vI  := 1 to 14 do
  begin
    vCNPJ := vCNPJ + vfCNPJ[vI];
    if ((vI = 2) or (vI = 5)) then
      vCNPJ := vCNPJ + '.';
    if vI = 8 then
      vCNPJ := vCNPJ + '/';
    if vI = 12 then
      vCNPJ := vCNPJ + '-';
  end;
  Result := vCNPJ;
end;

function OnlyNum(vfNum: String): String;
Var
vNum: String;
vI: Integer;
begin
  for vI := 1 to Length(vfNum) do
  begin
    if vfNum[vI] in ['0'..'9']  then
      vNum := vNum + vfNum[vI];
  end;
  Result := vNum;
end;

function FormatCEP(vfCEP: String): String;
Var
vCep: String;
vI: Integer;
begin
  vCep := '';
  for vI := 1 to 8 do
  begin
    vCep := vCep + vfCEP[vI];
    if vI = 5 then
      vCep := vCep + '-';
  end;
  Result := vCep;
end;

function FormatNCM(vfNCM: String): String;
Var
vNCM: String;
vI: Integer;
begin
  vNCM := '';
  if Length(vfNCM) = 10 then
    Result := vfNCM;
  if Length(vfNCM) = 8 then
  for vI := 1 to 8 do
  begin
    vNCM := vNCM + vfNCM[vI];
    if ((vI = 4) or (vI = 6)) then
      vNCM := vNCM + '.';
  end;
  Result := vNCM;
end;

function FormataReal(vfNumeroReal: String): String;
Var
vNumReal: Real;
vResult: String;
begin
  vNumReal := StrToFloat(LimpaReal(vfNumeroReal));
  vResult := FormatFloat(vgMaskReal, vNumReal);
  Result := vResult;
end;

end.
