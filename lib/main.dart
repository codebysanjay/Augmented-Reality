import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ArCoreController arCoreController;

  _onArCoreViewCreated(ArCoreController _arCoreController){
    arCoreController= _arCoreController;
    _addSphere(_arCoreController);
  }

  _addSphere(ArCoreController _arCoreController){
    final material =ArCoreMaterial(color: Colors.amber);
    final sphere = ArCoreSphere(radius: 0.2 ,materials: [material] );
    final node = ArCoreNode(shape: sphere,position: vector.Vector3(0,0,-2),);
    _arCoreController.addArCoreNode(node);


  }
  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AR Core"),
      ),
      body: ArCoreView(onArCoreViewCreated: _onArCoreViewCreated),
    );
  }
}
