import 'package:flutter/material.dart';
import 'package:ubidoor/authentification.dart';
import 'package:ubidoor/vault_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool isAuthenticated = await Authentication.authenticateWithBiometrics();

  if (isAuthenticated) {
    runApp(MyApp());
  } else {
    main();
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(title: 'Secret Vault'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Press the button below to enter secret vault:',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
                onPressed: () async {
                  bool isAuthenticated =
                      await Authentication.authenticateWithBiometrics();

                  if (isAuthenticated) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SecretVaultScreen(),
                      ),
                    );
                  }
                },
                child: Text("Vault"))
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
