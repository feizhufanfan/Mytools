import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  Future<void> _openMYHOmePath() async {
    var url = 'http://feizhufanfan.top/';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _buildCard() {
    return SizedBox(
      // height: 210,
      child: Center(
        child: Column(
          children: [
            ListTile(
              title: const Text(
                'http://feizhufanfan.top/',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              onTap:_openMYHOmePath,
              subtitle: const Text('1009963012@qq.com'),
              leading: Icon(
                Icons.mail_outline,
                color: Colors.blue[500],
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }

  Widget _buildStack() {
    return const Stack(

      alignment: Alignment(0, 100.0),
      children: [
        CircleAvatar(
          foregroundImage: AssetImage('assets/images/logo.jpg'),
          radius: 45,
        ),
      ],
    );
  }

  Widget _myHOMEINFO() {
    return Center(
      child: Column(
        children: [
          _buildStack(),
          _buildCard(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('标题'),
      ),
      drawer: Drawer(
          child: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Container(
              color:Colors.amber,
            // height: 150,
            //_buildStack()
            child: _myHOMEINFO(),
          ),
          Container(
           // height: 50,
            //color: Colors.amber[500],
            child: const Center(child: Text('Entry B')),
          ),
          Container(
           // height: 50,
           // color: Colors.amber[100],
            child: const Center(child: Text('Entry C')),
          ),
        ],
      )),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
