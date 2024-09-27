namespace CadastroCliente.API.Application.CQRS.Queries;

public record ListagemQuery : IRequest<IEnumerable<ListagemResult>>;


public record ListagemResult(
        Guid Id,
        string Nome,
        string Cpf,
        string Email,
        DateTime DtNascimento,
        AddEnderecoCommand Endereco
    );

public record ListagemEnderecoResult(
        Guid Id,
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
    );