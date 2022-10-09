import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starwars_app/src/app/bloc/app_bloc.dart';
import 'package:flutter_starwars_app/src/app/routes/routes.dart';
import 'package:flutter_starwars_app/src/core/theme.dart';
import 'package:flutter_starwars_app/src/modules/auth/data/repositories/authentication_repository.dart';
import 'package:flutter_starwars_app/src/modules/home/data/repositories/starwars_repository.dart';
import 'package:flutter_starwars_app/src/modules/home/pages/bloc/starwars_bloc.dart';

class App extends StatelessWidget {
  const App(
      {super.key, required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository;

  final AuthenticationRepository _authenticationRepository;

  @override
  Widget build(BuildContext context) {
    final appBloc = BlocProvider<AppBloc>(
        create: (BuildContext context) =>
            AppBloc(authenticationRepository: _authenticationRepository));

    final starwarsBloc = BlocProvider<StarwarsBloc>(
        create: (BuildContext context) => StarwarsBloc(StarWarsRepository()));

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthenticationRepository>(
            create: (context) => _authenticationRepository),
        RepositoryProvider<StarWarsRepository>(
            create: (context) => StarWarsRepository()),
      ],
      child: MultiBlocProvider(
        providers: [appBloc, starwarsBloc],
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: FlowBuilder<AppStatus>(
        state: context.select((AppBloc bloc) => bloc.state.status),
        onGeneratePages: onGenerateAppViewPages,
      ),
    );
  }
}
