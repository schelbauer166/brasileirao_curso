import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/times.dart';
import '../models/titulo.dart';
import '../repository/times_repository.dart';

class AddTituloPage extends StatefulWidget {
  Time time;
  AddTituloPage({super.key, required this.time});

  @override
  State<AddTituloPage> createState() => _AddTituloPageState();
}

class _AddTituloPageState extends State<AddTituloPage> {
  final _campeonatoController = TextEditingController();
  final _anoController = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  save() {
    var titulo = Titulo(
      campeonato: _campeonatoController.text,
      ano: _anoController.text,
    );
    var time = widget.time;
    Provider.of<TimesRepository>(context, listen: false).addTitulo(time, titulo);
    Navigator.pop(context);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Título adicionado com sucesso!'),
        duration: Duration(seconds: 2),
      ),
    );

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Adicionar Título")
      ),
      body: Form(
        key: _formKey,
        child: Column (
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(24),
              child: TextFormField(
                controller: _anoController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Ano',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if(value != null && value.isEmpty) {
                    return 'Informe o ano';
                  }
                  return null;
                },
              )
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                child: TextFormField(
                  controller: _campeonatoController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Campeonato',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if(value != null && value.isEmpty) {
                      return 'Informe o campeonato';
                    }
                    return null;
                  },
                ),
            ),
            Expanded(child: Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.all(24),
              child: ElevatedButton(
                onPressed: () {
                  if(_formKey.currentState!.validate()) {
                    save();
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text('Salvar',
                        style: TextStyle(fontSize: 20,)),
                    ),
                  ],
                )
              ),
            ),
            ),
          ]
        ),

      ),


    );
  }
}
