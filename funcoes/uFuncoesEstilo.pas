unit uFuncoesEstilo;

interface

uses

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTmpFormNormal, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ComCtrls, Inifiles, Vcl.Mask, wwdbedit, Wwdotdot, Wwdbcomb,
  JvExStdCtrls, JvCombobox, VCL.Themes, VCL.Styles, VCL.Ribbon,
  VCL.RibbonLunaStyleActnCtrls, VCL.RibbonSilverStyleActnCtrls, VCL.RibbonObsidianStyleActnCtrls;

procedure LoadStyle(vfStyle: Integer);
procedure Style(vfStyle: Integer);

implementation

uses uPrincipal;

procedure LoadStyle(vfStyle: Integer);
var
vStyle: String;
vRibbon: TRibbon;
begin
  if vfStyle = 0 then
  begin
    vStyle := 'Windows';
    frmPrincipal.rbMain.Style := RibbonSilverStyle;
  end;
  if vfStyle = 1 then
  begin
    vStyle := 'Luna';
    frmPrincipal.rbMain.Style := RibbonLunaStyle;
  end;
  if vfStyle = 2 then
  begin
    vStyle := 'Obsidian';
    frmPrincipal.rbMain.Style := RibbonObsidianStyle;
  end;
  TStyleManager.TrySetStyle(vStyle);
end;

procedure Style(vfStyle: Integer);
begin
  if vfStyle = 0 then
  begin
    //frmPrincipal.rbMain.Style := '';
  end
  else
    if vfStyle = 1 then
    begin
      //frmPrincipal.rbMain.Style := 'Ribbon - Luna';
    end
    else
      if vfStyle = 2 then
      begin
        //frmPrincipal.rbMain.Style := 'Ribbon - Obsidian';
      end;
end;

end.
