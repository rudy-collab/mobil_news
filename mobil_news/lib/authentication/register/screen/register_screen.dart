import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobil_news/authentication/login/screen/login_screen.dart';
import 'package:mobil_news/news/screen/news_screen.dart';
import 'package:mobil_news/providers/providers.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {

final key = GlobalKey<FormState>();
TextEditingController name = TextEditingController();
TextEditingController prenom = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController sexe = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController confirmpassword = TextEditingController();
bool isOpen = true;
bool isOpens =true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        elevation: 10,
        shadowColor: Colors.black,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('images/register.png',width: 250,),
             Form(
              key: key,
              child:  Column(children: [
               Padding(
                 padding: const EdgeInsets.only(top: 10,left: 30,right: 30),
                 child: TextFormField(
                  controller: name,
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return 'Champ requis';
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Name',
                    hintStyle: GoogleFonts.poppins(),
                    suffixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)
                    )
                  ),
                 ),
               ),
                Padding(
                 padding: const EdgeInsets.only(top: 10,left: 30,right: 30),
                 child: TextFormField(
                  controller: prenom,
                   validator: (value) {
                    if(value == null || value.isEmpty){
                      return 'Champ requis';
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Prenom',
                    hintStyle: GoogleFonts.poppins(),
                    suffixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)
                    )
                  ),
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.only(top: 10,left: 30,right: 30),
                 child: TextFormField(
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
                  padding: const EdgeInsets.only(top: 10),
                  child: DropdownMenu(
                    width: MediaQuery.of(context).size.width/1.2,
                  controller: sexe,
                  textStyle: GoogleFonts.poppins(),
                  label: const Text('Sexe'),
                  dropdownMenuEntries: const[
                    DropdownMenuEntry(value: 'Masculin', label: 'Masculin'),
                    DropdownMenuEntry(value: 'Feminin', label: 'Feminin')
                  ]),
                ), 
                Padding(
                 padding: const EdgeInsets.only(top: 10,left: 30,right: 30),
                 child: TextFormField(
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
               ),
                Padding(
                 padding: const EdgeInsets.only(top: 10,left: 30,right: 30),
                 child: TextFormField(
                  controller: confirmpassword,
                  obscureText: isOpens,
                   validator: (value) {
                    if(value == null || value.isEmpty){
                      return 'Champ requis';
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Confirmez Mot de Passe',
                    hintStyle: GoogleFonts.poppins(),
                    suffixIcon: IconButton(onPressed: (){
                      setState(() {
                        isOpens = !isOpens;
                      });

                    }, icon: isOpens ? const  Icon(Icons.remove_red_eye_rounded) : const Icon(Icons.remove_red_eye_outlined)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)
                    )
                  ),
                 ),
               ),
               
               
              ],)),
              Padding(
                 padding: const EdgeInsets.only(top: 20),
                 child: ElevatedButton(onPressed: (){
                  if(key.currentState!.validate()){
                    ref.read(registers.notifier).register(name: name.text, prenom: prenom.text, email: email.text, sexe: sexe.text, password: password.text, confirmpassword: confirmpassword.text);
                    name.clear();
                    prenom.clear();
                    email.clear();
                    sexe.clear();
                    password.clear();
                    confirmpassword.clear();
                  }
                 }, child:  Text('Soumettre',style: GoogleFonts.poppins())),

                
               ), ref.watch(registers).when(
                  data: (data){
                    if(data !=null){
            WidgetsBinding.instance.addPostFrameCallback((_){
                                         QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          text: data!.success.toString(),
          autoCloseDuration: const Duration(seconds: 3),
          showConfirmBtn: true,
        );
        Future.delayed(const Duration(seconds: 3), (){
          MaterialPageRoute newRoute = MaterialPageRoute(builder: (BuildContext context){
            return const LoginScreen();
          });
          Navigator.of(context).pushReplacement(newRoute);
        });

                    });
                    }
        

                    
                    return const SizedBox.shrink();
                  }, 
                  error: (error, stackTrace){
                    WidgetsBinding.instance.addPostFrameCallback((_){
                      
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
                  loading: loading)
          ],
        ),
      ),
    );
  }
}
Widget loading(){
  return const SizedBox.shrink();
}