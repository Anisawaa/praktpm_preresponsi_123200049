import 'package:flutter/material.dart';
import 'package:praktpm_preresponsi_123200049/view/list_weapon.dart';

class SelectedWeapon extends ChangeNotifier {
  Weapon? _selectedWeapon;

  Weapon? get selectedWeapon => _selectedWeapon;

  void setSelectedWeapon(Weapon weapon) {
    _selectedWeapon = weapon;
    notifyListeners();
  }
}
