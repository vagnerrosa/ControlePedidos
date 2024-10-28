object DM: TDM
  Height = 533
  Width = 699
  PixelsPerInch = 120
  object FDConnection: TFDConnection
    Params.Strings = (
      'Server=127.0.0.1'
      'User_Name=root'
      'Database=wk_teste'
      'DriverID=MySQL')
    LoginPrompt = False
    BeforeConnect = FDConnectionBeforeConnect
    Left = 154
    Top = 26
  end
  object FDPhysMySQLDriverLink: TFDPhysMySQLDriverLink
    VendorLib = 'D:\Delphi\WKtechnology\Win32\Debug\dll\libmySQL.dll'
    Left = 430
    Top = 26
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    ScreenCursor = gcrDefault
    Left = 434
    Top = 134
  end
end
