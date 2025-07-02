let
  WindowTarget = {
    Computer = "Computer";
    OSVolume = "OS volume";
    Home = "Home";
    Desktop = "Desktop";
    Documents = "Documents";
    Recents = "Recents";
    iCloudDrive = "iCloud Drive";
    Other = "Other";
  };

  ViewStyle = {
    Icon = "icnv";
    List = "Nlsv";
    Column = "clmv";
    Gallery = "Flwv";
  };

  SearchScope = {
    ThisMac = "SCev";
    CurrentFolder = "SCcf";
  };
in
{
  system.defaults.finder = {
    AppleShowAllFiles = false;
    AppleShowAllExtensions = true;

    CreateDesktop = false;

    FXEnableExtensionChangeWarning = false;
    FXPreferredViewStyle = ViewStyle.List;
    FXDefaultSearchScope = SearchScope.CurrentFolder;
    FXRemoveOldTrashItems = false;

    NewWindowTarget = WindowTarget.Home;
    QuitMenuItem = true;

    ShowExternalHardDrivesOnDesktop = true;
    ShowHardDrivesOnDesktop = false;
    ShowMountedServersOnDesktop = false;
    ShowRemovableMediaOnDesktop = false;
    ShowStatusBar = true;
    ShowPathbar = true;

    _FXShowPosixPathInTitle = false;
    _FXSortFoldersFirst = true;
    _FXSortFoldersFirstOnDesktop = true;
  };
}
