namespace CadastroCliente.API.Application.CQRS.Commands;

public record AddCommand (
        string Nome,
        string Cpf,
        DateTime DtNascimento,
        string Email, 
        string Senha, 
        AddEnderecoCommand Endereco
    )
    : IRequest<AddResult>;

public record AddEnderecoCommand(
        string Cep,
        string Logradouro,
        string Complemento,
        string Unidade,
        string Bairro,
        string Localidade,
        string Uf,
        string Estado,
        string Regiao,
        string Ibge,
        string Gia,
        string Ddd,
        string Siafi
    ): IRequest<AddResult>;

public record AddResult(Guid Id, string Email);


public class AddCommandValid : AbstractValidator<AddCommand>
{
    public AddCommandValid()
    {
        RuleFor(prop => prop.Email)
            .NotEmpty().WithMessage("O campo 'Email' não pode ser vazio.")
            .NotNull().WithMessage("O campo 'Email' precisa ser informado.")
            .EmailAddress().WithMessage("E-mail inválido.");

        RuleFor(prop => prop.Senha)
            .NotEmpty().WithMessage("O campo 'Senha' não pode ser vazio.")
            .NotNull().WithMessage("O campo 'Senha' precisa ser informado.");

        RuleFor(prop => prop.DtNascimento)
            .NotEmpty().WithMessage("O campo 'DtNascimento' não pode ser vazio.")
            .NotNull().WithMessage("O campo 'DtNascimento' precisa ser informado.");

        RuleFor(prop => prop.Cpf)
            .NotEmpty().WithMessage("O campo 'Cpf' não pode ser vazio.")
            .NotNull().WithMessage("O campo 'Cpf' precisa ser informado.")
            .Must(ValidUtility.ValidarCpf).WithMessage("Cpf inválido, verifique e tente novamente.");

        // ------------------------ Endereço

        RuleFor(prop => prop.Endereco.Cep)
            .NotEmpty().WithMessage("O campo 'Cep' não pode ser vazio.")
            .NotNull().WithMessage("O campo 'Cep' precisa ser informado.")
            .MaximumLength(9).WithMessage("Tamanho do campo 'Cep' maior que o permitido");

        RuleFor(prop => prop.Endereco.Logradouro)
            .NotEmpty().WithMessage("O campo 'Logradouro' não pode ser vazio.")
            .NotNull().WithMessage("O campo 'Logradouro' precisa ser informado.")
            .MaximumLength(100).WithMessage("Tamanho do campo 'Logradouro' maior que o permitido");

        RuleFor(prop => prop.Endereco.Unidade)
            .NotEmpty().WithMessage("O campo 'Unidade' não pode ser vazio.")
            .NotNull().WithMessage("O campo 'Unidade' precisa ser informado.")
            .MaximumLength(10).WithMessage("Tamanho do campo 'Unidade' maior que o permitido");

        RuleFor(prop => prop.Endereco.Bairro)
            .NotEmpty().WithMessage("O campo 'Bairro' não pode ser vazio.")
            .NotNull().WithMessage("O campo 'Bairro' precisa ser informado.")
            .MaximumLength(50).WithMessage("Tamanho do campo 'Cep' maior que o permitido");

        RuleFor(prop => prop.Endereco.Localidade)
            .NotEmpty().WithMessage("O campo 'Localidade' não pode ser vazio.")
            .NotNull().WithMessage("O campo 'Localidade' precisa ser informado.")
            .MaximumLength(100).WithMessage("Tamanho do campo 'Localidade' maior que o permitido");

        RuleFor(prop => prop.Endereco.Uf)
            .NotEmpty().WithMessage("O campo 'Uf' não pode ser vazio.")
            .NotNull().WithMessage("O campo 'Uf' precisa ser informado.")
            .Length(2).WithMessage("O campo 'Uf' deve ter 2 caracteres.");

        RuleFor(prop => prop.Endereco.Estado)
            .NotEmpty().WithMessage("O campo 'Estado' não pode ser vazio.")
            .NotNull().WithMessage("O campo 'Estado' precisa ser informado.")
            .MaximumLength(100).WithMessage("Tamanho do campo 'Estado' maior que o permitido");

        RuleFor(prop => prop.Endereco.Regiao)
            .NotEmpty().WithMessage("O campo 'Regiao' não pode ser vazio.")
            .NotNull().WithMessage("O campo 'Regiao' precisa ser informado.")
            .MaximumLength(20).WithMessage("Tamanho do campo 'Regiao' maior que o permitido");

        RuleFor(prop => prop.Endereco.Ibge)
            .NotEmpty().WithMessage("O campo 'Ibge' não pode ser vazio.")
            .NotNull().WithMessage("O campo 'Ibge' precisa ser informado.")
            .MaximumLength(7).WithMessage("Tamanho do campo 'Ibge' maior que o permitido");

        RuleFor(prop => prop.Endereco.Gia)
            .NotEmpty().WithMessage("O campo 'Gia' não pode ser vazio.")
            .NotNull().WithMessage("O campo 'Gia' precisa ser informado.")
            .MaximumLength(9).WithMessage("Tamanho do campo 'Gia' maior que o permitido");

        RuleFor(prop => prop.Endereco.Ddd)
            .NotEmpty().WithMessage("O campo 'Ddd' não pode ser vazio.")
            .NotNull().WithMessage("O campo 'Ddd' precisa ser informado.")
            .MaximumLength(3).WithMessage("Tamanho do campo 'Ddd' maior que o permitido");

        RuleFor(prop => prop.Endereco.Siafi)
            .NotEmpty().WithMessage("O campo 'Siafi' não pode ser vazio.")
            .NotNull().WithMessage("O campo 'Siafi' precisa ser informado.")
            .MaximumLength(10).WithMessage("Tamanho do campo 'Siafi' maior que o permitido");
    }
}