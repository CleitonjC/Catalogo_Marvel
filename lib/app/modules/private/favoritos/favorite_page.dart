
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvelcatalogo/app/core/auth/auth_controller.dart';
import 'package:marvelcatalogo/app/modules/private/favoritos/favorite_controller.dart';
import 'package:marvelcatalogo/app/modules/private/home/widget/hero_card.dart';


class FavoritePage extends StatefulWidget {
  final List<String> list = List.generate(10, (index) => "Text $index");
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends ModularState<FavoritePage, FavoriteController> {
  final AuthController authController = Modular.get();

  @override
  void initState() {
    controller.getCharacterDataWrapper();
    super.initState();
  }

//BARRA NO TOPO DA PAGINA
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //leading: Icon(Icons.arrow_back_ios),
        title: Text('Favoritos'),
      actions: [
         IconButton(
        onPressed: () {   
          //redireciona pra pagina home
            Modular.to.navigate('/private/home', replaceAll: true);
          },
        icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        IconButton(
        onPressed: () {
          //barra de pesquisa
              showSearch(context: context, delegate: Search(widget.list));
            },
        icon: Icon(Icons.search),
        ),
      
    ],
      backgroundColor: Colors.black87,
       centerTitle: true,
       
      ),
      body: Container(
        color: Colors.black87,
        child: _criaListaHerois(),
      ),
    );
  }



  Widget _criaListaHerois() {
    return Observer(builder: (_) {
      if (controller.carregando || controller.characterDataWrapper == null) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return ListView.builder(
          itemCount: controller.characterDataWrapper?.data.results.length,
          itemBuilder: (context, i) => HeroCard(
            character: controller.characterDataWrapper?.data.results[i],
          ),
        );
      }
    });
  }
}




class Search extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  String selectedResult = "";

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Center(
        child: Text(selectedResult),
      ),
    );
  }

  final List<String> listExample;
  Search(this.listExample);

  List<String> recentList = ["Text 4", "Text 3"];

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestionList = [];
    query.isEmpty
        ? suggestionList = recentList //In the true case
        : suggestionList.addAll(listExample.where(
            // In the false case
            (element) => element.contains(query),
          ));

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            suggestionList[index],
          ),
          leading: query.isEmpty ? Icon(Icons.access_time) : SizedBox(),
          onTap: (){
            selectedResult = suggestionList[index];
            showResults(context);
          },
        );
      },
    );
  }
}
