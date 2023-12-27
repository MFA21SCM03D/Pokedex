import 'package:flutter/material.dart';
import 'package:pokemon/pokemonlist.dart';


class PokemonDetails extends StatelessWidget{

  final Pokemon pokemon;

  PokemonDetails({this.pokemon});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        elevation: 0,
        title: Text(pokemon.name),
        backgroundColor: Color.fromRGBO(255, 0, 0, 1),
      ),
      body : Stack(
        children: <Widget>[
        Positioned(height: MediaQuery.of(context).size.height*0.82,
                    width: MediaQuery.of(context).size.width-20,
                    left: 10.0,
                    top: MediaQuery.of(context).size.height/35.0,
                  child: Container(
            child: Card(
              color: Color.fromRGBO(0, 0, 0, 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                  height: 150.0,
                ),
                  Text(pokemon.name, 
                  style: TextStyle(
                    fontSize: 20.0, fontWeight:FontWeight.bold, color: Color.fromRGBO(255, 255, 255, 1)
                    ),
                    ),
                  Text("Height : ${pokemon.height}",
                  style: TextStyle(
                    fontSize: 18, fontWeight:FontWeight.bold, color: Color.fromRGBO(255, 255, 255, 1)
                    ),
                    ),
                  Text("Weight : ${pokemon.weight}",
                  style: TextStyle(
                    fontSize: 18, fontWeight:FontWeight.bold, color: Color.fromRGBO(255, 255, 255, 1)
                  ),
                  ),
                   Text("Spawn Chance : ${pokemon.spawnChance}",
                   style: TextStyle(
                     fontSize: 18, fontWeight:FontWeight.bold, color: Color.fromRGBO(255, 255, 255, 1)
                     ),
                     ),
                   Text("Spawn Time : ${pokemon.spawnTime}",
                   style: TextStyle(
                     fontSize: 18, fontWeight:FontWeight.bold, color: Color.fromRGBO(255, 255, 255, 1)
                     ),
                     ),
                  Text("Type",
                  style: TextStyle(
                    fontSize: 20.0, fontWeight:FontWeight.bold, color: Color.fromRGBO(255, 255, 255, 1)
                    ),
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.type.map((type)=>FilterChip(backgroundColor: Color.fromRGBO(150, 255, 50, 1), label: Text(type), onSelected: (s){})).toList()
                  ),
                  Text("Weakness",
                  style: TextStyle(
                    fontSize: 20.0, fontWeight:FontWeight.bold, color: Color.fromRGBO(255, 255, 255, 1)
                    ),
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.weaknesses.map((weakness)=>FilterChip(backgroundColor: Color.fromRGBO(255, 0, 0, 1), label: Text(weakness, style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),), onSelected: (s){})).toList()
                  ),
                  // pokemon.nextEvolution == null ? Text("Final Evolution")
                  // :Text("Next Evolution"),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: pokemon.nextEvolution.map((nextevolution)=>FilterChip(label: Text(nextevolution.name), onSelected: (s){})).toList()
                  // )

          ],
          ),
          ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: 200.0,
            width: 200.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(pokemon.img),
                fit: BoxFit.cover
                )
            ),
          ),
        ),
      ],
      )
    );
  }



}