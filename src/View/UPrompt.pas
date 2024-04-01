unit UPrompt;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,Classe.Gemini, Vcl.StdCtrls,
  System.Net.URLClient, System.Net.HttpClient, System.Net.HttpClientComponent,
  Data.Bind.Components, Vcl.WinXCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Memo2: TMemo;
    Image1: TImage;
    Animate: TActivityIndicator;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    function AddMensagem: string;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function TForm1.AddMensagem: string;
begin
  result:=
    'Voc�: '+ Memo1.Lines.Text+
    #13+#10+
    'Gemini: ';
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  Gemini: TGemini;
begin
  Animate.Animate:= True;
  Try
    Memo2.Lines.Add(
      AddMensagem+
      Gemini.GetInstancia
        .Configure
        .SetKeyValue('')
        .SetChatValue(Memo1.Lines.Text)
        .GenerateContent)
  Finally
    Memo1.Lines.Clear;
    Animate.Animate:= False;
  End;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Memo2.Clear;
end;

end.
