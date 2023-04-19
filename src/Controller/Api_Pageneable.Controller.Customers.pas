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
    [SwagGET('', 'Lists customers')]
    [SwagParamQuery('page', 'número da página')]
    [SwagResponse(200)]
    [SwagResponse(400)]
    procedure Get;
  end;

implementation

{ TControllerCustomers }

procedure TControllerCustomers.Get;
var
  LPage: Integer; 
  LModelCustomers: IModelCustomers;
  LJSONCustomers: TJSONArray;
begin
  try
    LModelCustomers :=
      TModelCustomers
      .New
      .Connection;

    TryStrToInt(FRequest.Query.Items['page'], LPage);

    LJSONCustomers :=
      LModelCustomers
        .Pagination(LPage)
        .Get
        .DataModule
        .QCustomers
        .AsJSONArray;

    FResponse.Send<TJSONArray>(LJSONCustomers);
  except on E: Exception do
    FResponse.Send('Error: ' + E.Message);
  end;
end;

end.
