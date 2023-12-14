import 'package:common/common.dart';
import 'package:common/utils/extension/exception_ext.dart';
import 'package:flutter/material.dart';
import 'package:home/cubit/example_cubit.dart';
import 'package:common/utils/utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ExampleCubit, ExampleState>(
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
              children: [Text('${val.example.id}'), Text(val.example.name)],
            ),
            loading: (value) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
