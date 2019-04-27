import 'package:arcbuck/view/resources/styles.dart';
import 'package:arcbuck/view/widget/home_sliver.dart';
import 'package:flutter/material.dart';

enum BottomNavMenu { home, settings }

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  BottomNavMenu _selectedItem = BottomNavMenu.home;
  final _pageController = PageController(keepPage: true);

  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: _buildBody(context, theme),
      bottomNavigationBar: _buildBottomNavigation(context),
      floatingActionButton: _buildFloatActionButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildFloatActionButton(BuildContext context) {
    return Container(
      width: 72.0,
      height: 72.0,
      margin: const EdgeInsets.only(top: 20),
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        border: new Border.all(
          color: Theme
              .of(context)
              .accentColor
              .withAlpha(25),
          width: 8.0,
        ),
      ),
      child: new RawMaterialButton(
        shape: new CircleBorder(),
        elevation: 0.0,
        fillColor: Theme
            .of(context)
            .accentColor,
        child: Icon(
            Icons.add
        ),
        onPressed: () {},
      ),
    );
  }

  Widget _buildBottomNavigation(BuildContext context) {
    var accentColor = Theme
        .of(context)
        .accentColor;

    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            Styles.shadowStyle
          ]
      ),
      child: BottomAppBar(
        child: Container(
            height: 46.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _buildBottomNavigationItems(context)
            )
        ),
      ),
    );
  }

  Widget _buildSettingsIcon(BuildContext context)
  {
    var accentColor = Theme
        .of(context)
        .accentColor;

    var color = _selectedItem == BottomNavMenu.settings ? accentColor : Colors.grey;

    return IconButton(
        icon: Icon(Icons.settings),
        color: color,
        onPressed: _onSettingsPressed);
  }

  Widget _buildHomeIcon(BuildContext context)
  {
    var accentColor = Theme
        .of(context)
        .accentColor;

    var color = _selectedItem == BottomNavMenu.home ? accentColor : Colors.grey;

    return IconButton(icon: Icon(Icons.home), color:  color, onPressed: _onHomePressed);
  }

  Widget _buildBody(BuildContext context, ThemeData theme) {
    return PageView(
      controller: _pageController,
      children: [
        HomeSliver(),
        Center(child: Text("Settings"))
      ],
    );
  }

  List<Widget> _buildBottomNavigationItems(BuildContext context) {
    return [
      _buildHomeIcon(context),
      _buildSettingsIcon(context)
    ];
  }

  void _onHomePressed() {
    //setState(() {
      //_selectedItem = BottomNavMenu.home;
      _pageController.animateToPage(0,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeOutQuad
      );
   // });
  }

  void _onSettingsPressed() {
    //setState(() {
      //_selectedItem = BottomNavMenu.settings;
      _pageController.animateToPage(1,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOutQuad
      );
    //});
  }
}

