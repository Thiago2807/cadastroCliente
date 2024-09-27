namespace CadastroCliente.API.Application.Utility;

public static class ValidUtility
{
    public static bool ValidarCpf(string cpf)
    {
        // Remove caracteres especiais como pontos e traços
        cpf = cpf.Replace(".", "").Replace("-", "");

        // Verifica se o CPF tem 11 dígitos e se não são todos iguais
        if (cpf.Length != 11 || cpf.All(c => c == cpf[0]))
            return false;

        // Converte o CPF para um array de inteiros
        int[] cpfArray = cpf.Select(c => int.Parse(c.ToString())).ToArray();

        // Validação do primeiro dígito verificador
        int soma = 0;
        for (int i = 0; i < 9; i++)
            soma += cpfArray[i] * (10 - i);

        int resto = soma % 11;
        int primeiroDigitoVerificador = (resto < 2) ? 0 : 11 - resto;

        if (cpfArray[9] != primeiroDigitoVerificador)
            return false;

        // Validação do segundo dígito verificador
        soma = 0;
        for (int i = 0; i < 10; i++)
            soma += cpfArray[i] * (11 - i);

        resto = soma % 11;
        int segundoDigitoVerificador = (resto < 2) ? 0 : 11 - resto;

        if (cpfArray[10] != segundoDigitoVerificador)
            return false;

        return true;
    }
}
