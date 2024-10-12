import 'package:flutter/material.dart';
import 'package:brincando/views/login.page.dart';
import 'package:brincando/views/welcome.page.dart';
import 'package:brincando/views/home.page.dart';
import 'package:brincando/views/control.page.dart';
import 'package:brincando/widgets/navigation_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Home App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.transparent,
        useMaterial3: true,
      ),
      initialRoute: '/welcome',
      routes: {
        '/login': (context) => SafeArea(child: LoginPage()),
        '/welcome': (context) => WelcomePage(),
        '/': (context) => MainNavigationPage(),
      },
    );
  }
}

class MainNavigationPage extends StatefulWidget {
  @override
  _MainNavigationPageState createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    ControlPage(),
    Placeholder(), // Página de configurações (a ser implementada)
    Placeholder(), // Página de perfil (a ser implementada)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          // TODO: Adicione aqui a lógica para navegar para diferentes rotas, se necessário
        },
      ),
    );
  }
}