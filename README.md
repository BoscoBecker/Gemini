## Chat with Gemini

modelo: gemini-pro

Se nãpo usar .env
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

![image](/src/imagem/final_open_graph_L0PRwHT.width-1300.png)

