program Projeto_StringGrid;

uses
  Vcl.Forms,
  uForm_StringGrid in 'uForm_StringGrid.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
