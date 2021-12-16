import 'package:flutter/material.dart';
import 'package:recipes_app/components/main_drawer.dart';
import 'package:recipes_app/models/settins.dart';

class SettingsScreen extends StatefulWidget {
  final Function(Settings) onSettingsChange;
  final Settings settings;

  const SettingsScreen(this.onSettingsChange, this.settings);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  late Settings settings;

  @override
  void initState(){
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChange(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Configurações'),
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Configurações',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _createSwitch(
                    'Sem Glúten',
                    'Só exibe refeições sem glúten',
                    settings.isGlutenFree,
                    (value) => setState(() => settings.isGlutenFree = value),
                  ),
                  _createSwitch(
                    'Sem Lactose',
                    'Só exibe refeições lactose',
                    settings.isLactoseFree,
                    (value) => setState(() => settings.isLactoseFree = value),
                  ),
                  _createSwitch(
                    'Vegetariana',
                    'Só exibe refeições vegetarianas',
                    settings.isVegetarian,
                    (value) => setState(() => settings.isVegetarian = value),
                  ),
                  _createSwitch(
                    'Vegana',
                    'Só exibe refeições veganas',
                    settings.isVegan,
                    (value) => setState(() => settings.isVegan = value),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
