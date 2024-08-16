import 'package:blockprec/bloc/Todo/bloc/to_do_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Flexible(child:
              BlocBuilder<ToDoBloc, ToDoState>(builder: (context, state) {
            if (state.tolist.length == 0) {
              return Center(
                child: Text('No Todo Found'),
              );
            } else {
              return ListView.builder(
                itemCount: state.tolist.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      tileColor: const Color.fromARGB(137, 194, 186, 186),
                      leading: Text("${state.tolist[index]}"),
                      trailing: GestureDetector(
                          onTap: () {
                            context.read<ToDoBloc>().add(RemoveToDoEvents(
                                task: "${state.tolist[index]}"));

                            print("index : ${index}");
                          },
                          child: Icon(Icons.delete)),
                    ),
                  );
                },
              );
            }
          })),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for (int i = 1; i < 15; i++) {
            context.read<ToDoBloc>().add(AddToDoEvents(task: "$i"));
          }
        },
        child: Center(
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
