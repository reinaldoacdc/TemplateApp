unit XmlHelper;

interface

uses
  XmlIntf, XmlDoc;

function RecursiveFindNode(
  ANode: IXMLNode; const SearchNodeName: string): IXMLNode;

implementation

uses
  System.SysUtils;

function RecursiveFindNode(
  ANode: IXMLNode; const SearchNodeName: string): IXMLNode;
var
  I: Integer;
begin
  Result := nil;
  if not Assigned(ANode) then
    exit;

  if CompareText(ANode.NodeName, SearchNodeName) = 0 then
    Result := ANode
  else
    if Assigned(ANode.ChildNodes) then
      for I := 0 to ANode.ChildNodes.Count - 1 do
      begin
        Result := RecursiveFindNode(ANode.ChildNodes[I], SearchNodeName);
        if Result <> nil then
          Exit;
      end;
end;


end.
