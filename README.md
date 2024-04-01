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

![image](https://github.com/BoscoBecker/Gemini/assets/6303278/ce764461-8965-4893-83b5-f9451245c3ab)

