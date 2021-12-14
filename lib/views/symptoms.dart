import 'package:flutter/material.dart';

class SymptomsPage extends StatefulWidget {
  const SymptomsPage({ Key? key }) : super(key: key);

  @override
  _SymptomsPageState createState() => _SymptomsPageState();
}

class _SymptomsPageState extends State<SymptomsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('أهم أعراض فيروس كورونا'),),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(25),
          alignment: Alignment.centerRight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              title('الأعراض الأكثر شيوعاً:'),
              const SizedBox(height: 15,),
              bodyText('١. الحمى'),
              const SizedBox(height: 12,),
              bodyText('٢. السعال'),
              const SizedBox(height: 12,),
              bodyText('٣. التعب'),
              const SizedBox(height: 12,),
              bodyText('٤. فقدان حاسة الذوق أو الشم'),
              const SizedBox(height: 15,),
              title('الأعراض الأقل شيوعاً:'),
              const SizedBox(height: 15,),
              bodyText('١. التهاب الحلق'),
              const SizedBox(height: 12,),
              bodyText('٢. الصداع'),
              const SizedBox(height: 12,),
              bodyText('٣. الأوجاع والآلام'),
              const SizedBox(height: 12,),
              bodyText('٤. الإسهال'),
              const SizedBox(height: 12,),
              bodyText('٥. ظهور طفح جلدي أو تغير لون أصابع اليدين أو القدمين'),
              const SizedBox(height: 12,),
              bodyText('٦. احمرار العينين أو التهابهما '),
              const SizedBox(height: 15,),
              title('الأعراض الخطيرة:'),
              const SizedBox(height: 15,),
              bodyText('١. صعوبة التنفس أو ضيق النفس'),
              const SizedBox(height: 12,),
              bodyText('٢. فقدان القدرة على الكلام أو الحركة أو التشوش'),
              const SizedBox(height: 12,),
              bodyText('٣. ألم الصدر'),
              const SizedBox(height: 15,),
              smallText('التمس العناية الطبية على الفور إذا أصبت بأي من الأعراض الخطرة. احرص دوماً على الاتصال بالطبيب أو المرفق الصحي قبل التوجه إليه.'),
              const SizedBox(height: 12,),
              smallText('الأشخاص المصابون بأعراض خفيفة والمتمتعون عموماً بصحة جيدة عليهم معالجة أعراضهم في المنزل.'),
              const SizedBox(height: 12,),
              smallText('يستغرق الأمر 5 إلى 6 أيام في المتوسط لظهور الأعراض بعد الإصابة بعدوى الفيروس، غير أن المدة قد تطول إلى 14 يوماً.'),
            ],
          ),
        ),
      ),
    );
  }

  Text title(String text) =>
    Text(text, style: const TextStyle(fontSize: 25,),);

  Text smallText(String text) =>
    Text(text, style: TextStyle(fontSize: 19, color: Colors.grey[800], ),);

  Text bodyText(String text) =>
    Text(text, style: const TextStyle(fontSize: 21),);
}