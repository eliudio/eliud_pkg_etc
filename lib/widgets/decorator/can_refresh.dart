abstract class CanRefresh {
  void refresh();
}

typedef RefreshCallBack = void Function(CanRefresh canRefresh);
