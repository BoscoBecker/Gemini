## Chat with Gemini

modelo: gemini-pro

Criar um arquivo.evn na raiz do projeto

```pas
KEY=YOURKEY
 ```

Se não usar .env
```pas
var
  Gemini: TGemini;
begin
  Gemini.GetInstancia
     .Configure
     .SetKeyValue('YOUR_KEY')
     .SetChatValue(Memo1.Lines.Text)
   .GenerateContent  
  End;
 ```

Se usar .env
```pas
var
  Gemini: TGemini;
begin
  Gemini.GetInstancia
     .Configure
     .SetKeyValue('')
     .SetChatValue(Memo1.Lines.Text)
   .GenerateContent  
  End;


From https://gemini.google.com/?hl=pt-PT
