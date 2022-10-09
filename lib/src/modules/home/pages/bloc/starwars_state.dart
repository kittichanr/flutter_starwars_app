part of 'starwars_bloc.dart';

class StarwarsState extends Equatable {
  final People? people;
  final bool loading;
  final String? errorMessage;

  StarwarsState({
    this.people,
    this.loading = false,
    this.errorMessage,
  });

  StarwarsState copyWith(
    People? people,
    bool? loading,
    String? errorMessage,
  ) {
    return StarwarsState(
        people: people ?? this.people,
        loading: loading ?? this.loading,
        errorMessage: errorMessage ?? this.errorMessage);
  }

  @override
  List<Object> get props => [people ?? [], loading];
}
