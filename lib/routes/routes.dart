import 'package:common/common.dart';
import 'package:common/di/injection.dart';
import 'package:common/utils/route_key.dart';
import 'package:flutter/widgets.dart';
import 'package:home/cubit/example_cubit.dart';
import 'package:home/pages/home_page.dart';

final routes = <String, Widget Function(BuildContext)>{
  RouteKey.root: (context) => BlocProvider(
        create: (context) => getIt<ExampleCubit>()..getExample(),
        child: const HomePage(),
      )
};
