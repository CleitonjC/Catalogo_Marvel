import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvelcatalogo/app/core/auth/auth_controller.dart';
import 'package:marvelcatalogo/app/modules/private/home/home_controller.dart';
import 'package:marvelcatalogo/app/modules/private/home/widget/hero_card.dart';

class HomePage extends StatefulWidget {
  final List<String> list = List.generate(10, (index) => "Text $index");
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  final AuthController authController = Modular.get();

  @override
  void initState() {
    controller.getCharacterDataWrapper();
    super.initState();
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
       //leading: Icon(Icons.arrow_back_ios),
        title: Text('Home'),
      actions: [
        IconButton(
          
        onPressed: () {   
          //redireciona pra pagina home
            Modular.to.navigate('/public/login', replaceAll: true);
          },
        icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),

        IconButton(
        onPressed: () {
              showSearch(context: context, delegate: Search(widget.list));
            },
        icon: Icon(Icons.search),
        ),
         ElevatedButton(
                onPressed: () {
               Modular.to.navigate('/private/favorite', replaceAll: true);
                },
                
                child: Text('Favoritos'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black87),
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
                ),
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
