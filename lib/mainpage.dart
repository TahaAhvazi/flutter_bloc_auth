import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/auth/auth_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                context.read<AuthBloc>().add(UserLoggedOut());
              },
              icon: Icon(Icons.abc_outlined))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Text("HEEEEEEEEEEEEELO"),
          ],
        ),
      ),
    );
  }
}
