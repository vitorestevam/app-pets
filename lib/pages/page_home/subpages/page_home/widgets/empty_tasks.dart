import 'package:app_pets/stores/pets/store_pets.dart';
import 'package:app_pets/widgets/image_loader.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class EmptyTasks extends StatelessWidget {
  const EmptyTasks({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _StorePets = Provider.of<StorePets>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:15.0),
      child: Column(
        children: [
          const Expanded(
            child: FittedBox(
              fit: BoxFit.fitHeight,
              alignment: Alignment.topCenter,
              child: ImageLoader("lib/assets/placeholderTask.png"),
            ),
          ),
          Container(height: 10),
          Text(
            "Não há tarefas para ${_StorePets.pets[0].name}... Vamos começar adicionando uma!",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}