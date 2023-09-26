
import 'package:mobx/mobx.dart';

part 'bottomNav.store.g.dart';

class BottomNavStore = _BottomNavStore with _$BottomNavStore;

abstract class _BottomNavStore with Store{

  @observable
  int index = 0;

  @action
  void changeIndex(int i){
    index = i;
  }

}