import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_starwars_app/src/modules/home/data/models/people.dart';
import 'package:flutter_starwars_app/src/modules/home/data/models/peoples.dart';

class PeopleDetail extends StatelessWidget {
  PeopleDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final people = ModalRoute.of(context)!.settings.arguments as Results;
    print(people.toJson());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: Column(
        children: [
          Container(
            child: Text(people.name ?? ''),
          ),
        ],
      ),
    );
  }
}
