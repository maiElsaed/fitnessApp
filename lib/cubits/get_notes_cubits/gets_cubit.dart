import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import '../../constant.dart';
import '../../model/model.dart';
part 'gets_state.dart';

class GetsCubit extends Cubit<GetsState> {
  List<GoalModel>?allGoals;
  GetsCubit() : super(GetsInitial());
  getAllGoals(){
    var noteBox=Hive.box<GoalModel>(boxName);
    allGoals=noteBox.values.toList();
   // noteBox.delete();
    emit(SuccesState());
  }
}
