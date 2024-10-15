import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobil_news/providers/providers.dart';
import 'package:mobil_news/widget/font_google/font_googles.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class RealNewsScreen extends ConsumerStatefulWidget {
  const RealNewsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RealNewsScreenState();
}

class _RealNewsScreenState extends ConsumerState<RealNewsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Textes(text: 'News'),
        elevation: 10,
        shadowColor: Colors.black,
        centerTitle: true,
      ),
     body: ref.watch(newss).when(
      data: (data){
        if (data == null || data.newsApiDatasModel?.articles == null) {
            return const Text('Aucunes donnees...');
          }
        return ListView.separated(
          itemBuilder: (BuildContext context, index){
            var datas = data.newsApiDatasModel?.articles[index];
            return ListTile(
              title: Textes(text: datas!.author),
            );
          }, 
          separatorBuilder: (BuildContext context, int index) => const Divider(), 
          itemCount: data.newsApiDatasModel!.articles.length);
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
      loading: loading),
    );
  }
}
Widget loading(){
  return const Center(child: CircularProgressIndicator());
}