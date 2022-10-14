import 'dart:developer';
import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_starwars_app/src/modules/home/data/models/people.dart';
import 'package:flutter_starwars_app/src/app/repositories/starwars_repository.dart';
import 'package:flutter_starwars_app/src/modules/home/data/models/peoples.dart';

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
    on<GetPeoplesEvent>((event, emit) async {
      emit(state.copyWith(loading: true));
      try {
        var response = await _starwarsRepository.getPeoples(
            state.peoples == null
                ? 'https://swapi.dev/api/people/?page=1'
                : state.peoples!.next.toString());

        print('test123${state.peoples?.next.toString()}');

        final peoples = Peoples(
          count: response.count,
          next: response.next,
          previous: response.previous,
          results: state.peoples == null
              ? []
              : List.of(state.peoples!.results as List<Results>)
            ..addAll(response.results as List<Results>),
        );

        emit(state.copyWith(peoples: peoples, loading: false));
      } catch (e) {
        emit(state.copyWith(errorMessage: e.toString(), loading: false));
      }
    });
  }
}
