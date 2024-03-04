import 'package:coincontrol/imports.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;

class InvestmentContoller {
  Future<List<Map<String, dynamic>>> fetchingPlans() async {
    List<Map<String, dynamic>> lists = [];
    QuerySnapshot<Map<String, dynamic>> data =
        await FirebaseFirestore.instance.collection("investment_plans").get();
    for (QueryDocumentSnapshot<Map<String, dynamic>> document in data.docs) {
      lists.add(document.data());
    }
    return lists;
  }

  Future<void> getWebsiteData() async {
    final url = Uri.parse('https://www.linkedin.com/jobs/');
    final response = await http.get(url);
    dom.Document html = parser.parse(response.body);
    print('herererwewr $html');
    html;
  }

  Future<List<Map<String, String>>> fetchDataList() async {
    try {
      final response = await http.get(
        Uri.parse('https://parkviewcity.com.pk/islamabad/payment-plan/'),
      );

      if (response.statusCode == 200) {
        final document = parser.parse(response.body);

        // Define a list to store the extracted data
        List<Map<String, String>> dataList = [];

        // Example: Extracting data based on HTML structure
        // Replace the query selectors with the actual elements you want to extract
        final titles = document.querySelectorAll('h2.title');
        final descriptions = document.querySelectorAll('p.description');

        // Iterate over the elements and store each entry as a map
        for (int i = 0; i < titles.length; i++) {
          Map<String, String> dataMap = {
            'title': titles[i].text.trim(),
            'description': descriptions[i].text.trim(),
          };
          dataList.add(dataMap);
        }

        return dataList;
      } else {
        print('Failed to fetch data. Status code: ${response.statusCode}');
        return [];
      }
    } catch (e, stackTrace) {
      print('Error fetching data: $e');
      print('Stack trace: $stackTrace');
      return [];
    }
  }
}
