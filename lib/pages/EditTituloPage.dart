
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../models/titulo.dart';
import '../repository/times_repository.dart';

class EditTituloPage extends StatefulWidget {
  Titulo titulo;
  EditTituloPage({super.key, required this.titulo});

  @override
  State<EditTituloPage> createState() => _EditTituloPageState();
}

class _EditTituloPageState extends State<EditTituloPage> {
  final _campeonatoController = TextEditingController();
  final _anoController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _campeonatoController.text = widget.titulo.campeonato;
    _anoController.text = widget.titulo.ano;
  }

  editar() {
    Provider.of<TimesRepository>(context, listen: false).editTitulo(
        titulo: widget.titulo,
        campeonato: _campeonatoController.text,
        ano: _anoController.text);

    Navigator.pop(context);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar Título"),
        backgroundColor: Colors.grey[800],
        actions: [IconButton(onPressed: editar, icon: Icon(Icons.check))],
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
            ],
        ),

      ),


    );
  }
}
