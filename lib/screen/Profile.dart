import 'dart:async';

import 'package:flutter/material.dart';
//import 'package:intl/date_symbol_data_local.dart';


class Profile extends StatefulWidget {
  @override
  Profile_State createState() => new Profile_State();
}

class Profile_State extends State<StatefulWidget> {
  static BuildContext context_global;

  static var _focusNode = new FocusNode();

  static final TextEditingController _location = new TextEditingController();
  static final TextEditingController _email = new TextEditingController();
  static final TextEditingController _official_email =
  new TextEditingController();
  static final TextEditingController _mob_no = new TextEditingController();
  static final TextEditingController _mob_no_alt = new TextEditingController();
  static final TextEditingController _year_of_joininig =
  new TextEditingController();
  static final TextEditingController _dob = new TextEditingController();

  static var gender_txt = '';
  static var department_txt = '';

  static var profile_name = "Raghav Taneja";

  static final profile = new Container(
    color: Colors.blue,
    height: 120.0,
    child: new Container(
      margin: new EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
      child: new Row(
        children: <Widget>[
          new CircleAvatar(
            backgroundImage: new AssetImage('assets/profile_pic.png'),
            radius: 50.0,
          ),
          new SizedBox(width: 5.0),
          new Text(profile_name,
              style: new TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontStyle: FontStyle.normal)),
        ],
      ),
    ),
  );

  static final gender = new Container(
    margin: new EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
    child: new Row(children: <Widget>[
      new Text("Gender",
          style: new TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontStyle: FontStyle.normal)),
      new SizedBox(width: 40.0),
      new DropdownButton<String>(
        hint: new Text("Select"),
        onChanged: (String gender) {
          setGender(gender);
        },
        items: dropdownMenuOptions,
      )
    ]),
  );

  static final List<String> _items = [
    'Male',
    'Female',
  ].toList();
  static final dropdownMenuOptions = _items
      .map((String item) =>
  new DropdownMenuItem<String>(
      value: item,
      child: new Text(item,
          style: new TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontStyle: FontStyle.normal))))
      .toList();

  static final List<String> _items_dep =
  ['BSG', 'IT', 'HR', 'Finance', 'Admin'].toList();
  static final dropdownMenuOptions_dep = _items_dep
      .map((String item) =>
  new DropdownMenuItem<String>(
      value: item,
      child: new Text(item,
          style: new TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontStyle: FontStyle.normal))))
      .toList();

  static final department = new Container(
    margin: new EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
    child: new Row(children: <Widget>[
      new Text("Department",
          style: new TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontStyle: FontStyle.normal)),
      new SizedBox(width: 20.0),
      new DropdownButton<String>(
        hint: new Text("Select"),
        onChanged: (String department) {
          setDepartment(department);
        },
        items: dropdownMenuOptions_dep,
      )
    ]),
  );

  static final location = new Container(
    margin: new EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
    child: new Row(children: <Widget>[
      new Text("Location",
          style: new TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontStyle: FontStyle.normal)),
      new SizedBox(width: 20.0),
      new Expanded(
        child: new TextField(
          controller: _location,
          decoration: new InputDecoration(hintText: "Enter Location"),
        ),
      )
    ]),
  );

  static final email = new Container(
    margin: new EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
    child: new Row(children: <Widget>[
      new Text("Personal Email Id",
          style: new TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontStyle: FontStyle.normal)),
      new SizedBox(width: 20.0),
      new Expanded(
        child: new TextField(
            controller: _email,
            decoration: new InputDecoration(hintText: "Enter Personal Email"),
            keyboardType: TextInputType.emailAddress),
      )
    ]),
  );

  static final official_email = new Container(
    margin: new EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
    child: new Row(children: <Widget>[
      new Text("Official Email Id",
          style: new TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontStyle: FontStyle.normal)),
      new SizedBox(width: 20.0),
      new Expanded(
        child: new TextField(
          controller: _official_email,
          decoration: new InputDecoration(hintText: "Enter Official Email"),
          keyboardType: TextInputType.emailAddress,
        ),
      )
    ]),
  );

  static final mob_no = new Container(
    margin: new EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
    child: new Row(children: <Widget>[
      new Text("Mobile Phone",
          style: new TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontStyle: FontStyle.normal)),
      new SizedBox(width: 20.0),
      new Expanded(
        child: new TextField(
          controller: _mob_no,
          decoration: new InputDecoration(hintText: "Enter Mobile no."),
          keyboardType: TextInputType.phone,
        ),
      )
    ]),
  );

  static final mob_no_alt = new Container(
    margin: new EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
    child: new Row(children: <Widget>[
      new Text("Alt Mobile Phone",
          style: new TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontStyle: FontStyle.normal)),
      new SizedBox(width: 20.0),
      new Expanded(
        child: new TextField(
          controller: _mob_no_alt,
          decoration: new InputDecoration(hintText: "Enter Alt Mobile no."),
          keyboardType: TextInputType.phone,
        ),
      )
    ]),
  );

  static final year_of_joining = new Container(
    margin: new EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
    child: new Row(children: <Widget>[
      new Text("Year Of Joining",
          style: new TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontStyle: FontStyle.normal)),
      new SizedBox(width: 20.0),
      new Expanded(
        child: new TextField(
          controller: _year_of_joininig,
          decoration: new InputDecoration(hintText: "Enter Year of Joining"),
          keyboardType: TextInputType.datetime,
        ),
      )
    ]),
  );

  /*final dob = new Container(
    margin: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
    child: new Row(children: <Widget>[
      new Text("Date Of Birth",
          style: new TextStyle(
              color: Colors.black,
              fontSize: 18.0,
              fontStyle: FontStyle.normal)),
      new SizedBox(width: 20.0),
      new Text('Date: ${_date.toString()}'),
      new RaisedButton(onPressed: () {
        _selectDate(context_global);
      })
    ]),
  );*/

  static DateTime _date = new DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime date_picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: new DateTime(2016),
        lastDate: new DateTime(2019));

    if (date_picked != null && date_picked != _date) {
      print('Date selected : ${_date.toString()}');
      setState(() {
        _date = date_picked;
      });
    }
  }

  static void setGender(String gender) {
    gender_txt = gender;
  }

  static void setDepartment(String department) {
    department_txt = department;
  }

  String getExact(int date){
    String day = "";
    if(date<10){
      day ="0"+ date.toString();
    }
    else{
      day = date.toString();
    }
    return day;
  }

  @override
  Widget build(BuildContext context) {
    /*  _focusNode.addListener((){
      if (!_focusNode.hasFocus) {
        // TextField has lost focus
        _selectDate(context);
      }
    });*/

    final title = 'Profile';
    return new Scaffold(
        backgroundColor: new Color(0xffEEEEEE),
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: new ListView(
          shrinkWrap: true,
          children: <Widget>[
            profile,
            gender,
            department,
            location,
            email,
            official_email,
            mob_no,
            mob_no_alt,
            year_of_joining,
            new Container(
              margin: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
              child: new Row(children: <Widget>[
                new Text("Date Of Birth",
                    style: new TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontStyle: FontStyle.normal)),
                new SizedBox(width: 20.0),
                new Text(getExact(_date.day)+"/"+getExact(_date.month)+"/"+_date.year.toString()
                    , style: new TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontStyle: FontStyle.normal)),
                new SizedBox(width: 15.0),
                new GestureDetector(
                  onTap: () {
                    _selectDate(context);
                  },
                  child:  new Icon(Icons.date_range),
                ),
              ]),
            )
          ],
        ),
        floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.save),
          backgroundColor: Colors.blue,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ));
  }
}

