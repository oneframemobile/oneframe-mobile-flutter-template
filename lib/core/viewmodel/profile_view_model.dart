import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_provider/core/api/service.dart';
import 'package:flutter_provider/core/base/base_model.dart';
import 'package:flutter_provider/core/enum/page_named.dart';
import 'package:flutter_provider/core/model/city_model.dart';
import 'package:flutter_provider/core/model/county_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location_manager/location_manager.dart';
import 'package:networking/networking/network_listener.dart';

class ProfileViewModel extends BaseModel {
  BuildContext _context;

  BuildContext get context => _context;
  Set<Marker> userMarker = new Set();

  TextEditingController searchController = new TextEditingController();

  Completer<GoogleMapController> controller = Completer();
  GoogleMapController mapController;

  bool isCity;
  final String USER_MARKER_ID = "UserMarker";
  LocationManager newLocationManager;
  LatLng currentUserLocation = new LatLng(41.0064995, 28.7929262);

  List<CityCounty> cities = new List();
  List<CityCounty> citiesTmp = new List();
  List<CityCounty> counties = new List();
  List<CityCounty> countiesTmp = new List();

  final Service _service = Service();
  CityCounty selectedCity;
  List<CityCounty> selectedCounty = new List();

  ProfileViewModel() {
    newLocationManager = new LocationManager();

    newLocationManager.getLocation(
      onLocationValue: (val) {
        currentUserLocation = val;
        addMarkerUser();
      },
      isLocationTrack: false,
      onRejectPermission: () {
        addMarkerUser();
      },
    );
  }

  onMapCreated(GoogleMapController _controller) async {
    mapController = _controller;
    controller.complete(_controller);

    focusMyLocation();
  }

  addMarkerUser() async {
    Marker m = Marker(
        icon: await BitmapDescriptor.fromAssetImage(
            ImageConfiguration(
              devicePixelRatio: 4,
            ),
            'assets/images/user_marker_icon.png'),
        markerId: MarkerId(USER_MARKER_ID),
        onTap: () {},
        position: LatLng(currentUserLocation.latitude, currentUserLocation.longitude));
    userMarker.add(m);
    focusMyLocation();
    notifyListeners();
  }

  @override
  void setContext(BuildContext context) {
    this._context = context;

    getAllCity();

  }

  search(String term) async {
    if (isCity) {
      citiesTmp.clear();
      for (int i = 0; i < cities.length; i++) {
        CityCounty currentCity = cities[i];

        if (currentCity.name.toString().toLowerCase().contains(term.toLowerCase())) {
          citiesTmp.add(currentCity);
        }
      }
    } else {
      countiesTmp.clear();
      for (int i = 0; i < counties.length; i++) {
        CityCounty currentCounty = counties[i];

        if (currentCounty.name.toString().toLowerCase().contains(term.toLowerCase())) {
          countiesTmp.add(currentCounty);
        }
      }
    }

    notifyListeners();
  }

  setSearchType(bool val) {
    isCity = val;
  }

  focusMyLocation() {
    try {
      Future.delayed(Duration(milliseconds: 300), () {
        mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target: LatLng(currentUserLocation.latitude, currentUserLocation.longitude),
          zoom: 15,
        )));
      });
    } catch (e) {}
  }

  goSelect() {
    navigator.navigateTo(Pages.SelectCity);
  }

  changeSelectedCity(int index) {
    CityCounty selectedCityTemp;
    if(citiesTmp.length == 0){
      selectedCityTemp = cities[index];
    }
    else{
      selectedCityTemp = citiesTmp[index];
    }
    clearController();
    selectedCity = selectedCityTemp;
    getCounties(selectedCity.id);
    navigator.pop();
    notifyListeners();
  }

  changeSingleSelectedCounty(int index) {
    CityCounty selectedCountyTemp;
    if(countiesTmp.length == 0){
      selectedCountyTemp = counties[index];
    }
    else{
      selectedCountyTemp = countiesTmp[index];
    }

    selectedCounty.clear();
    selectedCounty.add(selectedCountyTemp);
    navigator.pop();
    notifyListeners();
  }

  addSelectedCountyList(int index) {
    CityCounty selectedCountyTemp;
    if(countiesTmp.length == 0){
      selectedCountyTemp = counties[index];
    }
    else{
      selectedCountyTemp = countiesTmp[index];
    }

    selectedCountyTemp.isSelect = !selectedCountyTemp.isSelect;
    if (selectedCounty.contains(selectedCountyTemp)) {
      selectedCounty.remove(selectedCountyTemp);
    } else {
      selectedCounty.add(selectedCountyTemp);
    }

    notifyListeners();
  }

  getAllCity() async {
    await _service.getAllCity(
        listener: new NetworkListener()
          ..onSuccess((dynamic result) {
            cities.addAll(result.data.list);
            notifyListeners();
          })
          ..onError((dynamic error) {
            print("hataaa");
          }));
  }

  getCounties(int cityId) async {
    clearController();
    await _service.getCounties(
        cityId: cityId,
        listener: new NetworkListener()
          ..onSuccess((dynamic result) {
            counties.clear();
            selectedCounty.clear();
            counties.addAll(result.data.list);
            notifyListeners();
          })
          ..onError((dynamic error) {
            print("hataaa");
          }));
  }

  clearController(){
    searchController.text = "";
  }
}
