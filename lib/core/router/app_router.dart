// import 'package:flutter/material.dart';

// import '../../screens/add_habit_screen.dart';
// import '../../screens/habit_list_screen.dart';

// class AppRouterDelegate extends RouterDelegate<RouteSettings>
//     with ChangeNotifier, PopNavigatorRouterDelegateMixin<RouteSettings> {
//   final GlobalKey<NavigatorState> navigatorKey;

//   RouteSettings? _currentRoute;

//   AppRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

//   @override
//   RouteSettings? get currentConfiguration => _currentRoute;

//   void _handleRouteChange(RouteSettings route) {
//     _currentRoute = route;
//     notifyListeners();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Navigator(
//       key: navigatorKey,
//       pages: [
//         const MaterialPage(child: HabitListScreen()),
//         if (_currentRoute?.name == '/add-habit')
//           MaterialPage(child: AddHabitScreen(), key: ValueKey('AddHabitScreen')),
//       ],
//       onPopPage: (route, result) {
//         if (!route.didPop(result)) {
//           return false;
//         }
//         _currentRoute = null;
//         notifyListeners();
//         return true;
//       },
//     );
//   }

//   @override
//   Future<void> setNewRoutePath(RouteSettings configuration) async {
//     _currentRoute = configuration;
//   }
// }

// class AppRouteInformationParser extends RouteInformationParser<RouteSettings> {
//   @override
//   Future<RouteSettings> parseRouteInformation(
//       RouteInformation routeInformation) async {
//     final uri = Uri.parse(routeInformation.location ?? '');
//     if (uri.pathSegments.isEmpty) {
//       return RouteSettings(name: '/');
//     }

//     if (uri.pathSegments.length == 1 && uri.pathSegments[0] == 'add-habit') {
//       return RouteSettings(name: '/add-habit');
//     }

//     return RouteSettings(name: '/');
//   }

//   @override
//   RouteInformation? restoreRouteInformation(RouteSettings configuration) {
//     if (configuration.name == '/') {
//       return RouteInformation(location: '/');
//     }
//     if (configuration.name == '/add-habit') {
//       return RouteInformation(location: '/add-habit');
//     }
//     return null;
//   }
// }
