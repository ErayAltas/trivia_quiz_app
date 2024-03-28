import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:trivia_quiz_app/models/category.dart';
import 'package:trivia_quiz_app/ui/widgets/quiz_options.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  _categoryPressed(BuildContext context, Category category) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return QuizOptionsDialog(category: category);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('OpenTrivia'), elevation: 0),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(10.0),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).size.width > 1000
                    ? 7
                    : MediaQuery.of(context).size.width > 600
                        ? 5
                        : 3,
                childAspectRatio: 1.2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  Category category = categories[index];
                  return CategoryCard(
                    category: category,
                    onPressed: () => _categoryPressed(context, category),
                  );
                },
                childCount: categories.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final Category category;
  final Function()? onPressed;
  const CategoryCard({super.key, required this.category, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 1.0,
      highlightElevation: 1.0,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      color: category.color,
      textColor: category.color!.computeLuminance() > 0.5 ? Colors.black : Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(category.icon, size: 30),
          const SizedBox(height: 8),
          AutoSizeText(
            category.name,
            minFontSize: 10.0,
            textAlign: TextAlign.center,
            maxLines: 3,
            wrapWords: false,
          ),
        ],
      ),
    );
  }
}
