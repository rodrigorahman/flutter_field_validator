import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final formKey = GlobalKey<FormState>();
  final emailKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  key: emailKey,
                  decoration: InputDecoration(labelText: 'E-mail'),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'E-mail Obrigatório';
                    }
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Senha'),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Senha Obrigatório';
                    }
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      formKey.currentState?.validate();
                    },
                    child: Text('Login')),
                TextButton(
                  onPressed: () async {
                    formKey.currentState?.reset();
                    await Future.delayed(Duration(seconds: 1));
                    emailKey.currentState?.validate();
                  },
                  child: Text('Esqueceu sua senha'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
