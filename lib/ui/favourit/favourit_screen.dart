import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/favourite/bloc/favourite_bloc.dart';
import '../../model/favourite_model.dart';

class FavouritScreen extends StatefulWidget {
  const FavouritScreen({super.key});

  @override
  State<FavouritScreen> createState() => _FavouritScreenState();
}

class _FavouritScreenState extends State<FavouritScreen> {
  @override
  @override
  void initState() {
    super.initState();
    context.read<FavouriteBloc>().add(FavourititemEvent());
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Favourit"),
          centerTitle: true,
        ),
        body: BlocBuilder<FavouriteBloc, FavouriteState>(
          builder: (context, state) {
            switch (state.listStatus) {
              case ListStatus.loading:
                return Center(
                  child: CircularProgressIndicator(),
                );
              case ListStatus.success:
                return ListView.builder(
                    itemCount: state.favouritlist.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Container(
                          height: 80,
                          // color: Colors.cyan,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    "Item ${state.favouritlist[index].value.toString()}"),
                                GestureDetector(
                                    onTap: () {
                                      print(
                                          '${state.favouritlist[index].value.toString()}');
                                      FavouriteItemModel favouriteItemModel =
                                          FavouriteItemModel(
                                              id: state.favouritlist[index]
                                                  .toString(),
                                              value: state
                                                  .favouritlist[index].value
                                                  .toString(),
                                              isfavouirt: state
                                                      .favouritlist[index]
                                                      .isfavouirt
                                                  ? false
                                                  : true);

                                      context.read<FavouriteBloc>().add(
                                          FavourititemsEvent(
                                              item: favouriteItemModel));
                                    },
                                    child: Icon(
                                        state.favouritlist[index].isfavouirt
                                            ? Icons.favorite
                                            : Icons.favorite_border_outlined))
                              ],
                            ),
                          ),
                        ),
                      );
                    });

              case ListStatus.failure:
                return Center(
                  child: Text("somthing went wrong"),
                );
              // TODO: Handle this case.
            }

            //       // TODO: Handle this case.
            //     }
            //   },
            // );
          },
        ));
  }
}
