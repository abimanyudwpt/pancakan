import 'package:flutter/material.dart';
import 'package:pancakan/ui/admin/listjadwal.dart';
// import 'package:pancakan/ui/keliantempekan/dashboard.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final nikController = TextEditingController();
  final passwordController = TextEditingController();
  late bool obscureText;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    obscureText = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        body: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.blue, Colors.white])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Card(
                elevation: 12,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'LOGIN',
                        style: TextStyle(
                            fontSize: 28,
                            color: Colors.black54,
                            fontFamily: "Avenir",
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal),
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: <Widget>[
                              Material(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  elevation: 2,
                                  child: AspectRatio(
                                      aspectRatio: 7 / 1,
                                      child: Center(
                                          child: TextFormField(
                                        decoration: const InputDecoration(
                                            hintText: 'NIK',
                                            border: InputBorder.none,
                                            contentPadding: EdgeInsets.all(8)),
                                        controller: nikController,
                                        keyboardType: TextInputType.number,
                                      )))),
                              Container(
                                  margin: const EdgeInsets.only(top: 16),
                                  child: Material(
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20)),
                                      elevation: 2,
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: AspectRatio(
                                                aspectRatio: 7 / 1,
                                                child: Center(
                                                    child: TextFormField(
                                                  decoration:
                                                      const InputDecoration(
                                                          hintText: 'Password',
                                                          border:
                                                              InputBorder.none,
                                                          contentPadding:
                                                              EdgeInsets.all(
                                                                  8)),
                                                  controller:
                                                      passwordController,
                                                  obscureText: obscureText,
                                                ))),
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              Icons.remove_red_eye,
                                              color: !obscureText
                                                  ? Colors.black
                                                      .withOpacity(0.3)
                                                  : Colors.black,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                obscureText = !obscureText;
                                              });
                                            },
                                          )
                                        ],
                                      ))),
                              Container(
                                  margin: const EdgeInsets.only(top: 30),
                                  width: MediaQuery.of(context).size.width,
                                  child: MaterialButton(
                                    onPressed: () {
                                      // loginValidation(context);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const ListJadwal()));
                                    },
                                    child: const Text("Login",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16)),
                                    color: Colors.blue,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50))),
                                    padding: const EdgeInsets.all(16),
                                  )),
                            ],
                          )),
                      const SizedBox(
                        height: 70,
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 40),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {},
                              child: const Text(
                                'Forgot Password?',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black87,
                                    fontFamily: "Avenir",
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      callback();
    });
  }

  void loginValidation(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());

    if (nikController.text.isEmpty) {
      _onWidgetDidBuild(() {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('NIK Tidak Boleh Kosongtes'),
            backgroundColor: Colors.red,
          ),
        );
      });
    }

    if (passwordController.text.isEmpty) {
      _onWidgetDidBuild(() {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Password Tidak Boleh Kosong'),
            backgroundColor: Colors.red,
          ),
        );
      });
    }
  }

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(
              margin: const EdgeInsets.only(left: 7),
              child: const Text("Loading...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  hideLoaderDialog(BuildContext context) {
    return Navigator.pop(context);
  }
}
