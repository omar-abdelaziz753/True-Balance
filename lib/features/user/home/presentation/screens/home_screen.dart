import 'package:flutter/material.dart';
import 'package:truee_balance_app/core/extensions/navigation_extension.dart';
import 'package:truee_balance_app/core/routing/app_router.dart';
import 'package:truee_balance_app/core/routing/routes_name.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Scaffold(
                    appBar: AppBar(
                      leading: IconButton(
                        onPressed: () {
                          context.pushNamed(Routes.mainLayoutScreen, arguments: 3);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
            child: Text('Go')),
      ),
    );
  }
}
