part of 'starwars_bloc.dart';

abstract class StarwarsEvent extends Equatable {
  const StarwarsEvent();

  @override
  List<Object> get props => [];
}

class GetPeopleEvent extends StarwarsEvent {}
