import 'package:flutter/material.dart';

class LocationTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Konum'));
    /*return Scaffold(
      appBar: AppBar(
        title: Text('Konum'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildSelectionButton(
                    selectedText: _profileViewModel.selectedCity != null ? _profileViewModel.selectedCity.name : "İl Seçin",
                    onClick: () {
                      buildShowDialog(
                          list: _profileViewModel.cities,
                          isCity: true,
                          selected: (index) {
                            _profileViewModel.changeSelectedCity(index);
                          });
                    }),
                buildSelectionButton(
                    selectedText:
                        _profileViewModel.selectedCounty != null && _profileViewModel.selectedCounty.length != 0 ? _profileViewModel.selectedCounty[0].name : "İlçe Seçin",
                    onClick: () {
                      buildShowDialog(
                          list: _profileViewModel.counties,
                          isCity: false,
                          isMultiSelect: false,
                          addSelectedList: (index) {
                            _profileViewModel.addSelectedCountyList(index);
                          },
                          selected: (index) {
                            _profileViewModel.changeSingleSelectedCounty(index);
                          });
                    }),
              ],
            ),
          ),
          Expanded(
            child: GoogleMap(
                myLocationButtonEnabled: false,
                myLocationEnabled: false,
                mapType: MapType.normal,
                mapToolbarEnabled: false,
                compassEnabled: false,
                initialCameraPosition: CameraPosition(
                  zoom: 11,
                  target: LatLng(_profileViewModel.currentUserLocation.latitude, _profileViewModel.currentUserLocation.longitude),
                ),
                markers: _profileViewModel.userMarker,
                onMapCreated: _profileViewModel.onMapCreated),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _profileViewModel.newLocationManager.stopService();
    _profileViewModel.newLocationManager = null;
    super.dispose();
  }

  Future buildShowDialog({List<CityCounty> list, Function(int) selected, Function(int) addSelectedList, bool isMultiSelect = false, bool isCity}) {
    _profileViewModel.setSearchType(isCity);
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (BuildContext context, setState) {
              return FractionallySizedBox(
                heightFactor: 0.95,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        NothcWidget(),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            "StarForce Template",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 4),
                          child: TextFormField(
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            controller: _profileViewModel.searchController,
                            decoration: new InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.green.shade800, width: 1.0),
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(24.0),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.green.shade400, width: 1.0),
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(24.0),
                                ),
                              ),
                              labelText: "Ara",
                              labelStyle: TextStyle(color: Colors.white),
                              hintStyle: TextStyle(color: Colors.white),
                              isDense: true,
                            ),
                            textInputAction: TextInputAction.done,
                            onFieldSubmitted: (term) {
                              setState(() {
                                _profileViewModel.search(term);
                                if (_profileViewModel.citiesTmp.length != 0 && _profileViewModel.isCity) {
                                  list = _profileViewModel.citiesTmp;
                                }
                                else if (_profileViewModel.counties.length != 0 && !_profileViewModel.isCity) {
                                  list = _profileViewModel.countiesTmp;
                                }
                                else if(isCity){
                                  list = _profileViewModel.cities;
                                }
                                else{
                                  list = _profileViewModel.counties;
                                }
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: Theme(
                            data: ThemeData(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                            ),
                            child: ListView.builder(
                              shrinkWrap: true,
                              primary: false,
                              itemCount: list.length,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {
                                    if (!isMultiSelect) {
                                      selected(index);
                                    } else {
                                      setState(() {
                                        addSelectedList(index);
                                      });
                                    }
                                  },
                                  child: ListTile(
                                    title: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(list[index].name, style: TextStyle(color: Colors.white)),
                                            list[index].isSelect
                                                ? Icon(
                                                    Icons.play_arrow,
                                                    size: 16,
                                                    color: Colors.white,
                                                  )
                                                : Container()
                                          ],
                                        ),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Container(
                                          color: Colors.grey.shade800,
                                          height: 1,
                                        ),
                                        SizedBox(
                                          height: index == list.length - 1 ? 60 : 0,
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    isMultiSelect
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                color: Colors.black,
                                child: Align(
                                    alignment: Alignment.centerRight,
                                    child: InkWell(
                                      onTap: () {
                                        _profileViewModel.navigator.pop();
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                                        child: Text(
                                          "Tamamla",
                                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 18),
                                        ),
                                      ),
                                    )),
                              ),
                            ],
                          )
                        : Container()
                  ],
                ),
              );
            },
          );
        });
  }

  Widget buildSelectionButton({String selectedText, VoidCallback onClick}) {
    return InkWell(
      onTap: () {
        onClick();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
        child: Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.black), borderRadius: BorderRadius.circular(10.0)),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(selectedText),
                Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        ),
      ),
    );*/
  }
}
