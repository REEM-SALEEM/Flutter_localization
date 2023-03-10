import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //supports localization and translations in app.
  await Locales.init(['en', 'fa', 'hi', 'ml']);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // listens for changes
    return LocaleBuilder(
      builder: (locale) => MaterialApp(
        debugShowCheckedModeBanner: false,
        //loading the translations for a specific locale like cupertino for ios etc
        localizationsDelegates: Locales.delegates,
        //specifies the list of locales that the app supports.
        supportedLocales: Locales.supportedLocales,
        // If the 'locale' is null then the system's locale value is used.
        locale: locale,
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: const Text("Localization"),
      ),
      body: Container(
        child: const Center(
          child: LocaleText(
            "welcome",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green[700],
        child: const Icon(
          Icons.language_outlined,
        ),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => LanguagePage()),
        ),
      ),
    );
  }
}

class LanguagePage extends StatefulWidget {
  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: const LocaleText("language"),
      ),
      body: Column(
        children: [
          ListTile(
              title: const Text("English"),
              onTap: () {
                LocaleNotifier.of(context)!.change('en');
              }),
          ListTile(
              title: const Text("??????"),
              onTap: () {
                LocaleNotifier.of(context)!.change('fa');
              }),
          ListTile(
              title: const Text("???????????????"),
              onTap: () {
                LocaleNotifier.of(context)!.change('hi');
              }),
          ListTile(
              title: const Text("??????????????????"),
              onTap: () {
                LocaleNotifier.of(context)!.change('ml');
              }),
        ],
      ),
    );
  }
}
