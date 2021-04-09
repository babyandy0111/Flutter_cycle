import 'package:flutter/material.dart';

Widget searchBar(TextEditingController searchController) {
  return Padding(
      padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(Icons.search_rounded),
          filled: true,
          fillColor: Color.fromRGBO(255, 242, 241, 1),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
        ),
      ));
}
