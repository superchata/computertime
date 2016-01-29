program CzasPracy;

uses
  Vcl.Forms,
  Main in '..\Czas pracy\Main.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Program do zarz¹dzania czasem spêdzonym przed komputerem';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
