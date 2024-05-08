import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:kajiansunnah/architectures/domain/entities/UserRegistration.dart';
import 'package:kajiansunnah/bloc/user_login/bloc.dart';
import 'package:kajiansunnah/bloc/user_login/user_login_bloc.dart';
import 'package:kajiansunnah/bloc/user_register/bloc.dart';
import 'package:kajiansunnah/bloc/user_register/user_register_bloc.dart';
import 'package:kajiansunnah/screens/login/login_screen.dart';
import 'package:kajiansunnah/screens/register/register_screen.dart';
import 'package:kajiansunnah/theme/colors/Warna.dart';
import 'package:kajiansunnah/theme/styles/text/opensans_style_text.dart';
import 'package:kajiansunnah/widgets/LoginHeader.dart';
import 'package:kajiansunnah/widgets/TampilanDialog.dart';

class register_form extends StatefulWidget {
  final UserRegistration? userRegistration;
  final String message;
  const register_form({
    super.key,
    this.userRegistration,
    this.message = "",
  });

  @override
  State<register_form> createState() => _register_formState();
}

class _register_formState extends State<register_form> {
  List<String> genders = ["male", "female"];
  String selectedGender = "male";
  var tec_name = new TextEditingController();
  var tec_email = new TextEditingController();
  var tec_password = new TextEditingController();
  var tec_confirm_password = new TextEditingController();
  var tec_phone = new TextEditingController();
  var tec_address = new TextEditingController();
  @override
  void initState() {
    if (!kReleaseMode) {
      tec_name.text = "Tes Register";
      tec_email.text = "tesregister@gmail.com";
      tec_password.text = "P!ntu123";
      tec_confirm_password.text = "P!ntu123";
      tec_phone.text = "08223331233";
      selectedGender = "male";
      tec_address.text =
          "Jalan kaki sehat gang luas sejahtera RT nol satu RW nol tiga kecamatan abakadabra kelurahan asik tenan";
    } else if (widget.userRegistration != null) {
      tec_name.text = widget.userRegistration!.name;
      tec_email.text = widget.userRegistration!.email;
      tec_password.text = widget.userRegistration!.password;
      tec_confirm_password.text = widget.userRegistration!.confirmPassword;
      tec_phone.text = widget.userRegistration!.phone;
      selectedGender = widget.userRegistration!.gender;
      tec_address.text = widget.userRegistration!.address;
    }
    super.initState();
  }

  void submit() {
    try {
      if (tec_name.text.isEmpty ||
          tec_email.text.isEmpty ||
          tec_password.text.isEmpty ||
          tec_confirm_password.text.isEmpty ||
          tec_phone.text.isEmpty ||
          tec_address.text.isEmpty) {
        throw ("Isian tidak valid");
      }
    } catch (e) {
      TampilanDialog.showDialogAlert(e.toString());
      return;
    }
    BlocProvider.of<UserRegisterBloc>(context).add(UserRegisterBlocStart(
        userRegistration: UserRegistration(
      name: tec_name.text,
      email: tec_email.text,
      password: tec_password.text,
      confirmPassword: tec_confirm_password.text,
      phone: tec_phone.text,
      gender: selectedGender,
      address: tec_address.text,
    )));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        LoginHeader(),
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: TextField(
            controller: tec_name,
            style: OpenSansRegular11,
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
              hintText: "Enter your name",
              fillColor: Colors.white,
              isDense: true,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: TextField(
            controller: tec_email,
            style: OpenSansRegular11,
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
              hintText: "Enter your email",
              fillColor: Colors.white,
              isDense: true,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: TextField(
            controller: tec_password,
            style: OpenSansRegular11,
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
        Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: TextField(
            controller: tec_confirm_password,
            style: OpenSansRegular11,
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
              hintText: "Confirm your password",
              fillColor: Colors.white,
              isDense: true,
            ),
            obscureText: true,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: TextField(
            controller: tec_phone,
            style: OpenSansRegular11,
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
              hintText: "Confirm your phone",
              fillColor: Colors.white,
              isDense: true,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: DropdownButtonFormField(
            value: selectedGender,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 12,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              filled: true,
              fillColor: Colors.white,
              hintStyle: OpenSansRegular14.copyWith(
                color: Colors.grey,
              ),
              isDense: true,
              hintText: "Gender",
            ),
            icon: const Icon(Icons.arrow_drop_down),
            iconSize: 24,
            style: TextStyle(color: Colors.grey[700], fontSize: 16),
            items: genders.map<DropdownMenuItem>((value) {
              return DropdownMenuItem(
                value: value,
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    value,
                    style: OpenSansMedium14.copyWith(
                      color: Warna.fieldValue,
                    ),
                  ),
                ),
              );
            }).toList(),
            onChanged: (value) {
              selectedGender = value;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: TextField(
            controller: tec_address,
            style: OpenSansRegular11,
            keyboardType: TextInputType.multiline,
            maxLines: 4,
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
              hintText: "Address",
              fillColor: Colors.white,
              isDense: true,
            ),
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
                child: Text("Register",
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
            onTap: () => Get.off(login_screen()),
            child: RichText(
              text: TextSpan(
                style: OpenSansSemiBold14.copyWith(
                  color: Colors.white,
                ),
                children: [
                  TextSpan(
                    text: "Already have an account?",
                  ),
                  TextSpan(
                    text: ' Sign In',
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
