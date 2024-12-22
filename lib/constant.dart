import 'package:hive/hive.dart';
import '../model/model.dart';

const String boxName = "goal";
var GoalBox=Hive.box<GoalModel>(boxName);