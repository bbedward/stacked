import 'package:new_architecture/app/app.logger.dart';
import 'package:new_architecture/logic/action_description.dart';
import 'package:new_architecture/logic/action_descriptions.dart';
import 'package:new_architecture/logic/action_name.dart';
import 'package:new_architecture/logic/humans/get_all_humans_action.dart';

/** This is an example and not the final implementation. This class will be generated by Stacked */

/// A class dedicated to running commands and providing back a result.
class LogicRunner {
  final log = getLogger('LogicRunner');

  Future runLogicAction<T>(ActionDescription action) {
    final actionName = _getActionNameFromAction(action);
    log.i('Run action: $actionName parameters: ${action.toString()}');
    switch (actionName) {
      case ActionName.getAllHumans:
        return GetAllHumansAction().run();
      default:
        return Future.value('No action defined');
    }
  }

  ActionName _getActionNameFromAction(ActionDescription action) {
    if (action is GetAllHumansActionDescription) {
      return ActionName.getAllHumans;
    }

    return ActionName.noAction;
  }
}