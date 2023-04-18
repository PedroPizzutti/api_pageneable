unit Api_Pageneable.Controller.Customers;

interface

uses
  System.Classes,
  System.JSON,
  System.StrUtils,
  System.SysUtils,
  System.Types,
  GBSwagger.Path.Attributes,
  Horse,
  Horse.GBSwagger,
  Horse.Jhonson,
  Horse.Commons,
  Rest.Json,
  DataSetConverter4D,
  DataSetConverter4D.Impl,
  DataSetConverter4D.Helper,
  DataSetConverter4D.Util,
  Api_Paneable.Model.Customers;

type
  [SwagPath('customers', 'Customers')]
  TControllerCustomers = class(THorseGBSwagger)

  public
    [SwagGET('lists', 'Lists customers')]
    [SwagResponse(200)]
    [SwagResponse(400)]
    procedure Get;
  end;

implementation

{ TControllerCustomers }

procedure TControllerCustomers.Get;
var
  LModelCustomers: IModelCustomers;
  LJSONCustomers: TJSONObject;
begin
  LModelCustomers :=
    TModelCustomers
    .New
    .Connection;

  LJSONCustomers :=
    LModelCustomers
      .Get
      .DataModule
      .QCustomers
      .AsJSONObject;

  FResponse.Send<TJSONObject>(LJSONCustomers);
end;

end.
