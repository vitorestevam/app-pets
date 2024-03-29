import 'package:app_pets/classes/period_tuple.dart';
import 'package:app_pets/classes/pet.dart';
import 'package:app_pets/classes/tasks/task.dart';
import 'package:app_pets/classes/tasks/task_unique.dart';
import 'package:app_pets/classes/tasks/task_weekly.dart';
import 'package:app_pets/pages/page_home/subpages/page_add_task/widgets/date_picker.dart';
import 'package:app_pets/pages/page_home/subpages/page_add_task/widgets/week_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'period_picker.dart';

class PeriodSelector extends StatefulWidget {
  final Function(Function factory, dynamic param) onPeriodSubmit;

  const PeriodSelector(
    this.onPeriodSubmit, {
    Key? key,
  }) : super(key: key);

  @override
  State<PeriodSelector> createState() => _PeriodSelectorState();
}

class _PeriodSelectorState extends State<PeriodSelector> {
  var isSelected = [true, false];

  void submitTaskUnique(DateTime dt) {
    // ignore: prefer_function_declarations_over_variables
    var _factory = (String a, Pet b, dynamic c) => TaskUnique(a, b, c);
    widget.onPeriodSubmit(_factory, dt);
  }

  void submitTaskWeekly(List<int> wk) {
    // ignore: prefer_function_declarations_over_variables
    var _factory = (String a, Pet b, dynamic c) => TaskWeekly(a, b, c);
    widget.onPeriodSubmit(_factory, wk);
  }

  void submitTaskPeriodic(PeriodTuple dr) {
    // ignore: prefer_function_declarations_over_variables
    // var _factory = (String a, Pet b, dynamic c) => TaskPeriodic(a, b, c);
    // widget.onPeriodSubmit(_factory, wk);

    print(dr);
  }

  Widget getBody() {
    if (isSelected[0]) {
      return DatePicker(
        callback: (a) => submitTaskUnique(a),
      );
    }

    if (isSelected[1]) {
      return WeekPicker(
        callback: (a) => submitTaskWeekly(a),
      );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Frequência",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Container(
            height: 15,
          ),
          ToggleButtons(
            constraints: BoxConstraints.expand(width: constraints.maxWidth / 2 - 2),
            borderRadius: BorderRadius.circular(3.0),
            borderColor: Theme.of(context).primaryColor,
            selectedBorderColor: Theme.of(context).primaryColor,
            textStyle: const TextStyle(fontWeight: FontWeight.w500),
            selectedColor: Colors.white,
            fillColor: Theme.of(context).primaryColor,
            children: const <Widget>[
              Text("ÚNICA"),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: Text("SEMANAL"),
              ),
            ],
            onPressed: (int index) {
              setState(
                () {
                  for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
                    if (buttonIndex == index) {
                      isSelected[buttonIndex] = true;
                    } else {
                      isSelected[buttonIndex] = false;
                    }
                  }
                },
              );
            },
            isSelected: isSelected,
          ),
          Container(
            height: 15,
          ),
          Container(
            child: getBody(),
          )
        ],
      );
    });
  }
}
