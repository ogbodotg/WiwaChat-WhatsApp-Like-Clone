import 'package:flutter/material.dart';
import 'package:wiwa_chat/Model/countryModel.dart';
import 'package:wiwa_chat/Pages/countryPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String countryName = "Nigeria";
  String countryCode = "+234";
  TextEditingController _phoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Enter Phone Number",
            style: TextStyle(
              color: Colors.teal,
              fontWeight: FontWeight.w700,
              fontSize: 18,
              wordSpacing: 1,
            )),
        centerTitle: true,
        actions: [
          Icon(
            Icons.more_vert,
            color: Colors.black,
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Text(
              "Wiwa will send an sms to verifiy your phone number",
              style: TextStyle(
                fontSize: 13.5,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Phone Number",
              style: TextStyle(
                fontSize: 12,
                color: Colors.purpleAccent,
              ),
            ),
            SizedBox(height: 15),
            countryCard(),
            SizedBox(height: 15),
            phoneNumber(),
            Expanded(child: Container()),
            InkWell(
              onTap: () {
                if (_phoneNumber.text.length < 11) {
                  showErrorDialog();
                } else {
                  showMyDialog();
                }
              },
              child: Container(
                  color: Colors.purpleAccent[400],
                  height: 40,
                  width: 70,
                  child: Center(
                      child: Text("Proceed",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          )))),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget countryCard() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (builder) => CountryLists(
                      setCountryData: setCountryData,
                    )));
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        padding: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.teal,
              width: 1.8,
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                child: Center(
                  child: Text(
                    countryName,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            Icon(
              Icons.arrow_drop_down,
              color: Colors.teal,
              size: 28,
            )
          ],
        ),
      ),
    );
  }

  void setCountryData(CountryModel countryModel) {
    setState(() {
      countryName = countryModel.name;
      countryCode = countryModel.code;
    });
    Navigator.pop(context);
  }

  Widget phoneNumber() {
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      height: 38,
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Container(
            width: 70,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.teal,
                  width: 1.8,
                ),
              ),
            ),
            child: Row(
              children: [
                Text("+",
                    style: TextStyle(
                      fontSize: 18,
                    )),
                SizedBox(
                  width: 10,
                ),
                Text(countryCode.substring(1),
                    style: TextStyle(
                      fontSize: 15,
                    )),
              ],
            ),
          ),
          SizedBox(
            width: 30,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.teal,
                  width: 1.8,
                ),
              ),
            ),
            width: MediaQuery.of(context).size.width / 1.5 - 100,
            child: TextFormField(
              controller: _phoneNumber,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(8),
                hintText: "Phone Number",
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> showMyDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Lets verify your phone number",
                      style: TextStyle(fontSize: 14)),
                  SizedBox(height: 10),
                  Text(countryCode + " " + _phoneNumber.text,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                  SizedBox(height: 10),
                  Text(
                      "Would you like to correct your number, if not just proceed",
                      style: TextStyle(fontSize: 13))
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Edit"),
              ),
              TextButton(
                onPressed: () {},
                child: Text("OK"),
              ),
            ],
          );
        });
  }

  Future<void> showErrorDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Oops! Looks like you didn't enter your phone number",
                      style: TextStyle(fontSize: 13))
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {},
                child: Text("OK"),
              ),
            ],
          );
        });
  }
}
