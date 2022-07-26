import 'package:dateen/constants/dimensions.dart';
import 'package:dateen/constants/global_variables.dart';
import 'package:dateen/features/home/screens/home_screen.dart';
import 'package:dateen/features/matches/screens/matches_screen.dart';
import 'package:dateen/features/messaging/screens/messages_screen.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  static const String routeName = '/actual-home';
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;
  double bottomNavBarWidth = Dimensions.width42;
  double bottomBorderWidth = Dimensions.width10 / 2;

  List<Widget> pages = [
    const HomeScreen(),
    const MatchesScreen(),
    const MessagesScreen(),
    const Center(child: Text('profile')),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final userCartLen = context.watch<UserProvider>().user.cart.length;
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 30,
        currentIndex: _page,
        // selectedItemColor: GlobalVariables.mainColor,
        // unselectedItemColor: Colors.grey.withOpacity(0.6),
        backgroundColor: const Color.fromRGBO(243, 243, 243, 1),
        iconSize: Dimensions.font10 * 3,
        onTap: updatePage,
        items: [
          //!HOME
          BottomNavigationBarItem(
            icon: _page == 0
                ? Image.asset('assets/navbar/home.png')
                : Image.asset('assets/navbar/unhome.png'),
            label: '',
          ),

          //! matches
          BottomNavigationBarItem(
            icon: _page == 1
                ? Image.asset('assets/navbar/matches.png')
                : Image.asset('assets/navbar/unmatches.png'),
            label: '',
          ),

          //! messages
          BottomNavigationBarItem(
            icon: _page == 2
                ? const Icon(
                    Icons.menu_sharp,
                    color: GlobalVariables.mainColor,
                  )
                : Icon(
                    Icons.wrap_text,
                    color: Colors.grey.withOpacity(0.9),
                  ),
            label: '',
          ),

          //! profile
          BottomNavigationBarItem(
            icon: _page == 3
                ? const Icon(
                    Icons.person,
                    color: GlobalVariables.mainColor,
                  )
                : Icon(
                    Icons.person,
                    color: Colors.grey.withOpacity(0.9),
                  ),
            label: '',
          ),
        ],
      ),
    );
  }
}
