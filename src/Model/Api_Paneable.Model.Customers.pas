unit Api_Paneable.Model.Customers;

interface

uses
  System.Classes,
  Api_Pageneable.Model.DataModule.Customers,
  Api_Pageneable.Model.DataModule.Connection;

type
  IModelCustomers = interface
    ['{1D67AE20-47A4-4650-85EC-6D7D0435E47D}']
    function Connection: IModelCustomers;
    function DataModule: TDmCustomers;

    function Get: IModelCustomers;
    function Pagination(APage: Integer = 1;
    AQtdPerPage: Integer = 10): IModelCustomers;
  end;

  TModelCustomers = class(TInterfacedObject, IModelCustomers)
  private
    FDmCustomers: TDmCustomers;

    function Connection: IModelCustomers;
    function DataModule: TDmCustomers;

    function Get: IModelCustomers;
    function Pagination(APage: Integer = 1;
      AQtdPerPage: Integer = 10): IModelCustomers;
  protected

  public
    constructor Create;
    destructor Destroy; override;
    class function New: IModelCustomers;
  published

  end;

implementation

{ TCustomers }

function TModelCustomers.Connection: IModelCustomers;
begin
  Result := Self;
  Self.FDmCustomers.QCustomers.Connection := DmConnection.Connection;
end;

constructor TModelCustomers.Create;
begin
  Self.FDmCustomers := TDmCustomers.Create(nil);;
end;

function TModelCustomers.DataModule: TDmCustomers;
begin
  Result := FDmCustomers;
end;

destructor TModelCustomers.Destroy;
begin
  Self.FDmCustomers.DisposeOf;
  inherited;
end;

function TModelCustomers.Get: IModelCustomers;
begin
  Result := Self;
  FDmCustomers.QCustomers.Close;
  FDmCustomers.QCustomers.Prepare;
  FDmCustomers.QCustomers.Open;
end;

class function TModelCustomers.New: IModelCustomers;
begin
  Result := Self.Create;
end;

function TModelCustomers.Pagination(APage: Integer = 1;
    AQtdPerPage: Integer = 10): IModelCustomers;
begin
  Result := Self;
  if FDmCustomers.QCustomers.Connection.Connected then
  begin
    FDmCustomers.QCustomers.Disconnect;
  end;
  FDmCustomers.QCustomers.FetchOptions.RecsMax := AQtdPerPage;
  FDmCustomers.QCustomers.FetchOptions.RecsSkip := (APage - 1) * AQtdPerPage;
end;

end.
