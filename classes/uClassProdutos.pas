unit uClassProdutos;

interface

Type TProdutos = class

  private
    FPesobruto: Real;
    FEstide: Real;
    FLocal: String;
    FPesoliq: Real;
    FMovest: String;
    FDtcad: String;
    FInativar: Integer;
    FDescricao: String;
    FCodigo: Integer;
    FEstmin: Real;
    FCodunidade: String;
    FVlroutras: Real;
    FVlratac: Real;
    FVlrimport: Real;
    FNcm: String;
    FStatus: String;
    FVlrfrete: Real;
    FCodmarca: Integer;
    FVlrvar: Real;
    FClassif: Integer;
    FCodsubgrupo: Integer;
    FCodtipo: Integer;
    FVlrcusto: Real;
    FCodgrupo: Integer;
    FMkpatac: Real;
    FCodlocal: Integer;
    FMarca: String;
    FCodbarras: String;
    FMkpvar: Real;
    FSubgrupo: String;
    FDescmax: Real;
    FOrigem: Integer;
    FMgmin: Real;
    FVlrunitario: Real;
    FGrupo: String;
    FUnidade: String;
    FTipo: String;
    FCest: String;
    FEmbalagem: real;
    FCodBarrasEmb: String;
    FCredIcms: Real;
    procedure SetClassif(const Value: Integer);
    procedure SetCodbarras(const Value: String);
    procedure SetCodgrupo(const Value: Integer);
    procedure SetCodigo(const Value: Integer);
    procedure SetCodlocal(const Value: Integer);
    procedure SetCodmarca(const Value: Integer);
    procedure SetCodsubgrupo(const Value: Integer);
    procedure SetCodtipo(const Value: Integer);
    procedure SetCodunidade(const Value: String);
    procedure SetDescmax(const Value: Real);
    procedure SetDescricao(const Value: String);
    procedure SetDtcad(const Value: String);
    procedure SetEstide(const Value: Real);
    procedure SetEstmin(const Value: Real);
    procedure SetGrupo(const Value: String);
    procedure SetInativar(const Value: Integer);
    procedure SetLocal(const Value: String);
    procedure SetMarca(const Value: String);
    procedure SetMgmin(const Value: Real);
    procedure SetMkpatac(const Value: Real);
    procedure SetMkpvar(const Value: Real);
    procedure SetMovest(const Value: String);
    procedure SetNcm(const Value: String);
    procedure SetOrigem(const Value: Integer);
    procedure SetPesobruto(const Value: Real);
    procedure SetPesoliq(const Value: Real);
    procedure SetStatus(const Value: String);
    procedure SetSubgrupo(const Value: String);
    procedure SetVlratac(const Value: Real);
    procedure SetVlrcusto(const Value: Real);
    procedure SetVlrfrete(const Value: Real);
    procedure SetVlrimport(const Value: Real);
    procedure SetVlroutras(const Value: Real);
    procedure SetVlrunitario(const Value: Real);
    procedure SetVlrvar(const Value: Real);
    procedure SetUnidade(const Value: String);
    procedure SetTipo(const Value: String);
    procedure SetCest(const Value: String);
    procedure SetEmbalagem(const Value: real);
    procedure SetCodBarrasEmb(const Value: String);
    procedure SetCredIcms(const Value: Real);

  public

    property Codigo: Integer read FCodigo write SetCodigo;
    property Descricao: String read FDescricao write SetDescricao;
    property Codunidade: String read FCodunidade write SetCodunidade;
    property Unidade: String read FUnidade write SetUnidade;
    property Codgrupo: Integer read FCodgrupo write SetCodgrupo;
    property Grupo: String read FGrupo write SetGrupo;
    property Codsubgrupo: Integer read FCodsubgrupo write SetCodsubgrupo;
    property Subgrupo: String read FSubgrupo write SetSubgrupo;
    property Codmarca: Integer read FCodmarca write SetCodmarca;
    property Marca: String read FMarca write SetMarca;
    property Codbarras: String read FCodbarras write SetCodbarras;
    property Codtipo: Integer read FCodtipo write SetCodtipo;
    property Tipo: String read FTipo write SetTipo;
    property Classif: Integer read FClassif write SetClassif;
    property Vlrunitario: Real read FVlrunitario write SetVlrunitario;
    property Vlrfrete: Real read FVlrfrete write SetVlrfrete;
    property Vlroutras: Real read FVlroutras write SetVlroutras;
    property Vlrimport: Real read FVlrimport write SetVlrimport;
    property Vlrcusto: Real read FVlrcusto write SetVlrcusto;
    property Mkpatac: Real read FMkpatac write SetMkpatac;
    property Mkpvar: Real read FMkpvar write SetMkpvar;
    property Vlratac: Real read FVlratac write SetVlratac;
    property Vlrvar: Real read FVlrvar write SetVlrvar;
    property Mgmin: Real read FMgmin write SetMgmin;
    property Descmax: Real read FDescmax write SetDescmax;
    property Movest: String read FMovest write SetMovest;
    property Codlocal: Integer read FCodlocal write SetCodlocal;
    property Local: String read FLocal write SetLocal;
    property Dtcad: String read FDtcad write SetDtcad;
    property Estmin: Real read FEstmin write SetEstmin;
    property Estide: Real read FEstide write SetEstide;
    property Pesobruto: Real read FPesobruto write SetPesobruto;
    property Pesoliq: Real read FPesoliq write SetPesoliq;
    property Origem: Integer read FOrigem write SetOrigem;
    property Inativar: Integer read FInativar write SetInativar;
    property Ncm: String read FNcm write SetNcm;
    property Status: String read FStatus write SetStatus;
    property Cest: String read FCest write SetCest;
    property Embalagem: real read FEmbalagem write SetEmbalagem;
    property CodBarrasEmb: String read FCodBarrasEmb write SetCodBarrasEmb;
    property CredIcms: Real read FCredIcms write SetCredIcms;

