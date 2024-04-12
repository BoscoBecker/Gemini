## Chat with Gemini

![image](https://github.com/BoscoBecker/Gemini/assets/6303278/8c787c5c-ffc3-4ca7-85c1-d690bd063798)


modelo: gemini-pro

Criar um arquivo .env na raiz do projeto

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
