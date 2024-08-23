import 'package:blockprec/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../bloc/post/bloc/bloc/post_bloc.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    context.read<PostBloc>().add(PostFetch());
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Post Screen"),
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          switch (state.postStatus) {
            case PostStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case PostStatus.faillure:
              return Center(
                child: Text(state.message),
              );
            case PostStatus.success:
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        suffixIcon: state.searchmessage.isNotEmpty
                            ? GestureDetector(
                                onTap: () {
                                  _searchController.clear();
                                  context
                                      .read<PostBloc>()
                                      .add(SearchItem(searchItem: ''));
                                },
                                child: const Icon(Icons.close_outlined),
                              )
                            : null,
                        border: const OutlineInputBorder(),
                        hintText: 'Search With Title',
                      ),
                      onChanged: (value) {
                        context
                            .read<PostBloc>()
                            .add(SearchItem(searchItem: value));
                        print(value);
                      },
                    ),
                  ),
                  const Gap(10),
                  Expanded(
                    child: state.searchmessage.isNotEmpty
                        ? Center(
                            child: Text(state.searchmessage),
                          )
                        : ListView.builder(
                            itemCount: state.searchpostList.isEmpty
                                ? state.postList.length
                                : state.searchpostList.length,
                            itemBuilder: (context, index) {
                              final itemList = state.searchpostList.isEmpty
                                  ? state.postList[index]
                                  : state.searchpostList[index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  tileColor:
                                      const Color.fromARGB(31, 244, 230, 230),
                                  leading: Text('${itemList.id}'),
                                  title: Text('${itemList.title}'),
                                  subtitle: Text('${itemList.body}'),
                                ),
                              );
                            },
                          ),
                  ),
                ],
              );
            default:
              return const Center(
                child: Text('Unknown state'),
              );
          }
        },
      ),
    );
  }
}
