import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:the_project_hariyal/screens/superuser/admin_screens/extras/extra_identifier.dart';
import 'package:the_project_hariyal/screens/superuser/admin_screens/extras/shorooms.dart';
import 'package:the_project_hariyal/services/auth_services.dart';

class Extras extends StatefulWidget {
  @override
  _ExtrasState createState() => _ExtrasState();
}

class _ExtrasState extends State<Extras> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(9),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            color: Colors.grey.shade300,
          ),
          child: ListTile(
            onTap: () {
              addAdminDialouge();
            },
            title: Center(
              child: Text('Add Admin'),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(9),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            color: Colors.grey.shade300,
          ),
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ExtraIdentifier(
                    identifier: 'category',
                  ),
                ),
              );
            },
            title: Center(
              child: Text('Tweak Categories'),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(9),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            color: Colors.grey.shade300,
          ),
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ExtraIdentifier(
                    identifier: 'states',
                  ),
                ),
              );
            },
            title: Center(
              child: Text('Tweak States'),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(9),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            color: Colors.grey.shade300,
          ),
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ExtraIdentifier(
                    identifier: 'areas',
                  ),
                ),
              );
            },
            title: Center(
              child: Text('Tweak Areas'),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(9),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            color: Colors.grey.shade300,
          ),
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Showrooms(),
                ),
              );
            },
            title: Center(
              child: Text('Tweak Showrooms'),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(9),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            color: Colors.red.shade300,
          ),
          child: ListTile(
            onTap: () async {
              AuthServices().logout();
              Phoenix.rebirth(context);
            },
            title: Center(
              child: Text('Logout'),
            ),
          ),
        ),
      ],
    );
  }

  addAdminDialouge() {
    String email, password, name;
    showDialog(
      context: context,
      child: SimpleDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9),
        ),
        title: Center(child: Text('Add Admin')),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 9),
            child: TextField(
              onChanged: (value) {
                name = value;
              },
              maxLines: 1,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Full name',
                isDense: true,
                labelStyle: TextStyle(
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: 1.0,
                ),
                contentPadding: EdgeInsets.all(12),
                border: InputBorder.none,
                fillColor: Colors.grey.shade200,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                prefix: Icon(
                  MdiIcons.accountOutline,
                  color: Colors.red.shade300,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 9),
            child: TextField(
              onChanged: (value) {
                email = value;
              },
              maxLines: 1,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'email',
                isDense: true,
                labelStyle: TextStyle(
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: 1.0,
                ),
                contentPadding: EdgeInsets.all(12),
                border: InputBorder.none,
                fillColor: Colors.grey.shade200,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                prefix: Icon(
                  MdiIcons.accountOutline,
                  color: Colors.red.shade300,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 9),
            child: TextField(
              onChanged: (value) {
                password = value;
              },
              maxLines: 1,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                labelText: 'password',
                isDense: true,
                labelStyle: TextStyle(
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: 1.0,
                ),
                contentPadding: EdgeInsets.all(12),
                border: InputBorder.none,
                fillColor: Colors.grey.shade200,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                prefix: Icon(
                  MdiIcons.accountOutline,
                  color: Colors.red.shade300,
                ),
              ),
            ),
          ),
          Center(
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9),
              ),
              elevation: 0,
              color: Colors.red.shade300,
              child: Text('Confirm'),
              onPressed: () {
                Navigator.pop(context);
                AuthServices().addAdmin(email, password, name);
              },
            ),
          ),
        ],
      ),
    );
  }
}
