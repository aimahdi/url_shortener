import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:url_shortener/screens/url_shortener_state.dart';

class URLShortenerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<URLShortenerState>(context, listen: true);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(32),
          width: double.infinity,
          child: Column(
            children: [
              Spacer(),
              Text(
                'URL Shortener',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.deepPurple[600],
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Shorten your long url quickly',
              ),
              SizedBox(
                height: 32,
              ),
              TextField(
                controller: state.urlController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.transparent)),
                    filled: true,
                    fillColor: Colors.grey[200],
                    hintText: 'Paste the link'),
              ),
              SizedBox(
                height: 16,
              ),
              if (state.shortStatus)
                Center(
                  child: CircularProgressIndicator(),
                ),
              if (!state.shortStatus)
                Builder(
                  builder: (context) => GestureDetector(
                      onTap: () {
                        if (state.isShortened)
                          Clipboard.setData(
                                  ClipboardData(text: state.shortUrlMessage))
                              .whenComplete(() => ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      content: Text('Link is copied'))));
                      },
                      child: Text(state.shortUrlMessage)),
                ),
              SizedBox(
                height: 8,
              ),
              Spacer(),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    state.handleGetLinkButton();
                  },
                  child: Text(
                    'GET LINK',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
