import 'package:app_pets/classes/pet.dart';
import 'package:app_pets/pages/page_home/onboarding/onboard_intro.dart';
import 'package:app_pets/pages/page_pet/create_pet_intro.dart';
import 'package:app_pets/pages/tab_bar_handler.dart';
import 'package:flutter/cupertino.dart';

import 'package:mobx/mobx.dart';
// run builder on cmd to generate the code

part 'store_global.g.dart';
class StoreGlobal = _StoreGlobal with _$StoreGlobal;

// Create the class
abstract class _StoreGlobal with Store {
  @observable
  bool tutorialDone = true;

  @observable
  ObservableList<Pet> pets = ObservableList<Pet>.of([]);
  
  Widget starting_app_route(){
    if(!tutorialDone) return OnboardingIntro();
    else if(pets.isEmpty) return CreatePetIntro(); // @TODO CRIAÇÃO DE PETS
    else return TabBarHandler();
  }

  @action 
  void addNewPet(Pet){
    pets.add(Pet);    
  }
}