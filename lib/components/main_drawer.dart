import 'package:flutter/material.dart';
import 'package:recipes_app/utils/app_routes.dart';

class MainDrawer extends StatelessWidget {
  Widget _createItem(IconData icon, String label, Function onTap) {
    return ListTile(
      onTap: () => onTap(),
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        label,
        style: TextStyle(
            fontFamily: 'RoboyoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.bottomRight,
            height: 130,
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              vertical: 30,
              horizontal: 20,
            ),
            color: Theme.of(context).accentColor,
            child: Text(
              'Vamos Cozinhar?',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Colors.white),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          _createItem(Icons.restaurant, 'Refeições',
              () => Navigator.of(context).pushReplacementNamed(AppRoutes.HOME)),
          _createItem(Icons.settings, 'Configurações',
              () => Navigator.of(context).pushReplacementNamed(AppRoutes.SETTINGS)),
        ],
      ),
    );
  }
}
