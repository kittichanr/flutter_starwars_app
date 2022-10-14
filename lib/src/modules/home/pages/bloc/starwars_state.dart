part of 'starwars_bloc.dart';

class StarwarsState extends Equatable {
  final Peoples? peoples;
  final People? people;
  final bool loading;
  final String? errorMessage;

  StarwarsState({
    this.peoples,
    this.people,
    this.loading = false,
    this.errorMessage,
  });

  StarwarsState copyWith({
    Peoples? peoples,
    People? people,
    bool? loading,
    String? errorMessage,
  }) {
    return StarwarsState(
        people: people ?? this.people,
        peoples: peoples ?? this.peoples,
        loading: loading ?? this.loading,
        errorMessage: errorMessage ?? this.errorMessage);
  }

  @override
  List<Object> get props => [peoples ?? {}, people ?? [], loading];
}
