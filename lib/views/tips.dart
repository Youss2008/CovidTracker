import 'package:flutter/material.dart';

class TipsPage extends StatefulWidget {
  const TipsPage({ Key? key }) : super(key: key);

  @override
  _TipsPageState createState() => _TipsPageState();
}

class _TipsPageState extends State<TipsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('أهم الاجرائات للوقاية من الفيروس'),),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(25),
          alignment: Alignment.centerRight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '١. التزم بارتداء الكمامة دائما في الأماكن العامة',
                style: TextStyle(fontSize: 25),
              ),
              const SizedBox(height: 15,),
              smallText('نظّف يديك قبل أن ترتدي الكمامة، وقبل خلعها وبعده.'),
              const SizedBox(height: 12,),
              smallText('تأكد من أنها تغطي أنفك وفمك وذقنك.'),
              const SizedBox(height: 12,),
              smallText(
                'عندما تخلع الكمامة، احفظها في كيس بلاستيكي نظيف، واحرص يومياً على غسلها إذا كانت كمامة قماشية أو التخلّص منها في صندوق النفايات إذا كانت كمامة طبية.'),
              const SizedBox(height: 12,),
              smallText('لا تستعمل الكمامات المزودة بصمامات.'),
              const SizedBox(height: 15,),
              bodyText('٢. تجنب الأماكن المغلقة أو المكتظة أو التي تنطوي على مخالطة لصيقة'),
              const SizedBox(height: 15,),
              bodyText('٣. نظف يديك جيداً بانتظام باستخدام مطهر اليدين الكحولي أو اغسلهما بالماء والصابون'),
              const SizedBox(height: 15,),
              bodyText('٤. تجنب لمس عينيك وأنفك وفمك'),
              const SizedBox(height: 15,),
              bodyText('٥. غطِ فمك وأنفك بثني المرفق أو بمنديل ورقي عند السعال أو العطس'),
              const SizedBox(height: 15,),
              const Text(
                '٦. الذي ينبغي فعله عند الشعور بالمرض:',
                style: TextStyle(fontSize: 25),
              ),
              const SizedBox(height: 15,),
              smallText('الزم المنزل واعزل نفسك حتى لو كنت مصاباً بأعراض خفيفة مثل السعال والصداع والحمى الخفيفة'),
              const SizedBox(height: 12,),
              smallText('إذا كنت مصاباً بالحمى والسعال وصعوبة التنفس، التمس الرعاية الطبية على الفور. اتصل بالهاتف أولاً إذا استطعت'),
            ],
          ),
        ),
      ),
    );
  }

  Text smallText(String text) =>
    Text(text, style: TextStyle(fontSize: 19, color: Colors.grey[800], ),);

  Text bodyText(String text) =>
    Text(text, style: const TextStyle(fontSize: 21),);
}