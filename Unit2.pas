unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Label7: TLabel;
    Edit7: TEdit;
    Label8: TLabel;
    Edit8: TEdit;
    Button1: TButton;
    SaveDialog1: TSaveDialog;
    Label9: TLabel;
    Edit9: TEdit;
    Label10: TLabel;
    Edit10: TEdit;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
uses Unit1;

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
    var Mn1, Mn2, pz, Tz, lambda, L, D, al: real;
      n: integer;
      tau: int64;
begin
      With SaveDialog1 do
        if Execute then begin
      Mn1:=StrToFloat(Form2.Edit1.Text);
      Mn2:=StrToFloat(Form2.Edit2.Text);
      pz:=StrToFloat(Form2.Edit3.Text);
      Tz:=StrToFloat(Form2.Edit4.Text);
      lambda:=StrToFloat(Form2.Edit5.Text);
      L:=StrToFloat(Form2.Edit6.Text);
      n:=StrToInt(Form2.Edit7.Text);
      D:=StrToFloat(Form2.Edit8.Text);
      al:=StrToFloat(Form2.Edit9.Text);
      tau:=StrToInt64(Form2.Edit10.Text);
      rewrite(output,SaveDialog1.FileName);
      Writeln(Mn1, Mn2, pz, Tz, lambda, L,' ', n, D,' ', al,' ', tau);
      Unit1.InputFile:=String(SaveDialog1.FileName);
      closefile(output);
      end
        else exit;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  Form2.Close;
end;

end.
