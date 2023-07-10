import 'package:brasileirao_curso/Widgets/brasao.dart';
import 'package:brasileirao_curso/pages/time_page.dart';
import 'package:brasileirao_curso/repository/times_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/home_controller.dart';
import '../models/times.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controller = HomeController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Brasileirão 2023',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Consumer<TimesRepository>(
        builder: (context, repositorio, child) {
          return ListView.separated(
              itemCount: repositorio.times.length,
              itemBuilder: (BuildContext ctx, int time) {
                List<Time> tabela = repositorio.times;
                return ListTile(
                  leading: Brasao(
                    image: tabela[time].brasao,
                    width: 40,
                  ),
                  title: Text(tabela[time].nome),
                  subtitle: Text("Titulos: ${tabela[time].titulos.length}"),
                  trailing: Text(tabela[time].pontos.toString(),
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (_) =>
                            TimePage(
                              key: Key(tabela[time].nome),
                              time: tabela[time],)
                    ));
                  },
                );
              },
              separatorBuilder: (_, __) => const Divider(),
              padding: const EdgeInsets.all(16),
          );
        },
      ),
    );
  }
}
