
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:tiktok_clone_app/features/auth/screens/sing_up_screen.dart';

import 'features/home/screens/home_screen.dart';

final loggedOutRoute=RouteMap(
  routes: {
  '/':(_)=>const MaterialPage(child: SingUpScreen()),
  }
  );
final loggedInRoute=RouteMap(
  routes: {
  '/':(_)=>const MaterialPage(child: HomeScreen()),
  }
  );