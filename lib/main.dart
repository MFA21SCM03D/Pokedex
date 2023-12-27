import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon/pokemondetails.dart';
import 'dart:convert';

import 'package:pokemon/pokemonlist.dart';

void main() => runApp(MaterialApp(
  title: 'PokeDex',
  debugShowCheckedModeBanner: false,
  home: HomePage(),
));

class HomePage extends StatefulWidget{ 
  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {

  var url = "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  PokeDex pokeDex;

  @override
  void initState() {
      super.initState();
      getData();
  }

   getData() async{

    var response = await http.get(url);
    var decodedJson = jsonDecode(response.body);
    pokeDex = PokeDex.fromJson(decodedJson);
    setState(() {
      
    });

  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('PokeDex'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(255, 0, 25, 1),
        ),
      body: pokeDex == null ? Center(child: CircularProgressIndicator(),
      )
      :GridView.count(
        crossAxisCount: 2,
        children: pokeDex.pokemon.map((p)=>Padding(
          padding: const EdgeInsets.all(3.0),
          child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> PokemonDetails( pokemon: p)));
            },
                      child: Card(
              elevation: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    height: 100.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(p.img))
                    )
                  ),
                  Text(p.name, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold))
                ],
              )
            ),
          ),
        )).toList(),
        ),
    );
  }
}