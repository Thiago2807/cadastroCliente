class FormatData {
  static String formatCpf(String cpf) {
    cpf = cpf.replaceAll(RegExp(r'[^0-9]'), '');

    if (cpf.length > 11) {
      cpf = cpf.substring(0, 11);
    }

    if (cpf.length >= 3 && cpf.length <= 5) {
      return '${cpf.substring(0, 3)}.${cpf.substring(3)}';
    } else if (cpf.length >= 6 && cpf.length <= 8) {
      return '${cpf.substring(0, 3)}.${cpf.substring(3, 6)}.${cpf.substring(6)}';
    } else if (cpf.length >= 9) {
      return '${cpf.substring(0, 3)}.${cpf.substring(3, 6)}.${cpf.substring(6, 9)}-${cpf.substring(9)}';
    }

    return cpf;
  }
}