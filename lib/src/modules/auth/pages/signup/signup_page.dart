import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starwars_app/src/modules/auth/pages/signup/cubit/signup_cubit.dart';
import 'package:flutter_starwars_app/src/modules/auth/data/repositories/authentication_repository.dart';
import 'package:flutter_starwars_app/src/modules/auth/widgets/signup_form.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SignUpPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocProvider<SignupCubit>(
          create: (_) => SignupCubit(context.read<AuthenticationRepository>()),
          child: const SignUpForm(),
        ),
      ),
    );
  }
}
