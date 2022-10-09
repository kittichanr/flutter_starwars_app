import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starwars_app/src/app/app.dart';
import 'package:flutter_starwars_app/src/modules/home/data/repositories/starwars_repository.dart';
import 'package:flutter_starwars_app/src/modules/home/pages/bloc/starwars_bloc.dart';
import 'package:flutter_starwars_app/src/modules/home/widgets/avatar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return BlocProvider(
      create: (context) => StarwarsBloc(context.read<StarWarsRepository>())
        ..add(GetPeopleEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          actions: <Widget>[
            IconButton(
              key: const Key('homePage_logout_iconButton'),
              icon: const Icon(Icons.exit_to_app),
              onPressed: () =>
                  context.read<AppBloc>().add(AppLogoutRequested()),
            )
          ],
        ),
        body: Align(
          alignment: const Alignment(0, -1 / 3),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Avatar(photo: user.photo),
              const SizedBox(height: 4),
              Text(user.email ?? '', style: textTheme.headline6),
              const SizedBox(height: 4),
              Text(user.name ?? '', style: textTheme.headline5),
              BlocBuilder<StarwarsBloc, StarwarsState>(
                  builder: (context, state) {
                if (state.loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state.people != null) {
                  return Center(
                    child: Text(state.people?.name ?? ''),
                  );
                }
                return Container();
              })
            ],
          ),
        ),
      ),
    );
  }
}
