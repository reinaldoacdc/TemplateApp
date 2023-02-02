unit StringHelper;

interface

type
  TStringHelper = record helper for string
    function OnlyNumbers :String;
    function InArray(const ArrayOfString : Array of String) : Boolean;
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

function TStringHelper.InArray(const ArrayOfString : Array of String) : Boolean;
var
 Loop : String;
begin
  for Loop in ArrayOfString do
  begin
    if Self = Loop then
    begin
       Exit(true);
    end;
  end;
  result := false;
end;

end.