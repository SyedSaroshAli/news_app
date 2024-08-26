import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class ArtcileView extends StatelessWidget {
  final String url;
  const ArtcileView({super.key,
  required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Stack(
          children: [
            Center(
            child: const Row(
              mainAxisSize: MainAxisSize.min,
             children: [
              Text('Flutter'),
              Text('News',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),),
             ],
            ),
          ),
        ]
        ),
        elevation: 0,
      ),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: url,
      )
      );
    
  }
}