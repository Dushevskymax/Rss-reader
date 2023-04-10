import 'package:flutter/material.dart';
import 'package:rss_reader/pages/home.dart';
import 'package:rss_reader/pages/loading.dart';
import 'package:rss_reader/pages/webview.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const Loading(url: 'https://habr.com/ru/rss/all/all/'),
      '/home': (context) => const Home(),
      '/webview': (context) => const WebViewScreen(),
    }
  )
);
}

