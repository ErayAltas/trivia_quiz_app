// import 'package:flutter/material.dart';
// import 'package:podo_mobile/views/base/base_screen.dart';
// import 'package:podo_mobile/views/base/base_viewmodel.dart';

// mixin BaseLoadingMixin<T extends BaseViewModel> on BaseScreen {
//   final ValueNotifier<bool> _isLoading = ValueNotifier<bool>(true);

//   void changeLoadingState(bool isLoading) {
//     _isLoading.value = isLoading;
//   }

//   @override
//   Widget buildScreen(BuildContext context) {
//     return buildBaseWidget(context);
//   }

//   Widget buildBaseWidget(BuildContext context) {
//     return Stack(
//       children: [
//         buildContentWidget(context),
//         ValueListenableBuilder<bool>(
//           valueListenable: _isLoading,
//           builder: (context, value, child) {
//             if (value) {
//               return ColoredBox(
//                 color: Colors.grey.withOpacity(0.5),
//                 child: const Center(child: CircularProgressIndicator()),
//               );
//             }
//             return const SizedBox.shrink();
//           },
//           child: const SizedBox.shrink(),
//         ),
//       ],
//     );
//   }
// }
