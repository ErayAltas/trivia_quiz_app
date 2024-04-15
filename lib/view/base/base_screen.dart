import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trivia_quiz_app/view/base/base_viewmodel.dart';

abstract class BaseScreen<T extends BaseViewModel> extends StatelessWidget {
  const BaseScreen({super.key, this.params});
  final dynamic params;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) {
        final vm = createViewModel(context);
        vm.initContext(context);
        return vm;
      },
      lazy: setLazyInit,
      builder: (BuildContext context, Widget? child) => buildScreen(context),
    );
  }

  @protected
  Widget buildScreen(BuildContext context);

  @protected
  dynamic get args => params ?? {};

  @protected
  T createViewModel(BuildContext context);

  @protected
  bool get setLazyInit => false;

  @protected
  T vmR(BuildContext context) => context.read<T>();

  @protected
  T vmW(BuildContext context) => context.watch<T>();
}
