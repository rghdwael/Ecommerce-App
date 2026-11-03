import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation_practice/models/user_data.dart';
import 'package:navigation_practice/pages/home.dart';
import 'package:navigation_practice/pages/login.dart';
import 'package:navigation_practice/pages/main_screen.dart';
import 'package:navigation_practice/pages/products.dart';
import 'package:navigation_practice/pages/profile.dart';
import 'package:navigation_practice/pages/signup.dart';

GoRouter createRouter(UserData userData)
{
  return GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) {
          return Login(userData:userData);
        },
      ),
      GoRoute(
          path: '/signup',
          builder: (context, state) => Signup(userData:userData)),

      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainScreen(
            navigationShell: navigationShell,
            userData: userData,
          );
        },
        branches: [
          StatefulShellBranch(routes: [
            GoRoute(
              path: "/home",
              builder: (context, state) {
                return HomePage(userData:userData);
              },
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: "/product",
              builder: (context, state) => ProductPage(),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: "/profile",
              builder: (context, state) {
                return ProfilePage(userData:userData);
              },
            ),
          ]),
        ],
      ),
    ],
    errorBuilder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: Center(
            child: const Text(
              "Page Not Found",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          elevation: 10,
        ),
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [],
            ),
          ),
        ),
      );
    },
  );

}