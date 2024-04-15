import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:trivia_quiz_app/view/base/base_viewmodel.dart';

abstract class BaseView<T extends BaseViewModel> extends StatelessWidget {
  const BaseView({super.key});

  @protected
  T vmR(BuildContext context) => context.read<T>();

  @protected
  T vmW(BuildContext context) => context.watch<T>();
}