end;

implementation

{ TProdutos }

procedure TProdutos.SetCest(const Value: String);
begin
  FCest := Value;
end;

procedure TProdutos.SetClassif(const Value: Integer);
begin
  FClassif := Value;
end;

procedure TProdutos.SetCodbarras(const Value: String);
begin
  FCodbarras := Value;
end;

procedure TProdutos.SetCodBarrasEmb(const Value: String);
begin
  FCodBarrasEmb := Value;
end;

procedure TProdutos.SetCodgrupo(const Value: Integer);
begin
  FCodgrupo := Value;
end;

procedure TProdutos.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TProdutos.SetCodlocal(const Value: Integer);
begin
  FCodlocal := Value;
end;

procedure TProdutos.SetCodmarca(const Value: Integer);
begin
  FCodmarca := Value;
end;

procedure TProdutos.SetCodsubgrupo(const Value: Integer);
begin
  FCodsubgrupo := Value;
end;

procedure TProdutos.SetCodtipo(const Value: Integer);
begin
  FCodtipo := Value;
end;

procedure TProdutos.SetCodunidade(const Value: String);
begin
  FCodunidade := Value;
end;

procedure TProdutos.SetCredIcms(const Value: Real);
begin
  FCredIcms := Value;
end;

procedure TProdutos.SetDescmax(const Value: Real);
begin
  FDescmax := Value;
end;

procedure TProdutos.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TProdutos.SetDtcad(const Value: String);
begin
  FDtcad := Value;
end;

procedure TProdutos.SetEmbalagem(const Value: real);
begin
  FEmbalagem := Value;
end;

procedure TProdutos.SetEstide(const Value: Real);
begin
  FEstide := Value;
end;

procedure TProdutos.SetEstmin(const Value: Real);
begin
  FEstmin := Value;
end;

procedure TProdutos.SetGrupo(const Value: String);
begin
  FGrupo := Value;
end;

procedure TProdutos.SetInativar(const Value: Integer);
begin
  FInativar := Value;
end;

procedure TProdutos.SetLocal(const Value: String);
begin
  FLocal := Value;
end;

procedure TProdutos.SetMarca(const Value: String);
begin
  FMarca := Value;
end;

procedure TProdutos.SetMgmin(const Value: Real);
begin
  FMgmin := Value;
end;

procedure TProdutos.SetMkpatac(const Value: Real);
begin
  FMkpatac := Value;
end;

procedure TProdutos.SetMkpvar(const Value: Real);
begin
  FMkpvar := Value;
end;

procedure TProdutos.SetMovest(const Value: String);
begin
  FMovest := Value;
end;

procedure TProdutos.SetNcm(const Value: String);
begin
  FNcm := Value;
end;

procedure TProdutos.SetOrigem(const Value: Integer);
begin
  FOrigem := Value;
end;

procedure TProdutos.SetPesobruto(const Value: Real);
begin
  FPesobruto := Value;
end;

procedure TProdutos.SetPesoliq(const Value: Real);
begin
  FPesoliq := Value;
end;

procedure TProdutos.SetStatus(const Value: String);
begin
  FStatus := Value;
end;

procedure TProdutos.SetSubgrupo(const Value: String);
begin
  FSubgrupo := Value;
end;

procedure TProdutos.SetTipo(const Value: String);
begin
  FTipo := Value;
end;

procedure TProdutos.SetUnidade(const Value: String);
begin
  FUnidade := Value;
end;

procedure TProdutos.SetVlratac(const Value: Real);
begin
  FVlratac := Value;
end;

procedure TProdutos.SetVlrcusto(const Value: Real);
begin
  FVlrcusto := Value;
end;

procedure TProdutos.SetVlrfrete(const Value: Real);
begin
  FVlrfrete := Value;
end;

procedure TProdutos.SetVlrimport(const Value: Real);
begin
  FVlrimport := Value;
end;

procedure TProdutos.SetVlroutras(const Value: Real);
begin
  FVlroutras := Value;
end;

procedure TProdutos.SetVlrunitario(const Value: Real);
begin
  FVlrunitario := Value;
end;

procedure TProdutos.SetVlrvar(const Value: Real);
begin
  FVlrvar := Value;
end;

end.
