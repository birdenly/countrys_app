import 'package:f03_lugares/components/main_drawer.dart';
import 'package:f03_lugares/data/my_data.dart';
import 'package:f03_lugares/models/place.dart';
import 'package:flutter/material.dart';

class PlaceForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final idController = TextEditingController();
  final associatedController = TextEditingController();
  final nameController = TextEditingController();
  final imageController = TextEditingController();
  final recomendController = TextEditingController();
  final rateController = TextEditingController();
  final priceController = TextEditingController();
  late Place _newPlace = Place(
    id: '',
    paises: [],
    titulo: '',
    imagemUrl: '',
    recomendacoes: [],
    avaliacao: 0,
    custoMedio: 0,
  );
  var snackBar = SnackBar(
    content: Text('Lugar cadastrado com sucesso!'),
  );

  PlaceForm({super.key});

  @override
  Widget build(BuildContext context) {
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
                  labelText: 'ID do lugar',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'insira algum texto';
                  }
                  _newPlace.id = value;
                  return null;
                },
              ),
              TextFormField(
                controller: associatedController,
                decoration: InputDecoration(
                  labelText: 'Países associados ao lugar',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'insira algum texto';
                  }
                  _newPlace.paises = [value];
                  return null;
                },
              ),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Título',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'insira algum texto';
                  }
                  _newPlace.titulo = value;
                  return null;
                },
              ),
              TextFormField(
                controller: imageController,
                decoration: InputDecoration(
                  labelText: 'Imagem (URL)',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'insira algum texto';
                  }
                  if (!Uri.parse(value).isAbsolute) {
                    return 'insira uma URL funcional';
                  }
                  _newPlace.imagemUrl = value;
                  return null;
                },
              ),
              TextFormField(
                controller: recomendController,
                decoration: InputDecoration(
                  labelText: 'Lista de recomendações para o lugar',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'insira algum texto';
                  }
                  _newPlace.recomendacoes = [value];
                  return null;
                },
              ),
              TextFormField(
                controller: rateController,
                decoration: InputDecoration(
                  labelText: 'Avaliação do lugar (1-5)',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'insira algum texto';
                  }
                  _newPlace.avaliacao = double.parse(value);
                  return null;
                },
              ),
              TextFormField(
                controller: priceController,
                decoration: InputDecoration(
                  labelText: 'Custo médio de visita ao local',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'insira algum texto';
                  }
                  _newPlace.custoMedio = double.parse(value);
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    DUMMY_PLACES.add(_newPlace);
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
}
