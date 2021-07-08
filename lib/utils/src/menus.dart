part of utils;

class UtilsMenus {

  static List<UtilsMenusKey> menus = [];

  static UtilsMenusKey add(VoidCallback updateState) {
    UtilsMenusKey utilsMenusKey = UtilsMenusKey(menus.length, false, updateState);
    menus.add(utilsMenusKey);

    return utilsMenusKey;
  }

  static UtilsMenusKey get(int index) {
    return menus[index];
  }

  static updateAll() {
    menus.forEach((menu) {
      menu.setActive(false);
    });
  }
}

class UtilsMenusKey {

  UtilsMenusKey(this.index, this.active, VoidCallback updateState)
    : _updateState = updateState;

  final int index;

  bool active;

  final VoidCallback _updateState;

  void updateState() => _updateState();

  void setActive(bool isActive) {
    active = isActive;
    updateState();
  }
}