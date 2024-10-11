import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Pengguna',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Form Pengguna'),
        ),
        body: FormScreen(),
      ),
    );
  }
}

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Nama Pengguna'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Nama pengguna tidak boleh kosong';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Kata Sandi'),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Kata sandi tidak boleh kosong';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(labelText: 'Konfirmasi Kata Sandi'),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Konfirmasi kata sandi tidak boleh kosong';
                }
                if (value != _passwordController.text) {
                  return 'Kata sandi tidak cocok';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Form sudah benar!')),
                  );
                }
              },
              child: Text('Kirim'),
            ),
          ],
        ),
      ),
    );
  }
}
