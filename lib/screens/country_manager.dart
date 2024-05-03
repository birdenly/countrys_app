import 'package:f03_lugares/components/main_drawer.dart';
import 'package:f03_lugares/data/my_data.dart';
import 'package:f03_lugares/models/country.dart';
import 'package:f03_lugares/models/favorite.dart';
import 'package:f03_lugares/models/place.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountryManager extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final associatedController = TextEditingController();
  final idController = TextEditingController();
  final nameController = TextEditingController();
  CountryManager({super.key});

  late Country _newCountry = Country(
    id: '',
    title: '',
  );
  var snackBar = SnackBar(
    content: Text('Lugar cadastrado com sucesso!'),
  );

  @override
  Widget build(BuildContext context) {
    final country = context.watch<Country>().getList();

    Widget _add() {
      return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          title: Text('Formulário de Lugar'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                TextFormField(
                  controller: idController,
                  decoration: InputDecoration(
                    labelText: 'ID do pais',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'insira algum texto';
                    }
                    _newCountry.id = value;
                    return null;
                  },
                ),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Nome do pais',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'insira algum texto';
                    }
                    _newCountry.title = value;
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      DUMMY_COUNTRIES.add(_newCountry);
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil('/', (route) => false);
                    }
                  },
                  child: Text('Salvar'),
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget _edit(int indexATUAL) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Edição do pais ${country[indexATUAL].title}"),
        ),
        drawer: MainDrawer(),
        body: Container(
          child: ListView(
            children: <Widget>[
              TextField(
                controller: idController,
                decoration: InputDecoration(
                  labelText: 'ID do pais',
                  hintText: country[indexATUAL].id,
                ),
                onChanged: (value) {
                  country[indexATUAL].id = value;
                },
              ),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Título',
                  hintText: country[indexATUAL].title,
                ),
                onChanged: (value) {
                  country[indexATUAL].title = value;
                },
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Edição Completa')));
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/', (route) => false);
                },
                child: Text('Salvar'),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          title: Text('Editor de Países'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  height: 400,
                  color: Colors.amber,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: country.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        child: ListTile(
                          title: Text(country[index].title),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      builder: (_) {
                                        return _edit(index);
                                      });
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  // Provider.of<Place>(context, listen: false)
                                  //     .removePlace(index.toString());
                                  context
                                      .read<Country>()
                                      .removeCountry(country[index].id);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            Text('Lugar removido com sucesso')),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (_) {
                  return _add();
                });
          },
          child: Icon(Icons.add),
        ));
  }
}
