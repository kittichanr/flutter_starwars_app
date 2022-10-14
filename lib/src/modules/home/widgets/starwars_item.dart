import 'package:flutter/material.dart';
import 'package:flutter_starwars_app/src/modules/home/data/models/people.dart';
import 'package:flutter_starwars_app/src/modules/home/data/models/peoples.dart';
import 'package:flutter_starwars_app/src/modules/home/pages/people_detail_page.dart';

class StarwarsItem extends StatelessWidget {
  final Results results;

  const StarwarsItem(this.results);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PeopleDetail(),
            // Pass the arguments as part of the RouteSettings. The
            // DetailScreen reads the arguments from these settings.
            settings: RouteSettings(
              arguments: results,
            ),
          ),
        );
      },
      child: Container(
          height: 50,
          child: Center(
            child: Text(
              results.name ?? '',
            ),
          )),
    );
  }
}
