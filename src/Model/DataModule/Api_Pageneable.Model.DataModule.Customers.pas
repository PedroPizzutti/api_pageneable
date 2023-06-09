unit Api_Pageneable.Model.DataModule.Customers;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Api_Pageneable.Model.DataModule.Connection;

type
  TDmCustomers = class(TDataModule)
    QCustomers: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmCustomers: TDmCustomers;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

end.
