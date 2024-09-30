import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl/intl.dart';

class FormValidation {
  static final emailValidator = MultiValidator([
    RequiredValidator(errorText: 'E-mail é obrigatório'),
    EmailValidator(errorText: 'Insira um e-mail válido'),
  ]);

  static final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'Senha é obrigatória'),
    MinLengthValidator(8, errorText: 'A senha deve ter no mínimo 8 caracteres'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'A senha deve conter pelo menos um caractere especial'),
  ]);

  static String? requiredCamp(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }

  static String? validateDateOfBirth(String? value) {
    if (value == null || value.isEmpty) {
      return 'A data de nascimento é obrigatória';
    }

    DateFormat dateFormat = DateFormat('dd/MM/yyyy'); // Formato DD/MM/AAAA
    DateTime? enteredDate;

    try {
      enteredDate = dateFormat.parseStrict(value); // Converte a string para DateTime
    } catch (e) {
      return 'Formato de data inválido (use DD/MM/AAAA)';
    }

    DateTime currentDate = DateTime.now();

    if (enteredDate.isAfter(currentDate)) {
      return 'A data de nascimento não pode ser no futuro';
    }

    return null;
  }

  static String _stripCpf(String cpf) => cpf.replaceAll(RegExp(r'\D'), '');

  static String? validateCPF(String? value) {
    if (value == null || value.isEmpty) {
      return 'CPF é obrigatório';
    }

    String cpf = _stripCpf(value);

    if (cpf.length != 11) {
      return 'O CPF deve ter 11 dígitos';
    }

    if (RegExp(r'^(\d)\1*$').hasMatch(cpf)) {
      return 'CPF inválido';
    }

    // Validação dos dígitos verificadores
    if (!_validateCpfDigits(cpf)) {
      return 'CPF inválido';
    }

    return null;
  }

  static bool _validateCpfDigits(String cpf) {
    List<int> numbers = cpf.split('').map((e) => int.parse(e)).toList();

    int sum = 0;
    for (int i = 0; i < 9; i++) {
      sum += numbers[i] * (10 - i);
    }
    int firstCheckDigit = (sum * 10) % 11;
    if (firstCheckDigit == 10 || firstCheckDigit == 11) firstCheckDigit = 0;

    if (numbers[9] != firstCheckDigit) return false;

    sum = 0;
    for (int i = 0; i < 10; i++) {
      sum += numbers[i] * (11 - i);
    }
    int secondCheckDigit = (sum * 10) % 11;
    if (secondCheckDigit == 10 || secondCheckDigit == 11) secondCheckDigit = 0;

    if (numbers[10] != secondCheckDigit) return false;

    return true;
  }
}