import 'package:flutter/material.dart';
import 'package:flutter_starwars_app/src/modules/home/data/models/peoples.dart';

class StarwarsItem extends StatelessWidget {
  final Results results;

  const StarwarsItem(this.results);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            height: 50,
            child: Text(
              results.name ?? '',
            )));
  }
}
