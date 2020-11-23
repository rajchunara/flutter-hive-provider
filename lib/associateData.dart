import 'package:flutter/material.dart';
import 'package:flutter_hive_provider/model/associate.dart';
import 'package:hive/hive.dart';
import 'package:flutter_hive_provider/utils.dart';

class AssociateData extends ChangeNotifier {
  static const String _boxName = "associateBox";

  List<Associate> _associate = [];

  Associate _activeAssociate;

//Get all Associates from the database
//First Open box _boxName, which is async method
  void getAllAssociates() async {
    //Open box here
    var box = await Hive.openBox<Associate>(_boxName);

    //Get Associates from the box and storing them as list in _associate
    _associate = box.values.toList();

    //Notify Listeners so they can rebuild
    notifyListeners();
  }

//Get single associate
  Associate getAssociate(index) {
    return _associate[index];
  }

//Add Associate
  void addAssociate(Associate associate) async {
    //Open box to add associate
    var box = await Hive.openBox<Associate>(_boxName);
    //add the associate
    await box.add(associate);

    //get latest updated associates
    _associate = box.values.toList();

    //Notify Listeners so they can rebuild
    notifyListeners();
  }

  //Delete Associate
  void deleteAssociate(key) async {
    //Open box to delete associate
    var box = await Hive.openBox<Associate>(_boxName);

    //Delete associate here
    await box.delete(key);

    //get latest updated associates
    _associate = box.values.toList();

    Log.i("Deleted Associate with member key" + key.toString());

    //Notify Listeners so they can rebuild
    notifyListeners();
  }

//Edit associate
  void editAssociate({Associate associate, int associateKey}) async {
    //Open the box
    var box = await Hive.openBox<Associate>(_boxName);
    //add edited associate
    await box.put(associateKey, associate);

    //get latest updated associates
    _associate = box.values.toList();

    //Get the edited associate to log
    _activeAssociate = box.get(associateKey);

    Log.i("Edited" + associate.name);

    //Notify Listeners so they can rebuild
    notifyListeners();
  }
}
