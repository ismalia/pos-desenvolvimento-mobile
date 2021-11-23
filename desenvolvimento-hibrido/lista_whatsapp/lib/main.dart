import 'package:flutter/material.dart';
import 'second_page.dart';

void main() {
  runApp(ListaWhatsapp());
}

class ListaWhatsapp extends StatelessWidget {
  String personIcon = "images/person-icon.png";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Lista de Whatsapp"),
        ),
        body: ListView(
          children: [
            Builder(
              builder: (context) => 
                ListTile(
                  leading: Image.asset(personIcon),
                  title: const Text("Laura Azevedo"),
                  subtitle: const Text("(17) 7054-5831"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondPage("Laura Azevedo"),
                      ),
                    );
                  },
                ),
            ),
            Builder(
              builder: (context) =>
                ListTile(
                  leading: Image.asset(personIcon),
                  title: const Text("João Ribeiro"),
                  subtitle: const Text("(11) 6543-6684"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondPage("João Ribeiro"),
                      ),
                    );
                  },
                ),
            ),
            Builder(
              builder: (context) =>
                ListTile(
                  leading: Image.asset(personIcon),
                  title: const Text("Carolina Gonçalves"),
                  subtitle: const Text("(85) 6010-5614"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondPage("Carolina Gonçalves"),
                      ),
                    );
                  },
                ),
            ),
            Builder(
              builder: (context) =>
                ListTile(
                  leading: Image.asset(personIcon),
                  title: const Text("Beatrice Rodrigues"),
                  subtitle: const Text("(48) 8292-9226"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondPage("Beatrice Rodrigues"),
                      ),
                    );
                  },
                ),
            ),
            Builder(
              builder: (context) =>
                ListTile(
                  leading: Image.asset(personIcon),
                  title: const Text("Julian Costa"),
                  subtitle: const Text("(85) 7341-9671"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondPage("Julian Costa"),
                      ),
                    );
                  },
                ),
            ),
            Builder(
              builder: (context) =>
                ListTile(
                  leading: Image.asset(personIcon),
                  title: const Text("Fernanda Silva"),
                  subtitle: const Text("(15) 9408-5152"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondPage("Fernanda Silva"),
                      ),
                    );
                  },
                ),
            ),
            Builder(
              builder: (context) =>
                ListTile(
                  leading: Image.asset(personIcon),
                  title: const Text("Diogo Carvalho"),
                  subtitle: const Text("(24) 3797-9282"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondPage("Diogo Carvalho"),
                      ),
                    );
                  },
                ),
            ),
            Builder(
              builder: (context) =>
                ListTile(
                  leading: Image.asset(personIcon),
                  title: const Text("Otávio Cunha"),
                  subtitle: const Text("(21) 4726-2343"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondPage("Otávio Cunha"),
                      ),
                    );
                  },
                ),
            ),
            Builder(
              builder: (context) =>
                ListTile(
                  leading: Image.asset(personIcon),
                  title: const Text("Fernanda Rodrigues"),
                  subtitle: const Text("(31) 6372-5035"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondPage("Fernanda Rodrigues"),
                      ),
                    );
                  },
                ),
            ),
            Builder(
              builder: (context) =>
                ListTile(
                  leading: Image.asset(personIcon),
                  title: const Text("Lucas Barros"),
                  subtitle: const Text("(51) 8456-9694"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondPage("Lucas Barros"),
                      ),
                    );
                  },
                ),
            ),
            Builder(
              builder: (context) =>
                ListTile(
                  leading: Image.asset(personIcon),
                  title: const Text("Diogo Alves"),
                  subtitle: const Text("(11) 5282-7439"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondPage("Diogo Alves"),
                      ),
                    );
                  },
                ),
            ),
            Builder(
              builder: (context) =>
                ListTile(
                  leading: Image.asset(personIcon),
                  title: const Text("Arthur Gomes"),
                  subtitle: const Text("(61) 4634-7701"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondPage("Arthur Gomes"),
                      ),
                    );
                  },
                ),
            ),
            Builder(
              builder: (context) =>
                ListTile(
                  leading: Image.asset(personIcon),
                  title: const Text("Bruna Barros"),
                  subtitle: const Text("(11) 3367-5310"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondPage("Bruna Barros"),
                      ),
                    );
                  },
                ),
            ),
            Builder(
              builder: (context) =>
                ListTile(
                  leading: Image.asset(personIcon),
                  title: const Text("Daniel Fernandes"),
                  subtitle: const Text("(11) 2779-9143"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondPage("Daniel Fernandes"),
                      ),
                    );
                  },
                ),
            ),
            Builder(
              builder: (context) =>
                ListTile(
                  leading: Image.asset(personIcon),
                  title: const Text("Gustavo Cardoso"),
                  subtitle: const Text("(71) 4066-9665"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondPage("Gustavo Cardoso"),
                      ),
                    );
                  },
                ),
            ),
          ],
        )
      )
    );
  }
}