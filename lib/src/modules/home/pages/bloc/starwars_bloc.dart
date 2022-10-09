import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_starwars_app/src/modules/home/data/models/people.dart';
import 'package:flutter_starwars_app/src/modules/home/data/repositories/starwars_repository.dart';

part 'starwars_event.dart';
part 'starwars_state.dart';

class StarwarsBloc extends Bloc<StarwarsEvent, StarwarsState> {
  final StarWarsRepository _starwarsRepository;

  StarwarsBloc(this._starwarsRepository)
      : super(StarwarsState(
          people: null,
          loading: false,
          errorMessage: null,
        )) {
    on<GetPeopleEvent>((event, emit) async {
      emit(StarwarsState(loading: true));
      try {
        final people = await _starwarsRepository.getPeople();
        emit(StarwarsState(people: people, loading: false));
      } catch (e) {
        emit(StarwarsState(errorMessage: e.toString(), loading: false));
      }
    });
  }
}
