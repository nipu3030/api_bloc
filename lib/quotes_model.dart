class DataModel{
  int limit;
  int total;
  int skip;
  List<QuotesModel> quotes;

  DataModel({
    required this.limit,
    required this.quotes,
    required this.skip,
    required this.total
});

  factory DataModel.fromJson(Map<String,dynamic> json){

    List<QuotesModel> mQuotes = [];
    for(Map<String,dynamic> eachQuote in json['quotes']){
      var eachModel = QuotesModel.fromJson(eachQuote);
      mQuotes.add(eachModel);
    }

    return DataModel(
        limit: json['limit'],
        quotes: mQuotes,
        skip: json['skip'],
        total: json['total']);
  }
}



class QuotesModel {
  String quote;
  String author;
  int id;

  QuotesModel({
    required this.id,
    required this.author,
    required this.quote
  });

  factory QuotesModel.fromJson(Map<String, dynamic> json){
    return QuotesModel(
        id: json['id'],
        author: json['author'],
        quote: json['quote']);
  }
}