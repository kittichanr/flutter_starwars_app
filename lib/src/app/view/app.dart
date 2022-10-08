import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starwars_app/src/app/bloc/app_bloc.dart';
import 'package:flutter_starwars_app/src/app/routes/routes.dart';
import 'package:flutter_starwars_app/src/core/theme.dart';
import 'package:flutter_starwars_app/src/modules/auth/repositories/authentication_repository.dart';

class App extends StatelessWidget {
  const App(
      {super.key, required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository;

  final AuthenticationRepository _authenticationRepository;

  @override
  Widget build(BuildContext context) {
    final appBloc = BlocProvider<AppBloc>(
      create: (BuildContext context) =>
          AppBloc(authenticationRepository: _authenticationRepository),
    );

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthenticationRepository>(
            create: (context) => _authenticationRepository),
      ],
      child: MultiBlocProvider(
        providers: [appBloc],
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
