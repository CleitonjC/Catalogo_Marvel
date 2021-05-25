import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:marvelcatalogo/app/core/models/character.dart';
import 'package:marvelcatalogo/app/core/widgets/my_hero_widget.dart';

class HeroCard extends StatelessWidget {
  final Character? character;

  const HeroCard({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () {
          Modular.to.pushNamed('/private/detalhes', arguments: character);
        },
        child: Column(
          children: [
            Stack(
              children: [
                MyHeroWidget(
                  tag: character!.id,
                  child: Ink.image(
                    height: 400,
                    image: NetworkImage(character!.thumbnail.caminhoCompleto),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                _criaNomeHeroi(context, character!.name),
              ],
            ),
            Column(
              children: [
                _criaDescricaoHeroi(context, character!.description),
                _criaBarraDeBotoes(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _criaNomeHeroi(BuildContext context, String name) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        color: Colors.black.withOpacity(0.8),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Text(
          name,
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }

  Widget _criaDescricaoHeroi(BuildContext context, String? description) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Text(
        description == null || description.isEmpty
            ? 'Não possui descrição'
            : description,
        style: Theme.of(context).textTheme.subtitle2,
      ),
    );
  }


  Widget _criaBarraDeBotoes() {
    return ButtonBar(
      children: [
        FavoriteButton(
            valueChanged: (_isFavorite) {
              print('Favoritou $_isFavorite)');
            },
          )
      ],
    );
  }
}