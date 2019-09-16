import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final _real = {
    'flag': "🇧🇷",
    'simbolo': 'R\$',
  };
  final _dolar = {
    'flag': "🇺🇸",
    'simbolo': "\$",
  };

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, dynamic> moedaBase = Map();
  Map<String, dynamic> moedaConversao = Map();

  @override
  void initState() {
    super.initState();

    moedaBase = widget._real;
    moedaConversao = widget._dolar;
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
      appBar: AppBar(
        title: Text("conversor"),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 100),
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
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefix: Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Text(moedaBase['simbolo']),
                ),
                labelText: "Valor",
              ),
              keyboardType: TextInputType.number,
            ),
            Icon(
              Icons.swap_vert,
              size: 50,
              color: Colors.black12,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.autorenew),
      ),
    );
  }
}
