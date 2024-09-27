namespace CadastroCliente.API.Application.CQRS.Queries;

public record LoginQuery (string Email, string Senha)
    : IRequest<LoginResult>;

public record LoginResult
{
    public string Nome { get; set; } = default!;
    public string Cpf { get; set; } = default!;
    public string Email { get; set; } = default!;
    public string Token { get; set; } = default!;
};

public class LoginQueryValid : AbstractValidator<LoginQuery>
{
    public LoginQueryValid()
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