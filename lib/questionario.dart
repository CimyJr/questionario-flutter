import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';


class Questionario extends StatelessWidget {
  const Questionario(
      {super.key,
      required this.perguntas,
      required this.perguntaSelecionada,
      required this.responder});
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function() responder;

  /*Questionario({super.key, 
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.responder,
    })*/

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]['resposta'] as List<String>
        : [];
    return Column(
      children: [
        Questao(perguntas[perguntaSelecionada]['texto'] as String),
        ...respostas.map((t) => Resposta(t, responder)).toList(),
      ],
    );
  }
}