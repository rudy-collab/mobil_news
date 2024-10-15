import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobil_news/news/screen/real_news_screen.dart';
import 'package:mobil_news/providers/providers.dart';
import 'package:mobil_news/widget/font_google/font_googles.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class NewsScreen extends ConsumerStatefulWidget {
  const NewsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewsScreenState();
}

class _NewsScreenState extends ConsumerState<NewsScreen> {
  final key = GlobalKey<FormState>();
 String? country;
String? category;

  TextEditingController langue = TextEditingController();
  bool isNavigated = false;

  @override
  Widget build(BuildContext context) {
    return ref.watch(loginss).when(
        data: (data) {
          if (data == null) {
            return Scaffold(
              appBar: AppBar(
                title: Text(' Brife',
                    style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                elevation: 10,
                shadowColor: Colors.black,
                actions: [
                  Form(
                      child: DropdownMenu(
                          controller: langue,
                          hintText: 'Langue',
                          inputDecorationTheme: const InputDecorationTheme(
                              outlineBorder: BorderSide.none),
                          dropdownMenuEntries: const [
                        DropdownMenuEntry(value: 'fr', label: 'Francais'),
                        DropdownMenuEntry(value: 'en', label: 'Anglais'),
                      ]))
                ],
              ),
              drawer: Drawer(
                  child: ListView(
                children: [
                  DrawerHeader(
                    child: Text(data!.user.name),
                    decoration: const BoxDecoration(color: Colors.lightBlue),
                  ),
                  ListTile(
                    title: Text(
                      'Home',
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                    ),
                    leading: const Icon(Icons.home),
                  ),
                  ListTile(
                    title: Text('My Account',
                        style:
                            GoogleFonts.poppins(fontWeight: FontWeight.w500)),
                    leading: const Icon(Icons.person),
                  ),
                  ListTile(
                    title: Text('Settings',
                        style:
                            GoogleFonts.poppins(fontWeight: FontWeight.w500)),
                    leading: const Icon(Icons.settings),
                  )
                ],
              )),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Text(
                        'Welcome ${data.user.name}',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500, fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 150),
                      child: Center(child: Image.asset('images/news.png')),
                    ),
                    const Text('  Pas de donnees...')
                  ],
                ),
              ),
            );
          }
          return Scaffold(
            appBar: AppBar(
              title: Text(' Brife',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
              elevation: 10,
              shadowColor: Colors.black,
              actions: [
                Form(
                    child: DropdownMenu(
                        controller: langue,
                        hintText: 'Langue',
                        inputDecorationTheme: const InputDecorationTheme(
                            outlineBorder: BorderSide.none),
                        dropdownMenuEntries: const [
                      DropdownMenuEntry(value: 'fr', label: 'Francais'),
                      DropdownMenuEntry(value: 'en', label: 'Anglais'),
                    ]))
              ],
            ),
            drawer: Drawer(
                child: ListView(
              children: [
                DrawerHeader(
                  child: (data.user.sexe == 'Masculin')
                      ? Image.asset('images/personmen.png')
                      : Image.asset('images/personwoman.png'),
                  decoration: const BoxDecoration(color: Colors.lightBlue),
                ),
                ListTile(
                  title: Text(
                    'Home',
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                  ),
                  leading: const Icon(Icons.home),
                ),
                ListTile(
                  title: Text('My Account',
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
                  leading: const Icon(Icons.person),
                ),
                ListTile(
                  title: Text('Settings',
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
                  leading: const Icon(Icons.settings),
                )
              ],
            )),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Text(
                      'Welcome ${data.user.name}',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Center(child: Image.asset('images/news.png')),
                  ),
                  Form(
                      key: key,
                      child: Column(
                        children: [
                         DropdownButton<String>(
  value: country, // Utilise la variable selectedCountry
  hint: const Text('Pays'),
  isExpanded: true, // Pour s'assurer que le menu utilise tout l'espace disponible
  items: const [
    DropdownMenuItem(value: 'ae', child: Text('Émirats arabes unis')),
    DropdownMenuItem(value: 'ar', child: Text('Argentine')),
    DropdownMenuItem(value: 'at', child: Text('Autriche')),
    DropdownMenuItem(value: 'fr', child: Text('France')),
    DropdownMenuItem(value: 'us', child: Text('Etats-Unis')),
    // Ajoute d'autres pays ici
  ],
  onChanged: (String? value) {
    setState(() {
      country = value;  // Met à jour la variable avec la sélection de l'utilisateur
    });
  },
),
                          
DropdownButton<String>(
  value: category, // Utilise la variable selectedCountry
  hint: const Text('Categorie'),
  isExpanded: true, // Pour s'assurer que le menu utilise tout l'espace disponible
  items: const [
    DropdownMenuItem(value: 'business', child: Text('business')),
    DropdownMenuItem(value: 'entertainment', child: Text('entertainment')),
    DropdownMenuItem(value: 'health', child: Text('health')),
    DropdownMenuItem(value: 'sports', child: Text('sports')),
    DropdownMenuItem(value: 'technology', child: Text('technology')),
    // Ajoute d'autres pays ici
  ],
  onChanged: (String? value) {
    setState(() {
      category = value;  // Met à jour la variable avec la sélection de l'utilisateur
    });
  },
),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: ElevatedButton(
                                onPressed: () {
                                   if (country != null && category != null) {
    ref.read(newss.notifier).getNews(
        country: country!,
        category: category!);
  } else {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.warning,
      text: "Veuillez sélectionner un pays et une catégorie",
      autoCloseDuration: const Duration(seconds: 3),
    );
  }
                                },
                                child: const Textes(text: 'Soumettre')),
                          ),
                          ref.watch(newss).when(
                              data: (data) {
                              if(data != null ){
                                 WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                    MaterialPageRoute route = MaterialPageRoute(
                                        builder: (BuildContext context) {
                                      return const RealNewsScreen();
                                    });
                                    Navigator.of(context).push(route);
                                  });

                              }

                                return const SizedBox.shrink();
                              },
                              error: (error, stackTrace) {
                                WidgetsBinding.instance
                                    .addPostFrameCallback((_) {
                                  QuickAlert.show(
                                    context: context,
                                    type: QuickAlertType.error,
                                    text: error.toString(),
                                    autoCloseDuration:
                                        const Duration(seconds: 5),
                                    showConfirmBtn: true,
                                  );
                                });
                                return const SizedBox.shrink();
                              },
                              loading: loading)
                        ],
                      )),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.endDocked,
          );
        },
        error: (error, stackTrace) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              text: error.toString(),
              autoCloseDuration: const Duration(seconds: 5),
              showConfirmBtn: true,
            );
          });
          return const SizedBox.shrink();
        },
        loading: loading);
  }
}

Widget loading() {
  return const SizedBox.shrink();
}
