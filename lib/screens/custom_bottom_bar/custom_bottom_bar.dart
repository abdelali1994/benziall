import 'package:ecommerce_with_admin_panel/screens/account_screen/account_screens.dart';
import 'package:ecommerce_with_admin_panel/screens/cart_screen/cart_screen.dart';
import 'package:ecommerce_with_admin_panel/screens/favourite_screen/favourite_screen.dart';
import 'package:ecommerce_with_admin_panel/screens/home/home.dart';
import 'package:ecommerce_with_admin_panel/screens/order_screen/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({final Key? key}) : super(key: key);
  // final BuildContext menuScreenContext;

  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
 final PersistentTabController _controller = PersistentTabController();
 final  bool _hideNavBar = false;

  // @override
  // void initState() {
  //   super.initState();
  //   _controller = PersistentTabController();
  //   _hideNavBar = false;
  // }

  List<Widget> _buildScreens() => [
        const Home(),
        const CartScreen(),
        const OrderScreen(),
        // const FavouriteScreen(),☻
        const AccountScreen(),
      ];

  List<PersistentBottomNavBarItem> _navBarsItems() => [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.home),
          inactiveIcon: const Icon(Icons.home_outlined),
          title: "Home",
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: Colors.white,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.shopping_cart),
          inactiveIcon: const Icon(Icons.shopping_cart_outlined),
          title: "Cart",
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: Colors.white,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.circle_rounded),
          inactiveIcon: const Icon(Icons.circle_outlined),
          title: "Orders",
          // icon: const Icon(Icons.favorite),
          // inactiveIcon: const Icon(Icons.favorite_outline),
          // title: "Favorite",
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: Colors.white,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.person),
          inactiveIcon: const Icon(Icons.person_outline),
          title: "Profile",
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: Colors.white,
        ),
        // PersistentBottomNavBarItem(
        //   icon: const Icon(Icons.settings),
        //   title: "Settings",
        //   activeColorPrimary: Colors.indigo,
        //   inactiveColorPrimary: Colors.grey,
        //   routeAndNavigatorSettings: RouteAndNavigatorSettings(
        //     initialRoute: "/",
        //     routes: {
        //       "/first": (final context) => const MainScreen2(),
        //       "/second": (final context) => const MainScreen3(),
        //     },
        //   ),
        // ),
      ];

  @override
  Widget build(final BuildContext context) => Scaffold(
        // appBar: AppBar(title: const Text("Navigation Bar Demo")),
        // drawer: Drawer(
        //   child: Center(
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: const <Widget>[
        //         Text("This is the Drawer"),
        //       ],
        //     ),
        //   ),
        // ),
        body: PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          resizeToAvoidBottomInset: true,
          navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
              ? 0.0
              : kBottomNavigationBarHeight,
          bottomScreenMargin: 0,

          backgroundColor: const Color.fromARGB(255, 12, 25, 36),
          hideNavigationBar: _hideNavBar,
          decoration: const NavBarDecoration(colorBehindNavBar: Colors.indigo),
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 400),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
          ),
          navBarStyle:
              NavBarStyle.style1, // Choose the nav bar style with this property
        ),
      );
}
