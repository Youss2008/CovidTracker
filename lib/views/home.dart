import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart';

import 'symptoms.dart';
import 'tips.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<Map> fetchWorldWideData() async {
    Response response = await Client().get(Uri.https('disease.sh', 'v3/covid-19/all'));

    return json.decode(response.body);
  }

  Future<Map> fetchCountryData(String country) async {
    Response response = await Client().get(
      Uri.https('disease.sh', 'v3/covid-19/countries/$country'),
    );

    return json.decode(response.body);
  }

  String country = 'egypt';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('متتبع احصائيات فيروس كورونا'),
        actions: <Widget>[
          PopupMenuButton<int>(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            onSelected: (val) {
              switch (val) {
                case 0:
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => const TipsPage()));
                  break;
                case 1:
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => const SymptomsPage()));
                  break;
                case 2:
                  showDialog(context: context, builder: (context) => SimpleDialog(
                    contentPadding: const EdgeInsets.all(20),
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          link('disease.sh'),
                          const Text(' :Cases API'),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      const Text(' :Other Sources', textAlign: TextAlign.end,),
                      const SizedBox(height: 10,),
                      link(
                        'www.who.int/ar/emergencies/diseases/novel-coronavirus-2019/advice-for-public'),
                      const SizedBox(height: 10,),
                      link('www.who.int/ar/health-topics/coronavirus#tab=tab_3'),
                    ],
                  ));
                  break;
              }
            },
            itemBuilder: (context) => <PopupMenuEntry<int>>[
              PopupMenuItem<int>(
                value: 0,
                child: Row(
                  children: const <Widget>[
                    Icon(Icons.health_and_safety, color: Colors.black,),
                    SizedBox(width: 6),
                    Text('اجرائات الوقاية'),
                  ],
                ),
              ),
              PopupMenuItem<int>(
                value: 1,
                child: Row(
                  children: const <Widget>[
                    Icon(Icons.coronavirus, color: Colors.black,),
                    SizedBox(width: 6),
                    Text('أعراض الفيروس'),
                  ],
                ),
              ),
              PopupMenuItem<int>(
                value: 2,
                child: Row(
                  children: const <Widget>[
                    Icon(Icons.source, color: Colors.black,),
                    SizedBox(width: 6),
                    Text('مصادر المعلومات'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          return Future.delayed(const Duration(milliseconds: 800), () {
            setState(() {});
          });
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                title('الاحصائيات والأعداد في جميع العالم'),
                const SizedBox(height: 15,),
                dataBuilder(fetchWorldWideData()),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    title('الاحصائيات والأعداد في'),
                    DropdownButton<String>(
                      value: country,
                      style: const TextStyle(fontSize: 19, color: Colors.black,),
                      items: const [
                        DropdownMenuItem(
                          value: 'egypt',
                          child: Text('مصر'),
                        ),
                        DropdownMenuItem(
                          value: 'usa',
                          child: Text('الولايات المتحدة'),
                        ),
                        DropdownMenuItem(
                          value: 'china',
                          child: Text('الصين'),
                        ),
                        DropdownMenuItem(
                          value: 'uk',
                          child: Text('المملكة المتحدة'),
                        ),
                        DropdownMenuItem(
                          value: 'russia',
                          child: Text('روسيا'),
                        ),
                        DropdownMenuItem(
                          value: 'canada',
                          child: Text('كندا'),
                        ),
                        DropdownMenuItem(
                          value: 'germany',
                          child: Text('ألمانيا'),
                        ),
                        DropdownMenuItem(
                          value: 'france',
                          child: Text('فرنسا'),
                        ),
                        DropdownMenuItem(
                          value: 'italy',
                          child: Text('ايطاليا'),
                        ),
                        DropdownMenuItem(
                          value: 'australia',
                          child: Text('أستراليا'),
                        ),
                      ],
                      onChanged: (newVal) {
                        setState(() {
                          country = newVal!;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 15,),
                dataBuilder(fetchCountryData(country)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text title(String text) =>
    Text(text, style: const TextStyle(fontSize: 23),);

  Text bodyText(String text) =>
    Text(text, style: TextStyle(fontSize: 19, color: Colors.grey[800], ),);

  GestureDetector link(String text) =>
    GestureDetector(
      onTap: () {
        launch('https://$text');
      },
      child: Text(
        text, style: const TextStyle(
          fontSize: 19, decoration: TextDecoration.underline,
        ), textAlign: TextAlign.end,
      ),
    );

  FutureBuilder<Map> dataBuilder(Future<Map> future) => FutureBuilder<Map>(
    future: future,
    builder: (context, snapshot) {
      if(snapshot.hasData) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            bodyText('عدد الحالات المسجلة حتى الآن: ${snapshot.data!['cases']}'),
            const SizedBox(height: 5,),
            bodyText('عدد الوفيات المسجلة حتى الآن: ${snapshot.data!['deaths']}'),
            const SizedBox(height: 5,),
            bodyText('عدد الحالات المتعافية حتى الآن: ${snapshot.data!['recovered']}'),
            const Divider(),
            bodyText('عدد الحالات المسجلة اليوم: ${snapshot.data!['todayCases']}'),
            const SizedBox(height: 5,),
            bodyText('عدد الوفيات المسجلة اليوم: ${snapshot.data!['todayDeaths']}'),
            const SizedBox(height: 5,),
            bodyText('عدد الحالات المتعافية اليوم: ${snapshot.data!['todayRecovered']}'),
            const Divider(),
            bodyText('عدد الحالات النشطة حاليا: ${snapshot.data!['active']}'),
            const SizedBox(height: 5,),
            bodyText('عدد الوفيات الحرجة حاليا: ${snapshot.data!['critical']}'),
          ],
        );
      } else {
        return const CircularProgressIndicator();
      }
    },
  );
}