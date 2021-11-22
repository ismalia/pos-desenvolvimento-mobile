import 'package:flutter/material.dart';

void main() {
  runApp(DivideConta());
}

class DivideConta extends StatefulWidget {
  @override
  _DivideContaState createState() => _DivideContaState();
}

class _DivideContaState extends State<DivideConta> {
  final TextEditingController _partialAccountValue = TextEditingController();
  final TextEditingController _numberOfPeople = TextEditingController();
  final TextEditingController _waiterComissionPercentage = TextEditingController();

  var waiterComissionText = "";
  var totalPerPersonText = "";
  var totalAccountValueText = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: 
      Scaffold(
        appBar: AppBar(title: const Text("Divide Conta"),),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15), 
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Valor total da conta"),
                controller: _partialAccountValue,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Quantidade de pessoas"),
                controller: _numberOfPeople,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Comissão pelo serviço (%)"),
                controller: _waiterComissionPercentage,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: ElevatedButton(
                onPressed: calculateAccountDivision,
                child: const Text("Dividir"),
              ),
            ),
            Text(waiterComissionText),
            Text(totalPerPersonText),
            Text(totalAccountValueText),
          ],)
        )
      )
    );
  }
  
  calculateAccountDivision() {
    setState(() {
      double partialAccountValue = double.parse(_partialAccountValue.text);
      int numberOfPeople = int.parse(_numberOfPeople.text);
      double waiterComissionPercentage = double.parse(_waiterComissionPercentage.text);

      double waiterComission = partialAccountValue * waiterComissionPercentage / 100;
      double totalAccountValue = partialAccountValue + waiterComission;
      double totalPerPerson = totalAccountValue / numberOfPeople;

      waiterComissionText = "Referemte ao garçom: " + waiterComission.toString();
      totalPerPersonText = "Total para cada pessoa:  " + totalPerPerson.toString();
      totalAccountValueText = "Valor total a pagar: " + totalAccountValue.toString();
    });
  }
}