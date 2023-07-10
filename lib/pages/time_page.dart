import 'package:flutter/material.dart';
import 'package:brasileirao_curso/models/times.dart';
import 'package:get/get.dart';

import '../Widgets/brasao.dart';
import '../models/titulo.dart';
import 'EditTituloPage.dart';
import 'add_titulo_page.dart';

class TimePage extends StatefulWidget {
  Time time;
  TimePage({super.key, required this.time});

  @override
  State<TimePage> createState() => _TimePageState();
}


class _TimePageState extends State<TimePage> {


  tituloAddPage() {
    Navigator.push(context, MaterialPageRoute(
        builder: (_) => AddTituloPage(time: widget.time),
      ),
    );
  }




  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: widget.time.cor,
          title: Text(widget.time.nome),
          actions: [
            IconButton(
              onPressed: () {tituloAddPage();},
              icon: Icon(Icons.add),
            ),],
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.stacked_line_chart),
                text: 'Estatísticas',
              ),
              Tab(
                icon: Icon(Icons.emoji_events),
                text: 'Títulos',
              ),
            ],
          ),

        ),
        body: TabBarView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Brasao(
                      image: widget.time.brasao,
                      width: 250,
                    ),
                    ),
                  Text(widget.time.pontos.toString(),
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              titulos(),
            ] ),
        ),
    );
  }

  Widget titulos() {
    final quantidade = widget.time.titulos.length;

    return quantidade == 0
        ? Center(
            child: Text('Nenhum título conquistado'),
                 )
        : ListView.separated(
            itemBuilder: (BuildContext context, int indice) {
              return ListTile(
            leading: Icon(Icons.emoji_events),
            title: Text(widget.time.titulos[indice].campeonato),
            trailing: Text(widget.time.titulos[indice].ano.toString()),
           onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (_) => EditTituloPage(
                    titulo: widget.time.titulos[indice],
                  ),
                fullscreenDialog: true,
              ));
           },
            );
        },
            separatorBuilder: (_, __) => const Divider(),
            itemCount: quantidade,);

  }
  
  
  
  
  
}

