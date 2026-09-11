import 'package:api_bloc/api_helper.dart';
import 'package:api_bloc/bloc/quotes_bloc.dart';
import 'package:api_bloc/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: BlocProvider(
        create: (_) => QuotesBloc(apiHelper: ApiHelper()),
        child: HomePage(),
      ),
    );
  }
}

