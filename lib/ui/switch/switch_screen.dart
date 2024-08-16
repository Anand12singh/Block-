// ignore_for_file: prefer_const_constructors

import 'package:blockprec/bloc/switch/bloc/switch_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({super.key});

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Notification",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                BlocBuilder<SwitchBloc, SwitchState>(
                  buildWhen: (previous, current) =>
                      previous.isswitch != current.isswitch,
                  builder: (context, state) {
                    return Switch(
                      value: state.isswitch,
                      onChanged: (newval) {
                        context
                            .read<SwitchBloc>()
                            .add(EnableOrDisableNotification());
                      },
                    );
                  },
                )
              ],
            ),
            Gap(20),
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return Container(
                  height: 200,
                  color: Colors.red.withOpacity(state.slider),
                );
              },
            ),
            Gap(20),
            BlocBuilder<SwitchBloc, SwitchState>(
              buildWhen: (previous, current) =>
                  previous.slider != current.slider,
              builder: (context, state) {
                return Slider(
                  value: state.slider,
                  onChanged: (value) {
                    print(value);
                    context.read<SwitchBloc>().add(SliderEvent(slider: value));
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
