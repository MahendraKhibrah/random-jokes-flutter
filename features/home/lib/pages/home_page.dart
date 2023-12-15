import 'package:common/common.dart';
import 'package:common/utils/extension/exception_ext.dart';
import 'package:flutter/material.dart';
import 'package:common/utils/utils.dart';
import 'package:home/cubit/jokes_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<JokesCubit, JokesState>(
          listener: (context, state) {
            state.maybeMap(
                orElse: () {},
                error: (e) =>
                    Utils.showSnackBar(context, e.exception.getMessage));
          },
          builder: (context, state) {
            return state.maybeMap(
              orElse: () => const SizedBox(),
              success: (val) => Column(
                children: [
                  Text('${val.joke.setup}'),
                  Text('${val.joke.punchline}'),
                  ButtonBar(
                    children: [
                      TextButton(
                        onPressed: () => context.read<JokesCubit>().getJoke(),
                        child: const Text('Get Joke'),
                      ),
                    ],
                  )
                ],
              ),
              loading: (value) => const Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ),
    );
  }
}
