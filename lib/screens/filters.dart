import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:the_project_hariyal/utils.dart';
import 'package:provider/provider.dart';

class Filters extends StatefulWidget {
  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  final Utils utils = Utils();
  Firestore firestore = Firestore.instance;
  String selectedCategory;
  String selectedState;
  String selectedArea;
  String selectedSubCategory;
  List subCategory = [];
  List areasList = [];
  Map categoryMap = {};
  Map locationsMap = {};

  @override
  Widget build(BuildContext context) {
    final QuerySnapshot extras = context.watch<QuerySnapshot>();
    final DocumentSnapshot usersnap = context.watch<DocumentSnapshot>();

    if (extras != null) {
      for (var map in extras.documents) {
        if (map.documentID == 'category') {
          categoryMap.addAll(map.data);
        } else if (map.documentID == 'locations') {
          locationsMap.addAll(map.data);
        }
      }
      if (selectedCategory != null) {
        subCategory = categoryMap[selectedCategory];
      }
      if (selectedState != null) {
        areasList = locationsMap[selectedState];
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Filers'),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.all(12),
        child: ListView(
          children: [
            Divider(),
            Text(
              'Filter by',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            utils.productInputDropDown(
                label: 'Category',
                value: selectedCategory,
                items: categoryMap.keys.toList(),
                onChanged: (value) {
                  selectedCategory = value;
                  selectedSubCategory = null;
                  handleState();
                }),
            utils.productInputDropDown(
                label: 'Sub-Category',
                value: selectedSubCategory,
                items: subCategory,
                onChanged: (value) {
                  selectedSubCategory = value;
                  handleState();
                }),
            utils.productInputDropDown(
                label: 'State',
                value: selectedState,
                items: locationsMap.keys.toList(),
                onChanged: (value) {
                  selectedState = value;
                  selectedArea = null;
                  handleState();
                }),
            utils.productInputDropDown(
                label: 'Area',
                value: selectedArea,
                items: areasList,
                onChanged: (newValue) {
                  selectedArea = newValue;
                  handleState();
                }),
            Row(
              children: <Widget>[
                Container(
                  width: (MediaQuery
                      .of(context)
                      .size
                      .width / 2) - 40,
                  child: RaisedButton(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      'Clear',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    elevation: 2,
                    color: Colors.grey.shade300,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(6.0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  width: (MediaQuery
                      .of(context)
                      .size
                      .width / 2) - 40,
                  child: RaisedButton(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    color: Colors.blueAccent[400],
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(6.0),
                      ),
                    ),
                    child: Text(
                      'Done',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    onPressed: () {
                      usersnap.reference.updateData({
                        'search': {
                          'category': selectedCategory,
                          'subCategory': selectedSubCategory,
                          'state': selectedState,
                          'area': selectedArea,
                        }
                      });
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  handleState() => (mounted) ? setState(() => null) : null;
}