import 'package:flutter/material.dart';
import 'package:wiwa_chat/Model/countryModel.dart';

class CountryLists extends StatefulWidget {
  const CountryLists({Key key, this.setCountryData}) : super(key: key);
  final Function setCountryData;

  @override
  _CountryListsState createState() => _CountryListsState();
}

class _CountryListsState extends State<CountryLists> {
  List<CountryModel> countryModel = [
    CountryModel(name: "Nigeria", code: "+234", flag: "🇳🇬"),
    CountryModel(name: "India", code: "+91", flag: "🇮🇳"),
    CountryModel(name: "United States", code: "+1", flag: "🇺🇸"),
    CountryModel(name: "South Africa", code: "+27", flag: "🇿🇦"),
    CountryModel(name: "United Kingdom", code: "+44", flag: "🇬🇧"),
    CountryModel(name: "Italy", code: "+39", flag: "🇮🇹"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.teal,
            )),
        title: Text(
          "Choose a country",
          style: TextStyle(
            color: Colors.teal,
            fontWeight: FontWeight.w500,
            fontSize: 18,
            wordSpacing: 1,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.teal,
            ),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: countryModel.length,
          itemBuilder: (context, index) => countryCard(countryModel[index])),
    );
  }

  Widget countryCard(CountryModel country) {
    return InkWell(
      onTap: () {
        widget.setCountryData(country);
      },
      child: Card(
        margin: EdgeInsets.all(0.15),
        child: Container(
          height: 60,
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 5,
          ),
          child: Row(
            children: [
              Text(country.flag),
              SizedBox(
                width: 15,
              ),
              Text(country.name),
              Expanded(
                child: Container(
                  width: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(country.code),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
