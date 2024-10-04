import 'package:flutter/material.dart';
import 'package:futurelabinterviewapp/repository/getshop_data_provider.dart';
import 'package:futurelabinterviewapp/screens/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ShopListNotifier>(
            create: (context) => ShopListNotifier())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
