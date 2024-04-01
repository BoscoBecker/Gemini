program PromptGemini;

uses
  Vcl.Forms,
  UPrompt in 'src\view\UPrompt.pas' {Form1},
  Classe.Gemini in 'src\Classes\Classe.Gemini.pas',
  Classe.Request in 'src\Request\Classe.Request.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
