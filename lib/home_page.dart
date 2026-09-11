import 'package:api_bloc/bloc/quotes_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
   BlocProvider.of<QuotesBloc>(context).add(GetQuotes());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quotes App'),
        backgroundColor: Colors.amberAccent,
      ),
      body: BlocBuilder<QuotesBloc,QuotesState>(
        builder: (context,state){
          if(state is QuotesLoadingState){
            return Center(child: CircularProgressIndicator());
          } else if(state is QuotesLoadedState){
            var mQuotesData = state.resData;
             return ListView.builder(
               itemCount: mQuotesData.quotes.length,
               itemBuilder: (_,index){
                 var eachQuote = mQuotesData.quotes[index];
                 return Padding(
                   padding: EdgeInsets.all(8),
                   child: Card(
                     elevation: 2,
                     child: ListTile(
                       title: Text(eachQuote.quote),
                       subtitle: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           SizedBox(height: 10,),
                           Text(eachQuote.author),
                         ],
                       ),
                     ),
                   ),
                 );
               },
             );
          } else if(state is QuotesErrorState){
            return Center(child: Text('Error: ${state.error}'),);
          }
          return Container();
        },
      ),
    );
  }
}
