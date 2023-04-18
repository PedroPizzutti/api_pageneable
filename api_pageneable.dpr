program api_pageneable;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  App in 'src\App.pas',
  Api_Pageneable.Model.DataModule.Connection in 'src\Model\DataModule\Api_Pageneable.Model.DataModule.Connection.pas' {DmConnection: TDataModule},
  Api_Pageneable.Model.DataModule.Customers in 'src\Model\DataModule\Api_Pageneable.Model.DataModule.Customers.pas' {DmCustomers: TDataModule},
  Api_Paneable.Model.Customers in 'src\Model\Api_Paneable.Model.Customers.pas',
  Api_Pageneable.Controller.Customers in 'src\Controller\Api_Pageneable.Controller.Customers.pas';

var
  App: TApp;

begin
  App := TApp.Create;
  try
    App.InitServer(9000);
  finally
    App.DisposeOf;
  end;
end.
