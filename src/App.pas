unit App;

interface

uses
  System.SysUtils,
  Winapi.Windows,
  Horse,
  Horse.CORS,
  Horse.Jhonson,
  Horse.GBSwagger,
  Api_Pageneable.Controller.Customers,
  Api_Pageneable.Model.DataModule.Connection;

type
  TApp = class
  private
    LApp: THorse;
    procedure Middlewares;
    procedure Routes;
    procedure ConsoleLog;
    procedure InitBD;
  public
    procedure InitServer(const APort: Integer);
    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TApp }

procedure TApp.ConsoleLog;
begin
  Writeln('/\/\/\ Api_pageneable on /\/\/\');
  Writeln(Format('Sever on: %s', [LApp.Host]));
  Writeln(Format('Port: %d', [LApp.Port]));
  {IFDEBUG}
    Writeln('Access in: http://localhost:' + LApp.Port.ToString);
  {ENDIF}
  Writeln('Press ENTER to stop the application...');
  Readln;
  THorse.StopListen;
  FreeConsole;
end;

constructor TApp.Create;
begin
  Self.LApp := THorse.Create;
  Self.Middlewares;
  Self.Routes;
end;

destructor TApp.Destroy;
begin
  DmConnection.DisposeOf;
  inherited;
end;

procedure TApp.InitBD;
begin
  DmConnection := TDmConnection.Create(nil);
  DmConnection.Connect;
end;

procedure TApp.InitServer(const APort: Integer);
begin
  try
    Self.InitBD;
    Self.LApp.Listen(APort, Self.ConsoleLog);
  except on E: Exception do
    raise Exception.Create('Initialization error: ' + E.Message);
  end;
end;

procedure TApp.Middlewares;
begin
  Self.LApp.Use(Jhonson);
  Self.LApp.Use(CORS);
  Self.LApp.Use(HorseSwagger);
end;

procedure TApp.Routes;
begin
  THorseGBSwaggerRegister.RegisterPath(TControllerCustomers);
end;

end.
