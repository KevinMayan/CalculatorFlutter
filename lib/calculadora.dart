import 'package:flutter/material.dart';

class CalculadoraStatefulWidget extends StatefulWidget {
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<CalculadoraStatefulWidget> {
  var _displayText = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minha calculadora do amor!"),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.all(16),
              child: Text(
                "$_displayText",
                style: TextStyle(fontSize: 48),
              ),
            )),
            Row(
              children: [
                criarBotao("1/x"),
                criarBotao("x²"),
                criarBotao("%"),
                criarBotao("C"),
                criarBotao("/"),
              ],
            ),
            Row(
              children: [
                criarBotao("7"),
                criarBotao("8"),
                criarBotao("9"),
                criarBotao("*"),
              ],
            ),
            Row(
              children: [
                criarBotao("4"),
                criarBotao("5"),
                criarBotao("6"),
                criarBotao("-"),
              ],
            ),
            Row(
              children: [
                criarBotao("1"),
                criarBotao("2"),
                criarBotao("3"),
                criarBotao("+"),
              ],
            ),
            Row(
              children: [
                criarBotao("+/-"),
                criarBotao("0"),
                criarBotao(","),
                criarBotao("="),
              ],
            )
          ],
        ),
      ),
    );
  }

  void calcular() {
    setState(() {
      _displayText = "Eita, não sei calcular ainda!";
    });
  }

  void clickBotao(String textoBotao) {
    setState(() {
      //_displayText = "Dimmy apertou $textoBotao";
      switch (textoBotao) {
        case 'C':
          _displayText = "0";
          break;
        case "*":
        case "/":
        case "+":
        case "-":
          _displayText += ' $textoBotao ';
          break;
        case "=":
          calcular();
          break;
        default:
          if (_displayText == "0") {
            _displayText = "";
          }
          _displayText += textoBotao;
          break;
      }
    });
  }

  Widget criarBotao(String textoBotao) {
    return Expanded(
        child: Padding(
      padding: EdgeInsets.all(4),
      child: ElevatedButton(
          onPressed: () => clickBotao(textoBotao),
          child: Text(
            textoBotao,
            style: TextStyle(fontSize: 32),
          )),
    ));
  }
}
