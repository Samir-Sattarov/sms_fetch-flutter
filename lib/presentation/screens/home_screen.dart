import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sms/sms.dart';

import '../cubit/sms/sms_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Read SMS Inbox"),
          backgroundColor: Colors.redAccent,
        ),
        body: BlocBuilder<SmsCubit, List<SmsMessage>>(
          bloc: BlocProvider.of<SmsCubit>(context)..getAllSMS(),
          builder: (context, state) {
            if (state.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              final data = state;
              return RefreshIndicator(
                onRefresh: () async =>
                    BlocProvider.of<SmsCubit>(context).getAllSMS(),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ...List.generate(data.length, (index) {
                        return Card(
                          child: ListTile(
                            leading: const Icon(Icons.message),
                            title: Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 10, top: 10),
                              child: Text(data[index].address),
                            ), // printing address
                            subtitle: Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 10, top: 10),
                              child: Text(
                                "${data[index].date}\n${data[index].body}",
                              ),
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              );
            }
          },
        ));
  }
}
