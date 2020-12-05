import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class DataScreah extends SearchDelegate<String> {
  final options = [
    "legs",
    "rice",
    "maggi",
    "Basmoti Rice",
    "Brown rice",
    "Tomato sauce",
    "Mustard",
    "Red-wine vinegar",
    "Hot pepper sauce",
    "Frozen shrimp"
  ];
  final recentlySearch = [
    "Brown rice",
    "Tomato sauce",
    "Mustard",
    "Red-wine vinegar",
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = " ";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
   //show some result based  on the selection

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    final suggestionList = query.isEmpty ? recentlySearch : options.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: (){
          
        },
        leading: Icon(Icons.food_bank),
        title: suggestionList[index].text.make(),
      ),
      itemCount: suggestionList.length,
    );
  }
}
