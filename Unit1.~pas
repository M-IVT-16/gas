unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, Spin, XPMan;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    OpenDialog1: TOpenDialog;
    N7: TMenuItem;
    procedure N5Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  InputFile: string;
  
procedure Graph;

implementation
Uses Unit2, Unit3;
Const Maxn=500; g=9.81; pa=9.81E+4;
      pc=45.8E5; Tc=190.5; R=496; cp0=2300;
      p0r=pa/pc; ugol=pi/2;
Type
       real=double;
       tU=array[0..Maxn] of real;

Var pm, Tm, T0:tU;
    n, i: integer;
    Mn0, Mn1, Mn2, pz, Tz, Mn, L, D, w, al, lambda, cz, cp: real;
    h, geotgr: real;
    rho, VT, v, p, T, z, T1, T2, Tnar, eps: real;
    Tv:array[0..Maxn] of real;
    tt, tau, s:int64;
    x, k1,k2,k3,k4, l1,l2,l3,l4:real;

{$R *.dfm}

Procedure US(p,T:real);
var pr, Tr, z1, z2, cv, k:real;
begin
  pr:=p/pc; Tr:=T/Tc;
  z:=1+0.07*pr/Tr*(1-6*sqr(1/Tr));
  rho:=p/(z*R*T);
  z1:=1;
  z2:=1+0.84* pr/(Tr*Tr*Tr);
  VT:=z2/(rho*z*T);
  cp:=cp0+81*R*(pr-p0r)/(Tr*Tr*Tr*32);
  cv:=cp-R*sqr(z2)/z1;
  k:=cp/cv;
  cz:=z*sqrt(k*R*T/z1);
end;

Function f1(p,T:real):real;
var  pr, Tr, rho:real;
begin
  pr:=p/pc; Tr:=T/Tc;
  z:=1+0.07*pr/Tr*(1-6*sqr(1/Tr));
  rho:=p/(z*R*T);
  result:=-rho*( g+lambda*sqr(Mn/rho)/(2*D) );
end;

Function gg(p,T,Tnar:real):real;
var  pr, Tr, rho, q:real;
begin
  pr:=p/pc; Tr:=T/Tc;
  z:=1+0.07*pr/Tr*(1-6*sqr(1/Tr));
  rho:=p/(z*R*T);
  q:=al*(Tnar-T);
  result:=4*q/D+lambda*sqr(Mn/rho)*abs(Mn)/(2*D);
end;
Function f2(p,T,Tnar:real):real;
begin
  US(p,T);
  result:=(gg(p,T,Tnar) + Mn*T*VT*f1(p,T))/(Mn*cp);
end;

Procedure Solve;
begin
 rewrite(output,'truba.out');
 pz:=pz*pa;
 w:=pi*D*D/4;
 h:=L/n;
 Mn0:=Mn1;
REPEAT
 Mn:=Mn0/w;
 tt:=0;   x:=0;
 geotgr:=(Tz-273)/L; //geotgr - геотермический градиент
 for i:=0 to n do begin Tv[i]:=Tz-geotgr*i*h; end;
 pm[0]:=pz; Tm[0]:=Tz;
 begin

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  T0:=Tm; s:=0;
     for i:=1 to n do begin
     p:=pm[i-1]; T:=Tm[i-1];
     k1:=h*f1(p,T);            l1:=h*f2(p,      T,     Tv[i-1]);
     k2:=h*f1(p+k1/2, T+l1/2); l2:=h*f2(p+k1/2, T+l1/2,0.5*(Tv[i-1]+Tv[i]));
     k3:=h*f1(p+k2/2, T+l2/2); l3:=h*f2(p+k2/2, T+l2/2,0.5*(Tv[i-1]+Tv[i]));
     k4:=h*f1(p+k3,   T+l3);   l4:=h*f2(p+k3,   T+l3,  Tv[i]);
     pm[i]:=pm[i-1] + (k1+2*k2+2*k3+k4)/6;
  	 Tm[i]:=Tm[i-1] + (l1+2*l2+2*l3+l4)/6;
	end;

 end;
  writeln(Mn*w:7:2,' ',Tm[n]:9:4);
  Mn0:=Mn0+1;
UNTIL Mn0>Mn2;
closefile(output);
end;

Procedure Calc;
begin
With Unit1.Form1.OpenDialog1 do
    if Execute then begin
      reset(input,Unit1.Form1.OpenDialog1.FileName);
      Readln(Mn1, Mn2, pz, Tz, lambda, L, n, D, al, tau);
      Form2.Edit1.Text:=FloatToSTR(Mn1);
      Form2.Edit2.Text:=FloatToSTR(Mn2);
      Form2.Edit3.Text:=FloatToSTR(pz);
      Form2.Edit4.Text:=FloatToSTR(Tz);
      Form2.Edit5.Text:=FloatToSTR(lambda);
      Form2.Edit6.Text:=FloatToSTR(L);
      Form2.Edit7.Text:=IntToStr(n);
      Form2.Edit8.Text:=FloatToSTR(D);
      Form2.Edit9.Text:=FloatToStr(al);
      Form2.Edit10.Text:=IntToStr(tau);
      InputFile:=String(Unit1.Form1.OpenDialog1.FileName);
      closefile(input);
      Solve;
