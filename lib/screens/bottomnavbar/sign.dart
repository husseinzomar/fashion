import 'package:flutter/material.dart';




class Sign extends StatefulWidget {
  @override
  _SignState createState() => _SignState();
}

class _SignState extends State<Sign> with TickerProviderStateMixin {

TabController tabController;


@override
void initState() {
  tabController = TabController(initialIndex: 0, length: 2, vsync: this);
  super.initState();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Welcome!',
          style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold)
        ),
        iconTheme: IconThemeData(color: Colors.black, size: 20.0),
        bottom: PreferredSize(
          preferredSize: Size(0.0, 30.0),
          child: TabBar(
            tabs: [
              Text('Signin'), Text('Register')
            ],
            controller: tabController,
            indicator: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.black, width: 1.0)),
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            labelStyle: TextStyle(fontSize: 15.0),
            unselectedLabelStyle: TextStyle(fontSize: 10.0),
          ),
        ),
      ),
      backgroundColor: Colors.grey[100],
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: TabBarView(
          controller: tabController,
          children: <Widget>[
            SignIn(),
            Register()
          ]
        ),
      ),
    );
  }
}





class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController emailResetController = TextEditingController();


final GlobalKey<FormFieldState<String>> emailKey = GlobalKey<FormFieldState<String>>();
final GlobalKey<FormFieldState<String>> passwordKey = GlobalKey<FormFieldState<String>>();

final _formKey = GlobalKey<FormState>();

bool secure = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            field('email', Icons.email, TextInputType.emailAddress, emailController, emailKey),
            field('password', Icons.lock, TextInputType.text, passwordController, passwordKey),
            Align(
              alignment: Alignment.bottomRight,
              child: InkWell(
                child: Text(
                  'Forgot Password?!',
                  style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.normal),
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return AlertDialog(
                        title: Text(
                          'Attention',
                          style: TextStyle(color: Colors.red, fontSize: 15.0, fontWeight: FontWeight.normal),
                        ),
                        content: field('email', Icons.email, TextInputType.emailAddress, emailResetController, null),
                        actions: [
                          FlatButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                            color: Colors.black,
                            child: Text(
                              'send link',
                              style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.normal),
                            ),
                            onPressed: () {},
                          ),
                          FlatButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                            color: Colors.black,
                            child: Text(
                              'cancel',
                              style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.normal),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    }
                  );
                }, 
              ),
            ),
            Column(
              children: [
                FlatButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                  color: Colors.black,
                  child: Text(
                    'Sign in',
                    style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.normal),
                  ),
                  onPressed: () {
                    if(_formKey.currentState.validate()){
                        return null;
                      }else{
                      return Scaffold.of(context).showSnackBar(snack('some fields required!'));
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  snack(String content) {
    return SnackBar(
      content: Text(
        content,
        style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.normal),
      ),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 4),
    );
  }
  field(String label, IconData icon, TextInputType type, TextEditingController controller, Key key) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: TextFormField(
        key: key,
        validator: (value) {
          if(value.isEmpty){
            return 'this field is required';
          }
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: Colors.black, width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: Colors.black, width: 0.5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: Colors.red, width: 0.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: Colors.black, width: 0.5),
          ),
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey, fontSize: 15.0),
          prefixIcon: Icon(icon, color: Colors.grey, size: 20.0),
          suffixIcon: label == 'password' ? IconButton(
            icon: Icon(Icons.remove_red_eye),
            color: Colors.grey,
            onPressed : () {
              setState(() {
                secure = !secure;
              });
            }
          ) : null
        ),
        textInputAction: TextInputAction.done,
        keyboardType: type,
        controller: controller,
        obscureText: label == 'password' ? secure : false,
      ),
    );
  }
}





class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}