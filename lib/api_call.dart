import 'package:flutter/material.dart';
import 'package:flutter_application_1/apimodel.dart';
import 'package:http/http.dart' as http;

class ApiCall extends StatefulWidget {
  const ApiCall({super.key});

  @override
  State<ApiCall> createState() => _ApiCallState();
}

class _ApiCallState extends State<ApiCall> {
  Future<List<ApiModel>> getdata() async {
    try {
      var response = await http.get(Uri.parse(
          "https://mocki.io/v1/8b0fb7db-d63c-4f24-aa55-f8375251ef2e"));
      if (response.statusCode == 200) {
        print(response.body);
        return apiModelFromJson(response.body);
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception("Error");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("MyApp"),
        ),
        body: FutureBuilder(
          future: getdata(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      color: Colors.amberAccent,
                      child: Row(
                        children: [
                          Container(
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/2023/10/free-images.jpg"),
                                    fit: BoxFit.cover),
                                shape: BoxShape.circle,
                                color: Colors.brown),
                          ),
                          Container(
                            height: 55,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Column(
                              children: [
                                Text("Sadiksha"),
                                Text(snapshot.data![index].phone)
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  });
            } else {
              return CircularProgressIndicator();
            }
          },
        ));
  }
}
