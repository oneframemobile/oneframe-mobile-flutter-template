import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_provider/core/base/base_model.dart';
import 'package:flutter_provider/core/enum/page_named.dart';
import 'package:flutter_provider/core/model/city_model.dart';
import 'package:flutter_provider/core/model/county_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location_manager/location_manager.dart';

class SelectCityViewModel extends BaseModel {
  BuildContext _context;

  BuildContext get context => _context;

  List<CityCounty> cities = new List();
  List<County> counties34 = new List();
  List<County> counties35 = new List();
  List<County> counties6 = new List();


  CityCounty selectedCity;
  List<County> selectedCounty = new List();

  SelectCityViewModel(){

  }


  @override
  void setContext(BuildContext context) {
    this._context = context;


  }

  changeSelectedCity(CityCounty selectedCityTemp){
    selectedCity = selectedCityTemp;
    navigator.pop();
    notifyListeners();
  }

  changeSingleSelectedCounty(County selectedCountyTemp){
    selectedCounty.clear();
    selectedCounty.add(selectedCountyTemp);
    navigator.pop();
    notifyListeners();
  }

  addSelectedCountyList(County selectedCountyTemp){
    selectedCountyTemp.isSelect = !selectedCountyTemp.isSelect;
    if(selectedCounty.contains(selectedCountyTemp)){
      selectedCounty.remove(selectedCountyTemp);
    }
    else{
      selectedCounty.add(selectedCountyTemp);
    }

    notifyListeners();
  }
}
