import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart' show Consumer;
import 'package:niku/namespace.dart' as n;
import 'package:riverpod_context/riverpod_context.dart' show RiverpodContext;

import 'package:flutterfly/modules/material/providers/material_provider.dart';

class DrawerMenu extends StatelessWidget {

  const DrawerMenu({super.key});

  @override
  Widget build(context) => Drawer(
    child: n.Column([
      const Spacer(flex: 2),
      Consumer(builder: (_, ref, __) => DrawerHeader(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ref.watch(materialProvider)
              ? 'assets/aqua-light.png'
              : 'assets/aqua-black.png'
            ),
            fit: BoxFit.scaleDown
          )
        ),
        child: Container()
      )),
      const Spacer(flex: 1),
      n.ListTile()
        ..leading = n.Icon(Icons.home_outlined)
        ..title = 'Home'.n
        ..onTap = () => Navigator.of(context).pushNamed('/'),
      n.ListTile()
        ..leading = n.Icon(Icons.store_outlined)
        ..title = 'Store'.n
        ..onTap = () => Navigator.of(context).pushNamed('/store'),
      const Spacer(flex: 8),
      n.ListTile()
        ..leading = n.Icon(Icons.color_lens_outlined)
        ..title = 'Change Color Mode'.n
        ..onTap = context.read(materialProvider.notifier).toggle,
      const Spacer(flex: 15),
      Consumer(builder: (_, ref, __) => n.Image.asset(ref.watch(materialProvider)
        ? 'assets/brandwhite.png'
        : 'assets/brand.png')
          ..width = 250.0
          ..height = 75.0
      )
    ])
  );
}