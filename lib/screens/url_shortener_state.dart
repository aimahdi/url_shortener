import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/url_shortener_response.dart';

class URLShortenerState extends ChangeNotifier {
  final urlController = TextEditingController();

  String shortUrlMessage = "Give some long url to convert";

  bool shortStatus = false;
  bool isShortened = false;

  handleGetLinkButton() async {
    final longUrl = urlController.text;

    shortStatus = true;
    notifyListeners();

    final String shortUrl = await getShortLink(longUrl);

    shortUrlMessage = shortUrl;
    shortStatus = false;
    isShortened = true;
    notifyListeners();
  }

  Future<String> getShortLink(String longUrl) async {
    var url = Uri.parse("https://cleanuri.com//api/v1/shorten");
    final result = await http
        .post(url, body: {"url": longUrl});

    if(result.statusCode == 200){
      print('Successfully Completed');

      final response = urlShortenerResponseFromJson(result.body);
      return response.resultUrl;
    }else{
      print('Error in API');
      print(result.body);
      return "There is some error in shortening the url";
    }
  }
}
