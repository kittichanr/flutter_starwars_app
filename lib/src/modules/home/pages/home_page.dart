import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starwars_app/src/app/app.dart';
import 'package:flutter_starwars_app/src/app/repositories/starwars_repository.dart';
import 'package:flutter_starwars_app/src/modules/home/data/models/peoples.dart';
import 'package:flutter_starwars_app/src/modules/home/pages/bloc/starwars_bloc.dart';
import 'package:flutter_starwars_app/src/modules/home/widgets/avatar_widget.dart';
import 'package:flutter_starwars_app/src/modules/home/widgets/starwars_item.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  static Page<void> page() => MaterialPage<void>(child: HomePage());

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _controller = ScrollController();

  @override
  initState() {
    super.initState();
    getPeoples();
    _controller.addListener(() async {
      if (_controller.position.pixels >= _controller.position.maxScrollExtent &&
          !context.read<StarwarsBloc>().state.loading) {
        getPeoples();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _controller.removeListener(getPeoples);
  }

  Future getPeoples() async {
    context.read<StarwarsBloc>().add(GetPeoplesEvent());
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final user = context.select((AppBloc bloc) => bloc.state.user);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: <Widget>[
          IconButton(
            key: const Key('homePage_logout_iconButton'),
            icon: const Icon(Icons.exit_to_app),
            onPressed: () => context.read<AppBloc>().add(AppLogoutRequested()),
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
            BlocBuilder<StarwarsBloc, StarwarsState>(builder: (context, state) {
              if (state.loading &&
                  state.peoples != null &&
                  state.peoples!.results!.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state.peoples != null && state.peoples!.results!.isNotEmpty) {
                return LimitedBox(
                  maxHeight: 600,
                  child: ListView.separated(
                    itemBuilder: (context, index) =>
                        StarwarsItem(state.peoples!.results![index]),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 20),
                    itemCount: state.peoples!.results!.length,
                    controller: _controller,
                  ),
                );
              }
              return Container();
            })
          ],
        ),
      ),
    );
  }
}
