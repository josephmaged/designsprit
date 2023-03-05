import 'package:designsprit/constants.dart';
import 'package:designsprit/features/home/presentation/widgets/banner_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsScreen extends StatelessWidget {

  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ItemCubit, ItemState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height - 300,
                        child: BannerItem(image: , name: ,),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: FloatingActionButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          elevation: 0,
                          mini: true,
                          backgroundColor: kPrimaryColor,
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                          child: const Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          item.name.toUpperCase(),
                          style: Theme.of(context).textTheme.headline4,
                          maxLines: 3,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          item.description,
                          maxLines: 100,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
