import 'package:flutter/material.dart';

class GridviewBuilderScreen extends StatefulWidget {
  const GridviewBuilderScreen({super.key});

  @override
  State<GridviewBuilderScreen> createState() => _GridviewBuilderScreenState();
}

class _GridviewBuilderScreenState extends State<GridviewBuilderScreen> {
  final List<String> items = [
    "He'd have you all unravel at the",
    'Heed not the rabble',
    'Sound of screams but the',
    'Who scream',
    'Revolution is coming...',
    'Revolution, they...',
  ];
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GridView.Builder'), centerTitle: false),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    controller: textController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Digite o texto',
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (textController.text.isNotEmpty) {
                          setState(() {
                            items.add(textController.text);
                            textController.clear();
                          });
                        }
                      },
                      child: Text('Adicionar'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: double.infinity,

                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.red),
                      ),
                      onPressed: () {
                        if (items.isNotEmpty) {
                          setState(() {
                            items.removeLast();
                          });
                        }
                      },
                      child: Text('Remover ultimo card'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: GridView.builder(
                padding: const EdgeInsets.all(20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[(index % 9 + 1) * 100],
                    child: Text(items[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
