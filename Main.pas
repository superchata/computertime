unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Button3: TButton;
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);

    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Time : array[0..2] of Integer;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  if Timer1.Enabled then
  begin
    Timer1.Enabled := False;
    Button1.Caption := 'Start';
  end
  else
  begin
    Timer1.Enabled := True;
    Button1.Caption := 'Stop';
  end;

end;



procedure TForm1.Button3Click(Sender: TObject);
begin
  Time[0] := 0;
  Time[1] := 0;
  Time[2] := 0;
  Label6.Caption := '00';
  Label5.Caption := '00';
  Label3.Caption := '00';
  ProgressBar1.Position := 0;
  Timer1.Enabled := False;
  Button1.Caption := 'Start';
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  Label1.Caption := '0h';
  Label2.Caption := '4h';
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
   //sekundy
   Time[0] := Time[0] + 1;

   //dodawanie 0 do wyswietlacza (np.05)
   if Time[0] < 10 then
   begin
    Label6.Caption := '0' + IntToStr(Time[0]);
   end
   else
   begin
    Label6.Caption := IntToStr(Time[0]);
   end;


   //minuty
   if Time[0] > 59 then
   begin
     Time[0] := 0;
     Label6.Caption := '00';
     Time[1] := Time[1] + 1;
     ProgressBar1.Position := ProgressBar1.Position + 416;
      if Time[1] < 10 then
      begin
      Label5.Caption := '0' + IntToStr(Time[1]);
      end
      else
      begin
      Label5.Caption := IntToStr(Time[1]);
      end;

   end;

   //godziny
   if Time[1] > 59 then
   begin
     Time[1] := 0;
     Time[2] := Time[2] + 1;

      if Time[2] < 10 then
      begin
      Label3.Caption := '0' + IntToStr(Time[2]);
      end
      else
      begin
      Label3.Caption := IntToStr(Time[2]);
      end;

   end;

   //godziny > 4
   if Time[2] = 4 then
   begin
      Timer1.Enabled := False;
      Button1.Caption := 'Start';
      showmessage('Hej, mijaj¹ juz 4 godziny od ostatniej przerwy! Zrób sobie przerwê, przewietrz pokój oraz wykonaj æwiczenia rozlu¿niaj¹ce');
      //funkcja wyswietlajaca radê
   end;





end;

end.
