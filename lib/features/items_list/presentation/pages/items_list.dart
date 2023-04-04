import 'package:designsprit/core/utils/strings.dart';
import 'package:designsprit/core/widgets/custom_app_bar.dart';
import 'package:designsprit/features/items_list/presentation/cubit/items_list_cubit.dart';
import 'package:designsprit/features/items_list/presentation/widgets/items_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemsList extends StatelessWidget {
  final String categoryId;

  const ItemsList({Key? key, required this.categoryId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemsListCubit, ItemsListState>(
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            titleName: AppStrings.itemsList,
            listOfActions: [],
          ),
          body: BlocBuilder<ItemsListCubit, ItemsListState>(
            builder: (context, state) {
              return const ItemsListView();
            },
          ),
        );
      },
    );
  }
}
