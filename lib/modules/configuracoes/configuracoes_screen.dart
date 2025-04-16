import 'package:flutter/material.dart';

class ConfiguracoesScreen extends StatefulWidget {
  @override
  _ConfiguracoesScreenState createState() => _ConfiguracoesScreenState();
}

class _ConfiguracoesScreenState extends State<ConfiguracoesScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedOption;
  String? _selectedOptionRadio;
  double _selectedSlider = 0.0;
  bool _isCheckedCheckBox = false;
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // TextFormField with basic style
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Campo de Texto Simples',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),

              // TextFormField with custom style
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Campo de Texto com Ícone',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: 16),
              // DropdownButtonFormField
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Selecione uma Opção',
                  border: OutlineInputBorder(),
                ),
                value: _selectedOption,
                items: ['Opção 1', 'Opção 2', 'Opção 3']
                    .map((option) => DropdownMenuItem(
                          value: option,
                          child: Text(option),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedOption = value;
                  });
                },
              ),
              SizedBox(height: 16),
              // Checkbox
              CheckboxListTile(
                title: Text('Marcar esta opção'),
                value: _isCheckedCheckBox,
                onChanged: (value) {
                  setState(() {
                    _isCheckedCheckBox = value!;
                  });
                },
              ),
                // Radio buttons
                Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Escolha uma opção:'),
                  ListTile(
                  title: Text('Opção A'),
                  leading: Radio<String>(
                    value: 'A',
                    groupValue: _selectedOptionRadio,
                    onChanged: (value) {
                    setState(() {
                      _selectedOptionRadio = value;
                    });
                    },
                  ),
                  ),
                  ListTile(
                  title: Text('Opção B'),
                  leading: Radio<String>(
                    value: 'B',
                    groupValue: _selectedOptionRadio,
                    onChanged: (value) {
                    setState(() {
                      _selectedOptionRadio = value;
                    });
                    },
                  ),
                  ),
                ],
                ),
                SizedBox(height: 16),

                // Switch
                SwitchListTile(
                title: Text('Ativar Configuração'),
                value: _isChecked,
                onChanged: (value) {
                  setState(() {
                  _isChecked = value;
                  });
                },
                ),
                SizedBox(height: 16),

                // Slider
                Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Ajuste o valor:'),
                  Slider(
                  value: _selectedSlider,
                  min: 0,
                  max: 100,
                  divisions: 10,
                  label: _selectedSlider.round().toString(),
                  onChanged: (value) {
                    setState(() {
                      _selectedSlider = value;
                    });
                  },
                  ),
                ],
                ),
                SizedBox(height: 16),
                // Date Picker
                ElevatedButton(
                onPressed: () async {
                  DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Data selecionada: $pickedDate')),
                  );
                  }
                },
                child: Text('Selecionar Data'),
                ),
                SizedBox(height: 16),

                // Time Picker
                ElevatedButton(
                onPressed: () async {
                  TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                  );
                  if (pickedTime != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Hora selecionada: $pickedTime')),
                  );
                  }
                },
                child: Text('Selecionar Hora'),
                ),
                SizedBox(height: 16),
              // ElevatedButton to submit
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Formulário enviado!')),
                    );
                  }
                },
                child: Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}