end
  else exit;
end;

Procedure Graph;
  var
    Mn:array[0..Maxn] of real;
    Tm:array[0..Maxn] of real;
    i:integer;
    j:integer;
    min, max, a, b, c, d:real;
    x0, y0, x1, x2, y1, y2: integer;
    xg, yg:integer;
  begin
  for i := 0 to Maxn do begin Mn[i]:=0 ; Tm[i]:=0; end; 

    reset(input,Unit1.Form1.OpenDialog1.FileName);
      Readln(Mn1, Mn2, pz, Tz, lambda, L, n, D, al, tau);
      InputFile:=String(Unit1.Form1.OpenDialog1.FileName);
      closefile(input);
    Solve;
    
    i:=0;
    reset(input,'truba.out');
    While not seekeof(input) do begin
        readln(Mn[i], Tm[i]);
        i:=i+1;
    end;
     closefile(input);
     i:=i-1;
    x0:=20;
    y0:=20;
    x2:=Form3.Image1.Width-10;
    y2:=Form3.Image1.Height-10;
    a:=Mn[0]; b:=Mn[i];
    max:=Tm[0];
    min:=max;
    for j:=1 to i do
      begin
        if Tm[j] > max then max:=Tm[j];
        if Tm[j] < min then min:=Tm[j];
      end;
    c:=min; d:=max;
    with Form3.Image1.Canvas do
    begin  pen.Color:=clBlack;
      moveto(x0,Form3.Image1.Height-y0);
      lineto(x0,Form3.Image1.Height-y2);
      moveto(x0,Form3.Image1.Height-y0);
      lineto(x2,Form3.Image1.Height-y0);
      Textout(x0,y2-6,'0');
      Textout(x0-10,Form3.Image1.Height-(y2+6),'T');
      Textout(x2-5,y2-30,'M');
      x1:=round((x2*(Mn[0]-a)+x0*(b-Mn[0]))/(b+a)*a);
      y1:=round((y0*(Tm[0]-c)+y2*(d-Tm[0]) )/(b+a)*a);
      xg:=round( (x2*(Mn[0]-a)+x1*(b-Mn[0]) )/(b-a) );
      yg:=round( (y1*(Tm[0]-c)+y2*(d-Tm[0]) )/(d-c) -y1+10);
      Textout(xg-6,y2-6,FloatToStr(Mn[0]));
      Textout(x0+3,Form3.Image1.Height-(y2+6),FloatToStrf(max,fffixed,6,2));
      Textout(x0+3,Form3.Image1.Height-(y1+6),FloatToStrf(min,fffixed,6,2));
      moveto(xg,yg);
        for j:=1 to i do
          begin
            xg:=round( (x2*(Mn[j]-a)+x1*(b-Mn[j]) )/(b-a) );
            yg:=round( (y1*(Tm[j]-c)+y2*(d-Tm[j]) )/(d-c) -y1+10);
            lineto(xg,yg);
          end;
        for j:=1 to i do
          begin
            xg:=round( (x2*(Mn[j]-a)+x1*(b-Mn[j]) )/(b-a) );
            yg:=round( (y1*(Tm[j]-c)+y2*(d-Tm[j]) )/(d-c) -y1+10);
            Textout(xg-6,y2-6,FloatToStr(Mn[j]));

          end;
    end;
  end;


procedure TForm1.N2Click(Sender: TObject);
begin
  Form2.Showmodal;
end;

procedure TForm1.N3Click(Sender: TObject);

begin
  With OpenDialog1 do
    if Execute then begin
      reset(input,OpenDialog1.FileName);
      Readln(Mn1, Mn2, pz, Tz, lambda, L, n, D, al, tau);
      Form2.Edit1.Text:=FloatToSTR(Mn1);
      Form2.Edit2.Text:=FloatToSTR(Mn2);
      Form2.Edit3.Text:=FloatToSTR(pz);
      Form2.Edit4.Text:=FloatToSTR(Tz);
      Form2.Edit5.Text:=FloatToSTR(lambda);
      Form2.Edit6.Text:=FloatToSTR(L);
      Form2.Edit7.Text:=IntToStr(n);
      Form2.Edit8.Text:=FloatToSTR(D);
      Form2.Edit9.Text:=FloatToStr(al);
      Form2.Edit10.Text:=IntToStr(tau);
      InputFile:=String(OpenDialog1.FileName);
      closefile(input);
      Form2.ShowModal;
    end
      else exit;

end;

procedure TForm1.N5Click(Sender: TObject);
var Mn1, Mn2:real;
begin
 Calc;
 Mn1:=StrToFloat(Form2.Edit1.Text);
 Mn2:=StrToFloat(Form2.Edit2.Text);
 Form3.Edit1.Text:=FloatToStrF(pm[n]*1.e-5, ffFixed, 16, 4);
 Form3.Edit2.Text:=FloatToStrF(Tm[n], ffFixed, 16, 4);
 Form3.Edit3.Text:=FloatToStr(Mn1)+'..'+FloatToStr(Mn0-4);
 Form3.Edit4.Text:=IntToStr(4);
end;

procedure TForm1.N6Click(Sender: TObject);
begin
  Graph;
  Form3.ShowModal;
end;

procedure TForm1.N7Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
