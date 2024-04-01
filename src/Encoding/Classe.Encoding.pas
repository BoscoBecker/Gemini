unit Classe.Encoding;

interface

uses  System.NetEncoding, IdGlobal, IdHMAC,IdSSLOpenSSL, IdHMACSHA1;

type
  TEncoding = class
   public class function CalcHMACSHA384Base64(const key, dados: string): string;

  end;



implementation

uses
  System.SysUtils;


class function TEncoding.CalcHMACSHA384Base64(const key, dados: string): string;
var
  HMAC: TIdHMACSHA384;
  HashBytes: TIdBytes;
  IdBytes: TIdBytes;
  DataBytes: TIdBytes;
  I: Integer;
begin
  // Converte a chave secreta para TIdBytes
  SetLength(IdBytes, Length(key));
  Move(key[1], IdBytes[0], Length(key));

  // Converte os dados para TIdBytes
  SetLength(DataBytes, Length(dados));
  for I := 1 to Length(dados) do
    DataBytes[I - 1] := Byte(dados[I]);

  HMAC := TIdHMACSHA384.Create;
  try
    HMAC.Key := IdBytes; // Define a chave secreta

    // Calcula o HMAC-SHA384
    HashBytes := HMAC.HashValue(DataBytes);

    // Converte os bytes do hash para uma string Base64
    Result := TBase64Encoding.Base64.EncodeBytesToString(HashBytes);
  finally
    HMAC.Free;
  end;
end;
end.
