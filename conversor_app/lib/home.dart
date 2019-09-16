import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class Home extends StatefulWidget {
  double _valorDolar = 4.2;
  final _real = {
    'flag': "🇧🇷",
    'simbolo': 'R\$',
    'color': Colors.green[100],
  };
  final _dolar = {
    'flag': "🇺🇸",
    'simbolo': "\$",
    'color': Colors.blue[100],
  };

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, dynamic> moedaBase = Map();
  Map<String, dynamic> moedaConversao = Map();
  MoneyMaskedTextController inputController;
  MoneyMaskedTextController resultadoController;

  @override
  void initState() {
    super.initState();

    moedaBase = widget._real;
    moedaConversao = widget._dolar;

    inputController = MoneyMaskedTextController(
      decimalSeparator: ",",
      thousandSeparator: ".",
    );
    resultadoController = MoneyMaskedTextController(
      decimalSeparator: ",",
      thousandSeparator: '.',
      initialValue: 0.00,
    );
  }

  _alteraMoedaBase() {
    if (moedaBase == widget._real) {
      setState(() {
        moedaBase = widget._dolar;
        moedaConversao = widget._real;
      });
    } else {
      setState(() {
        moedaBase = widget._real;
        moedaConversao = widget._dolar;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: moedaBase['color'],
      appBar: AppBar(
        title: Text("conversor"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    moedaBase['flag'],
                    style: TextStyle(fontSize: 60),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.swap_horiz,
                      color: Colors.black45,
                    ),
                    iconSize: 50,
                    onPressed: _alteraMoedaBase,
                  ),
                  Text(
                    moedaConversao['flag'],
                    style: TextStyle(fontSize: 60),
                  ),
                ],
              ),
              TextField(
                controller: inputController,
                decoration: InputDecoration(
                  prefix: Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(moedaBase['simbolo']),
                  ),
                  labelText: "Valor",
                ),
                onChanged: (_){
                  _converter();
                },
                keyboardType: TextInputType.number,
              ),
              Icon(
                Icons.swap_vert,
                size: 50,
                color: Colors.black12,
              ),
              TextField(
                controller: resultadoController,
                decoration: InputDecoration(
                    prefix: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Text(moedaConversao['simbolo']),
                    ),
                    labelText: "Valor convertido"),
                enabled: false,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _converter();
        },
        child: Icon(Icons.autorenew),
      ),
    );
  }

  void _converter() {
    double valorBase = inputController.numberValue;
    double valorConvertido;
    if (moedaBase == widget._real) {
      valorConvertido = valorBase / widget._valorDolar;
    } else {
      valorConvertido = valorBase * widget._valorDolar;
    }
    resultadoController.updateValue(valorConvertido);
  }
}
