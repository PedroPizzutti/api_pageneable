object DmCustomers: TDmCustomers
  OldCreateOrder = False
  Height = 120
  Width = 139
  object QCustomers: TFDQuery
    Connection = DmConnection.Connection
    SQL.Strings = (
      'SELECT *'
      '  FROM CUSTOMERS'
      'WHERE 0 = 0')
    Left = 48
    Top = 32
  end
end
