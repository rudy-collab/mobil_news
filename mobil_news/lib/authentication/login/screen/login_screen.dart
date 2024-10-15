import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobil_news/authentication/register/screen/register_screen.dart';
import 'package:mobil_news/news/screen/news_screen.dart';
import 'package:mobil_news/providers/providers.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {

final key = GlobalKey<FormState>();
bool isOpen = true;
TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Brife',style: GoogleFonts.poppins(),),
        elevation: 10,
        shadowColor: Colors.black,
        centerTitle: true,
      ),body:  SingleChildScrollView(
        child: Column(children: [
Center(child: Image.asset('images/login.png',width: 300,)),
Form(
  child: Column(children: [
    Padding(
                 padding: const EdgeInsets.only(top: 10,left: 30,right: 30),
                 child: TextFormField(
                  style: GoogleFonts.poppins(),
                  controller: email,
                   validator: (value) {
                    if(value == null || value.isEmpty){
                      return 'Champ requis';
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'email',
                    hintStyle: GoogleFonts.poppins(),
                    suffixIcon: const Icon(Icons.mail),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)
                    )
                  ),
                 ),
               ),
                Padding(
                 padding: const EdgeInsets.only(top: 10,left: 30,right: 30),
                 child: TextFormField(
                  style: GoogleFonts.poppins(),
                  obscureText: isOpen,
                  controller: password,
                   validator: (value) {
                    if(value == null || value.isEmpty){
                      return 'Champ requis';
                    }
                  },
                  decoration: InputDecoration(
                    
                    hintText: 'Mot de Passe',
                    hintStyle: GoogleFonts.poppins(),
                    suffixIcon: IconButton(onPressed: (){
                      setState(() {
                        isOpen = !isOpen;
                      });

                    }, icon: isOpen ? const  Icon(Icons.remove_red_eye_rounded) : const Icon(Icons.remove_red_eye_outlined)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)
                    )
                  ),
                 ),
               )
  ],)),
  Padding(
    padding: const EdgeInsets.only(top: 20),
    child: ElevatedButton(onPressed: (){
     
ref.read(loginss.notifier).loginuser(email: email.text, password: password.text);

      
    }, child:  Text('Soumettre',style: GoogleFonts.poppins())),
    
  ),

  TextButton(onPressed: (){
    MaterialPageRoute route = MaterialPageRoute(builder: (BuildContext context){
  return const RegisterScreen();
    });
  Navigator.of(context).push(route);
  }, child: Text('Pas encore membre ? Enregistrez vous.',style: GoogleFonts.poppins(),)),
  ref.watch(loginss).when(data: (data){
    WidgetsBinding.instance.addPostFrameCallback((_){
      MaterialPageRoute newRoute = MaterialPageRoute(builder: (BuildContext context){
        return const NewsScreen();
      });
Navigator.of(context).pushReplacement(newRoute);
    });
    return const SizedBox.shrink();
  }, 
  error: (error,stackTrace)
  {
    WidgetsBinding.instance.addPostFrameCallback((_){
 QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          text: error.toString(),
          autoCloseDuration: const Duration(seconds: 3),
          showConfirmBtn: true,
        );
    });
          

    return const SizedBox.shrink();
  }, 
  loading: loading)
        ],),
      ),
      
    );
  }
}

Widget loading(){
  return const SizedBox.shrink();
}