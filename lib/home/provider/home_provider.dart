import 'package:flutter/widgets.dart';

import '../model/home_model.dart';

class home_provider extends ChangeNotifier
{
  List<stdModel> l1 = [];
  void add_data(stdModel s1)
  {
    l1.add(s1);
    notifyListeners();
  }

  void delet_data(int index)
  {
    l1.removeAt(index);
    notifyListeners();
  }

  void edit_data(int index,stdModel s1)
  {
    l1[index] = s1;
    notifyListeners();
  }
}