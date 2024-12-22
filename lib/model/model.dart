import 'package:hive/hive.dart';
part 'model.g.dart';
@HiveType(typeId:0)
class GoalModel{
  @HiveField(0)
  String goaltype;
  @HiveField(1)
  int goalvalue ;

  GoalModel({required this.goaltype,required this.goalvalue});

}