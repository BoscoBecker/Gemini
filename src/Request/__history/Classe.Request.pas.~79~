unit Classe.Request;

interface

type
  TRequest = class

    private class function GetJson(const value: string): string;
    private class function GetResponseFromJson (value: string): string;

    public Class function Request(key, chatquestion: string): string;


  end;


implementation

uses  REST.Client, REST.Types,
     System.Classes, System.SysUtils, System.JSON, dialogs;


class function TRequest.GetResponseFromJson(value: string): string;
var
  JSONObject: TJSONObject;
  Candidates: TJSONArray;
  Content: TJSONObject;
  Parts: TJSONArray;
  TextValue: string;
begin
  // Parse do JSON
  JSONObject := TJSONObject.ParseJSONValue(value) as TJSONObject;
  try
    // Verifica se o objeto JSON foi criado com sucesso
    if Assigned(JSONObject) then
    begin
      // Acessa o array "candidates"
      Candidates := JSONObject.GetValue('candidates') as TJSONArray;
      if Assigned(Candidates) then
      begin
        // Itera sobre os elementos do array "candidates"
        for var I := 0 to Candidates.Count - 1 do
        begin
          // Verifica se o elemento atual é um objeto JSON
          if Candidates.Items[I] is TJSONObject then
          begin
            // Acessa o objeto "content" dentro de cada elemento do array
            Content := TJSONObject(Candidates.Items[I]).GetValue('content') as TJSONObject;
            if Assigned(Content) then
            begin
              // Acessa o array "parts" dentro de cada objeto "content"
              Parts := Content.GetValue('parts') as TJSONArray;
              if Assigned(Parts) and (Parts.Count > 0) then
              begin
                // Acessa o valor do campo "text" dentro do primeiro objeto "parts"
                TextValue := Parts.Items[0].GetValue<string>('text');
                // Exibe o valor do campo "text"
                result:= TextValue;
              end;
            end;
          end;
        end;
      end;
    end;
  finally
    JSONObject.Free;
  end;
end;

class function TRequest.Request(key, chatquestion: string): string;
var
  RESTClient: TRESTClient;
  RESTRequest: TRESTRequest;
  RESTResponse: TRESTResponse;
begin
  RESTClient := TRESTClient.Create(nil);
  RESTRequest := TRESTRequest.Create(nil);
  RESTResponse := TRESTResponse.Create(nil);
  try
    RESTClient.BaseURL := 'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key='+key;
    RESTRequest.Client := RESTClient;
    RESTRequest.Response := RESTResponse;
    RESTRequest.ContentType.ctAPPLICATION_JSON;
    RESTRequest.Method := rmPOST;
    RESTRequest.AddBody(GetJson(chatquestion), ctAPPLICATION_JSON);
    RESTRequest.Execute;
    if RESTResponse.StatusCode = 200 then
      result:= GetResponseFromJson(RESTResponse.JsonText)
    else
      result:= 'Não foi possível consultar';
  finally
    RESTClient.Free;
    RESTRequest.Free;
    RESTResponse.Free;
  end;
end;



class function TRequest.GetJson(const value: string): string;
begin
  result:=
    '    {'+
    '  "contents": ['+
    '    {            '+
    '      "role": "USER", '+
    '      "parts": { "text": "'+value+'" }'+
    '    }  ],                                '+
    '  "safety_settings": {                     '+
    '    "category": "HARM_CATEGORY_SEXUALLY_EXPLICIT",'+
    '    "threshold": "BLOCK_LOW_AND_ABOVE"              '+
    '  },'+
    '  "generation_config": {'+
    '    "temperature": 0.2,'+
    '    "topP": 0.8,'+
    '    "topK": 40,'+
    '    "maxOutputTokens": 500,'+
    '  }'+
    '}';

end;

end.
