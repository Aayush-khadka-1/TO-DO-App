import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String value = '';
  List<String> listTODO = [''];

  void addTODO() {
    setState(() {
      listTODO.add(value);
      value = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do App'),
        backgroundColor: Colors.blue[200],
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addTODO();
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/images/img_1.png',
            height: 200,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: listTODO.length,
              itemBuilder: (context, index) {
                return index == 0
                    ? Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextFormField(
                          onChanged: (val) {
                            setState(() {
                              value = val;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter item',
                          ),
                        ),
                      )
                    : ListTile(
                        leading: Icon(Icons.shopping_cart),
                        title: Text(
                          '${listTODO[index]}',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
