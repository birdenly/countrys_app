import 'package:f03_lugares/components/main_drawer.dart';
import 'package:f03_lugares/data/my_data.dart';
import 'package:f03_lugares/models/favorite.dart';
import 'package:f03_lugares/models/place.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlaceManager extends StatelessWidget {
  final associatedController = TextEditingController();
  final idController = TextEditingController();
  final nameController = TextEditingController();
  final imageController = TextEditingController();
  final recomendController = TextEditingController();
  final rateController = TextEditingController();
  final priceController = TextEditingController();

  PlaceManager({super.key});

  @override
  Widget build(BuildContext context) {
    final places = context.watch<Place>().getList();

    Widget _edit(int indexATUAL) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Edição do lugar ${places[indexATUAL].titulo}"),
        ),
        drawer: MainDrawer(),
        body: Container(
          child: ListView(
            children: <Widget>[
              TextField(
                controller: idController,
                decoration: InputDecoration(
                  labelText: 'ID do lugar',
                  hintText: places[indexATUAL].id,
                ),
                onChanged: (value) {
                  places[indexATUAL].id = value;
                },
              ),
              TextField(
                controller: associatedController,
                decoration: InputDecoration(
                  labelText: 'Países associados ao lugar',
                  hintText: places[indexATUAL].paises.join(', '),
                ),
                onChanged: (value) {
                  places[indexATUAL].paises = [value];
                },
              ),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Título',
                  hintText: places[indexATUAL].titulo,
                ),
                onChanged: (value) {
                  places[indexATUAL].titulo = value;
                },
              ),
              TextField(
                controller: imageController,
                decoration: InputDecoration(
                  labelText: 'Imagem (URL)',
                  hintText: places[indexATUAL].imagemUrl,
                ),
                onChanged: (value) {
                  places[indexATUAL].imagemUrl = value;
                },
              ),
              TextField(
                controller: recomendController,
                decoration: InputDecoration(
                  labelText: 'Lista de recomendações para o lugar',
                  hintText: places[indexATUAL].recomendacoes.join(', '),
                ),
                onChanged: (value) {
                  places[indexATUAL].recomendacoes = [value];
                },
              ),
              TextField(
                controller: rateController,
                decoration: InputDecoration(
                  labelText: 'Avaliação do lugar (1-5)',
                  hintText: places[indexATUAL].avaliacao.toString(),
                ),
                onChanged: (value) {
                  places[indexATUAL].avaliacao = double.parse(value);
                },
              ),
              TextField(
                controller: priceController,
                decoration: InputDecoration(
                  labelText: 'Custo médio de visita ao lugar',
                  hintText: places[indexATUAL].custoMedio.toString(),
                ),
                onChanged: (value) {
                  places[indexATUAL].custoMedio = double.parse(value);
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
        title: Text('Editor de lugares'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 500,
            color: Colors.amber,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: places.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  child: ListTile(
                    title: Text(places[index].titulo),
                    subtitle: Text(places[index].recomendacoes.join(', ')),
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
                            context.read<Place>().removePlace(places[index].id);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text('Lugar removido com sucesso')),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )),
    );
  }
}
