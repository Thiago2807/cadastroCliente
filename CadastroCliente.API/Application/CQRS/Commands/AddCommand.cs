namespace CadastroCliente.API.Application.CQRS.Commands;

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
    }
}

public record AddCommand (string Email, string Senha, AddEnderecoCommand Endereco)
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