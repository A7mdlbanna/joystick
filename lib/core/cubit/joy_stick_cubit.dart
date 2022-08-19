import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../constants.dart';

part 'joy_stick_state.dart';

class JoyStickCubit extends Cubit<JoyStickState> {
  JoyStickCubit() : super(JoyStickInitial());

  static JoyStickCubit get(context) => BlocProvider.of(context);


  void setIndex (idx){
   if(index != idx){
     index = idx;
     switch (index){
      case 0: words.add('Green'); break;
      case 1: words.add('Purple'); break;
      case 2: words.add('yellow'); break;
      case 3: words.add('blue'); break;
      case 4: words.add('brown'); break;
      case 5: words.add('orange'); break;
      case 6: words.add('teal'); break;
      case 7: words.add('red'); break;
      }
    }
    index = idx;
    emit(ChangeSegment());
  }
  void panEnd() {
    words.clear();
    index = 8;
    isFirst = true;
    emit(PanEnd());
  }
}
