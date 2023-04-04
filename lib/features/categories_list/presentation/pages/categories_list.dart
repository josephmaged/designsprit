import 'package:designsprit/features/categories_list/presentation/widgets/categories_listview.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CategoriesListView(),
    );
  }
}
