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
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure WMSize(var Msg: TMessage); message WM_SIZE;
    procedure CheckBox2Click(Sender: TObject);
    procedure FormMouseEnter(Sender: TObject);
    procedure FormMouseLeave(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Time : array[0..2] of Integer;
  Stick_Enable: bool;
  Stick: bool;
  Stick_Allow: bool;
  miss: integer;
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

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
   if CheckBox1.Checked = true then
   begin
      SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0,
                     SWP_NoMove or SWP_NoSize);
   end
   else
   begin
      SetWindowPos(Handle, HWND_NOTOPMOST, 0, 0, 0, 0,
                     SWP_NoMove or SWP_NoSize);
   end;
end;

procedure TForm1.CheckBox2Click(Sender: TObject);
begin
  if CheckBox2.Checked = true then
  begin
     Stick_Enable := True;

  end
  else
  begin
     Stick_Enable := False;

     SetWindowPos(Handle, HWND_NOTOPMOST, 0, 0, 0, 0,
                     SWP_NoMove or SWP_NoSize);
  end;

end;

procedure TForm1.FormMouseEnter(Sender: TObject);
var
  custom_point: TPoint;
begin
   if Stick_Enable = True then
   begin
       if (Stick = true) and (Stick_Allow = false)then
       begin
       Form1.Top := Screen.Monitors[0].Height div 2;
       Form1.Left := Screen.Monitors[0].Width div 2;
       custom_point.X := Screen.Monitors[0].Width div 2 + Form1.Width div 2;
       custom_point.Y := Screen.Monitors[0].Height div 2 + Form1.Height div 2;
       Mouse.CursorPos := custom_point;
       Stick_Allow := true;
       Stick := false;
       end;



   end;

end;



procedure TForm1.FormMouseLeave(Sender: TObject);
begin
  //blad jest przy wychodzeniu z okienka
  //if Stick_Enable = True then
  // begin
  //     if (Stick = false) and (Stick_Allow = true)then
  //     begin
    //        showmessage(Sender.ClassName);
     //       miss := 0;
//Form1.Left :=  -550;
  //  Form1.Top := Screen.Monitors[0].Height - Screen.Monitors[0].Height div 4;
   // Stick := True;
    //Stick_Allow := false;

      // end;



  // end;
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

procedure TForm1.WMSize(var Msg: TMessage);
begin
  if (Msg.WParam  = SIZE_MINIMIZED) AND (Stick_Enable = True) then
  begin
    SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0,
                     SWP_NoMove or SWP_NoSize);
    Application.Restore;
    Form1.Left :=  -550;
    Form1.Top := Screen.Monitors[0].Height - Screen.Monitors[0].Height div 2;
    Stick := True;
    Stick_Allow := false;
  end
end;

end.
