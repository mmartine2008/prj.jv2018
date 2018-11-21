unit UClassType;

interface
uses Variants;

type

 TClassType = class
  private
    FInteger: Integer;
    FString: String;
    FisInteger: Boolean;
  protected
  public
    constructor CreateClassTypeInteger(Value: Integer);
    constructor CreateClassTypeString(Value:string);
    destructor Destroy; override;
    function getValue: Variant;
//    procedure SetValue(isInteger: boolean);
  end;

implementation

constructor TClassType.CreateClassTypeInteger(Value: Integer);
begin
  FInteger := Value;
  FisInteger:= True;
end;


constructor TClassType.CreateClassTypeString(Value:string);
begin
  FString:= Value;
  FisInteger := False;
end;


destructor TClassType.Destroy;
begin
   inherited Destroy;
end;


function TClassType.getValue: Variant;
begin
 if(FisInteger)then
   Result := FInteger
 else
    Result := FString;
end;

end.
