unit StringHelper;

interface

type
  TStringHelper = record helper for string
    function OnlyNumbers :String;
  end;

implementation

function TStringHelper.OnlyNumbers: String;
var
  I :Byte;
begin
  for I := 1 To Length(Self) do
    if Self[I] In ['0'..'9'] Then
      Result := Result + Self[I];
end;

end.