/*class Profile extends StatelessWidget {

  static final TextEditingController _location = new TextEditingController();
  static final TextEditingController _email = new TextEditingController();
  static final TextEditingController _official_email = new TextEditingController();
  static final TextEditingController _mob_no = new TextEditingController();
  static final TextEditingController _mob_no_alt = new TextEditingController();
  static final TextEditingController _year_of_joininig = new TextEditingController();
  static final TextEditingController _dob = new TextEditingController();

  static var gender_txt = '';
  static var department_txt = '';

  static var profile_name = "Raghav Taneja";

  static final profile = new Container(
    color: Colors.blue,
    height: 150.0,
    child: new Container(
      margin: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
      child: new Row(
        children: <Widget>[
          new CircleAvatar(
            backgroundImage: new AssetImage(
                'assets/profile_pic.png'),
            radius: 50.0,),
          new SizedBox(width: 10.0),
          new Text(profile_name, style: new TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontStyle: FontStyle.normal)),
        ],
      ),
    ),
  );

  static final gender = new Container(
    margin: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
    child: new Row(
        children: <Widget>[
          new Text("Gender",
              style: new TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontStyle: FontStyle.normal)),
          new SizedBox(width: 40.0),
          new DropdownButton<String>(
            hint: new Text("Select"),
            onChanged: (String gender) {
              setGender(gender);
            },
            items: dropdownMenuOptions,
          )
        ]
    ),
  );

  static final List<String> _items = ['Male', 'Female',].toList();
  static final dropdownMenuOptions = _items
      .map((String item) =>
  new DropdownMenuItem<String>(
      value: item,
      child: new Text(item,
          style: new TextStyle(
              color: Colors.black,
              fontSize: 18.0,
              fontStyle: FontStyle.normal)))
  ).toList();

  static final List<String> _items_dep = ['BSG', 'IT', 'HR', 'Finance', 'Admin']
      .toList();
  static final dropdownMenuOptions_dep = _items_dep
      .map((String item) =>
  new DropdownMenuItem<String>(
      value: item,
      child: new Text(item,
          style: new TextStyle(
              color: Colors.black,
              fontSize: 18.0,
              fontStyle: FontStyle.normal)))
  ).toList();

  static final department = new Container(
    margin: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
    child: new Row(
        children: <Widget>[
          new Text("Department",
              style: new TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontStyle: FontStyle.normal)),
          new SizedBox(width: 20.0),
          new DropdownButton<String>(
            hint: new Text("Select"),
            onChanged: (String department) {
              setDepartment(department);
            },
            items: dropdownMenuOptions_dep,
          )
        ]
    ),
  );

  static final location = new Container(
    margin: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
    child: new Row(
        children: <Widget>[
          new Text("Location",
              style: new TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontStyle: FontStyle.normal)),
          new SizedBox(width: 20.0),
          new Expanded(child: new TextField(controller: _location,
            decoration: new InputDecoration(
                hintText: "Enter Location"),),)
        ]
    ),
  );

  static final email = new Container(
    margin: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
    child: new Row(
        children: <Widget>[
          new Text("Personal Email Id",
              style: new TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontStyle: FontStyle.normal)),
          new SizedBox(width: 20.0),
          new Expanded(child: new TextField(controller: _email,
              decoration: new InputDecoration(
                  hintText: "Enter Personal Email"),
              keyboardType: TextInputType.emailAddress),)
        ]
    ),
  );

  static final official_email = new Container(
    margin: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
    child: new Row(
        children: <Widget>[
          new Text("Official Email Id",
              style: new TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontStyle: FontStyle.normal)),
          new SizedBox(width: 20.0),
          new Expanded(child: new TextField(controller: _official_email,
            decoration: new InputDecoration(
                hintText: "Enter Official Email"),
            keyboardType: TextInputType.emailAddress,),)
        ]
    ),
  );

  static final mob_no = new Container(
    margin: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
    child: new Row(
        children: <Widget>[
          new Text("Mobile Phone",
              style: new TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontStyle: FontStyle.normal)),
          new SizedBox(width: 20.0),
          new Expanded(child: new TextField(controller: _mob_no,
            decoration: new InputDecoration(
                hintText: "Enter Mobile no."),
            keyboardType: TextInputType.phone,
          ),)
        ]
    ),
  );

  static final mob_no_alt = new Container(
    margin: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
    child: new Row(
        children: <Widget>[
          new Text("Alt Mobile Phone",
              style: new TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontStyle: FontStyle.normal)),
          new SizedBox(width: 20.0),
          new Expanded(child: new TextField(controller: _mob_no_alt,
            decoration: new InputDecoration(
                hintText: "Enter Alt Mobile no."),
            keyboardType: TextInputType.phone,
          ),)
        ]
    ),
  );

  static final year_of_joining = new Container(
    margin: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
    child: new Row(
        children: <Widget>[
          new Text("Year Of Joining",
              style: new TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontStyle: FontStyle.normal)),
          new SizedBox(width: 20.0),
          new Expanded(child: new TextField(controller: _year_of_joininig,
            decoration: new InputDecoration(
                hintText: "Enter Year of Joining"),
            keyboardType: TextInputType.datetime,
          ),)
        ]
    ),
  );

  static final dob = new Container(
    margin: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
    child: new Row(
        children: <Widget>[
          new Text("Date Of Birth",
              style: new TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontStyle: FontStyle.normal)),
          new SizedBox(width: 20.0),
          new Text("Date Of Birth",
                        style: new TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontStyle: FontStyle.normal)),

        ]
    ),
  );

  @override
  Widget build(BuildContext context) {
    final title = 'Profile';
    return new Scaffold(
        backgroundColor: new Color(0xffEEEEEE),
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: new ListView(
          shrinkWrap: true,
          children: <Widget>[
            profile,
            gender,
            department,
            location,
            email,
            official_email,
            mob_no,
            mob_no_alt,
            year_of_joining,
            dob
          ],
        ),
        floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.save),
          backgroundColor: Colors.blue,
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
    );
  }

  static void setGender(String gender) {
    gender_txt = gender;
  }

  static void setDepartment(String department) {
    department_txt = department;
  }
}*/

class DropdownButtonGender extends StatefulWidget {
  DropdownButtonGender({Key key}) : super(key: key);

  @override
  _DropdownButtonGenderState createState() => new _DropdownButtonGenderState();
}

class _DropdownButtonGenderState extends State<DropdownButtonGender> {
  final List<String> _items = ['One', 'Two', 'Three', 'Four'].toList();

  String _selection;

  @override
  void initState() {
    _selection = _items.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dropdownMenuOptions = _items
        .map((String item) =>
    new DropdownMenuItem<String>(value: item, child: new Text(item)))
        .toList();

    return new Scaffold(
        body: new DropdownButton<String>(
            value: _selection,
            items: dropdownMenuOptions,
            onChanged: (s) {
              setState(() {
                _selection = s;
              });
            }));
  }
}
