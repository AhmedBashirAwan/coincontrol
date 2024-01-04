import 'package:coincontrol/imports.dart';

class PlansDetails extends StatefulWidget {
  int index;
  Map<String, dynamic> plan = {
    'user_ID': FirebaseAuth.instance.currentUser!.uid,
  };
  PlansDetails({super.key, required this.plan, required this.index});

  @override
  State<PlansDetails> createState() => _PlansDetailsState();
}

class _PlansDetailsState extends State<PlansDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        elevation: 5,
        // toolbarHeight: getHeight(context) * 0.03,
        title: Text(
          widget.plan['title'],
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor:
            isDarkTheme(context) == true ? Colors.black : LIGHT_SEC_COLOR,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              // color: Colors.amber,
              height: getHeight(context) * 0.3,
              child: Image.network(widget.plan['imageURL']),
            ),
            Row(
              children: [
                Text(
                  widget.plan['title'],
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            RichText(
              text: TextSpan(
                  text: widget.plan['description'],
                  style: TextStyle(
                      fontSize: 16,
                      color: isDarkTheme(context) == true
                          ? Colors.white
                          : Colors.black)),
            ),
            Row(
              children: [
                Text(
                  widget.plan['link'],
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: getWidth(context) * 0.3,
                  child: CustomElevatedBtn(
                    height: getHeight(context) * 0.03,
                    // radius: 18,
                    foregroundColor: LIGHT_COLOR,
                    backgroundColor: LIGHT_SEC_COLOR,
                    child: const Text(
                      'Applied',
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () async {
                      Map<String, dynamic> pla = {
                        'user_ID': FirebaseAuth.instance.currentUser!.uid,
                        'imageURL': widget.plan['imageURL'],
                        'title': widget.plan['title'],
                        'link': widget.plan['applied'],
                        'applied': true,
                        'description': widget.plan['description']
                      };
                      ReliefPlansControllers().applyReliefs(pla);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
