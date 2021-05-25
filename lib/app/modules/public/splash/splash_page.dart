import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvelcatalogo/app/modules/public/splash/splash_controller.dart';
import 'package:marvelcatalogo/app/modules/public/widgets/background_widget.dart';
import 'package:marvelcatalogo/app/modules/public/widgets/opacity_widget.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ModularState<SplashPage, SplashController> {
  @override
  void initState() {
    controller.verificaUsuarioLogado();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catálogo Marvel'),
        
   backgroundColor: Colors.black87,
      ),
      body: _createBody(),
    );
  }

  Observer _createBody() {
    return Observer(builder: (_) {
      if (controller.error) {
        return Center(
          child: Text('Deu proagro!'),
        );
      }

      if (!controller.initialized) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }

      return _createPage();
    });
  }

  Stack _createPage() {
    return Stack(
      children: [
        BackgroundWidget(),
        OpacityWidget(),
        _createTitle(context),
        _createActions(context),
      ],
    );
  }

  Widget _createTitle(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        
      ),
    );
  }

  Widget _createActions(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Modular.to.pushNamed('/public/login');
                  },
                  child: Text('Entrar'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    Modular.to.pushNamed('/public/register');
                  },
                  child: Text('Cadastrar-se'),
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
