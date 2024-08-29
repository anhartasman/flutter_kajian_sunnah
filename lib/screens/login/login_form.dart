import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:kajiansunnah/bloc/user_login/bloc.dart';
import 'package:kajiansunnah/bloc/user_login/user_login_bloc.dart';
import 'package:kajiansunnah/screens/register/register_screen.dart';
import 'package:kajiansunnah/theme/colors/Warna.dart';
import 'package:kajiansunnah/theme/styles/text/opensans_style_text.dart';
import 'package:kajiansunnah/widgets/LoginHeader.dart';
import 'package:kajiansunnah/widgets/TampilanDialog.dart';

class login_form extends StatefulWidget {
  final String email;
  final String password;
  final String message;
  const login_form({
    super.key,
    this.email = "",
    this.password = "",
    this.message = "",
  });

  @override
  State<login_form> createState() => _login_formState();
}

class _login_formState extends State<login_form> {
  var tec_email = new TextEditingController();

  var tec_password = new TextEditingController();
  @override
  void initState() {
    tec_email.text = widget.email;
    tec_password.text = widget.password;

    if (!kReleaseMode) {
      tec_email.text = "tesregister1@gmail.com";
      tec_password.text = "P!ntu123";
    }
    super.initState();
  }

  void submit() {
    final _email = tec_email.text;
    final _password = tec_password.text;
    try {
      if (_email.isEmpty || _password.isEmpty) {
        throw ("Isian tidak valid");
      }
    } catch (e) {
      TampilanDialog.showDialogAlert(e.toString());
      return;
    }
    BlocProvider.of<UserLoginBloc>(context).add(UserLoginBlocStart(
      email: tec_email.text,
      password: tec_password.text,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        LoginHeader(),
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: TextField(
            style: OpenSansRegular11,
            controller: tec_email,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 12,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              filled: true,
              hintStyle: OpenSansRegular14.copyWith(
                color: Colors.grey,
              ),
              hintText: "Enter your username or email",
              fillColor: Colors.white,
              isDense: true,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: TextField(
            style: OpenSansRegular11,
            controller: tec_password,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 12,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              filled: true,
              hintStyle: OpenSansRegular14.copyWith(
                color: Colors.grey,
              ),
              hintText: "Enter your password",
              fillColor: Colors.white,
              isDense: true,
            ),
            obscureText: true,
          ),
        ),
        if (widget.message.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(
              top: 12,
            ),
            child: Text(
              widget.message,
              style: OpenSansBold12.copyWith(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        Padding(
          padding: const EdgeInsets.only(
            top: 24,
            bottom: 24.0,
          ),
          child: InkWell(
            key: ValueKey("btnLogin"),
            onTap: submit,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                color: Warna.warnaUtama,
              ),
              child: Center(
                child: Text("Login",
                    style: OpenSansRegular13.copyWith(
                      fontSize: 16,
                      color: Colors.white,
                    )),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: 32,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.white.withOpacity(0.1),
                  Color(0xFF4285F4),
                ],
              )),
          height: 2,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8, top: 24.0),
          child: InkWell(
            onTap: () => Get.off(register_screen()),
            child: RichText(
              text: TextSpan(
                style: OpenSansSemiBold14.copyWith(
                  color: Colors.white,
                ),
                children: [
                  TextSpan(
                    text: "Don't have an account?",
                  ),
                  TextSpan(
                    text: ' Sign Up',
                    style: OpenSansBold14.copyWith(
                      color: Warna.warnaUtama,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 40,
          ),
          child: Text(
            "Forgot Password?",
            style: OpenSansBold14.copyWith(
              color: Warna.warnaUtama,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
