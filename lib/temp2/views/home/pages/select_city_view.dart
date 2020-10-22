import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_provider/core/base/baseview.dart';
import 'package:flutter_provider/core/viewmodel/select_city_view_model.dart';
import 'package:flutter_provider/shared/widgets/view/notch_widget.dart';

class SelectCityView extends StatefulWidget {
  @override
  _SelectCityState createState() => _SelectCityState();
}

class _SelectCityState extends State<SelectCityView> {
  SelectCityViewModel _selectCityViewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<SelectCityViewModel>(
      onModelReady: (model) {
        _selectCityViewModel = model;
        _selectCityViewModel.setContext(context);
      },
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(title: Text('İl / İlçe'), backgroundColor: Colors.black),
          body: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildSelectionButton(
                    selectedText: _selectCityViewModel.selectedCity != null ? _selectCityViewModel.selectedCity.name : "İl Seçin",
                    onClick: () {
                      buildShowDialog(
                          list: _selectCityViewModel.cities,
                          selected: (index) {
                            _selectCityViewModel.changeSelectedCity(_selectCityViewModel.cities[index]);
                          });
                    }),
                buildSelectionButton(
                    selectedText:
                        _selectCityViewModel.selectedCounty != null && _selectCityViewModel.selectedCounty.length != 0 ? _selectCityViewModel.selectedCounty[0].name : "İlçe Seçin",
                    onClick: () {
                      buildShowDialog(
                          list: _selectCityViewModel.counties34,
                          isMultiSelect: true,
                          addSelectedList: (index) {
                            _selectCityViewModel.addSelectedCountyList(_selectCityViewModel.counties34[index]);
                          },
                          selected: (index) {
                            _selectCityViewModel.changeSingleSelectedCounty(_selectCityViewModel.counties34[index]);
                          });
                    }),
              ],
            ),
          ),
        );
      },
    );
  }

  Future buildShowDialog({dynamic list, Function(int) selected, Function(int) addSelectedList, bool isMultiSelect = false}) {
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
                              isDense: true,
                            ),
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
                                        _selectCityViewModel.navigator.pop();
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                        child: Text(
                                          "Tamamla",
                                          style: TextStyle(color: Colors.white),
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
        padding: const EdgeInsets.all(8.0),
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
    );
  }
}
