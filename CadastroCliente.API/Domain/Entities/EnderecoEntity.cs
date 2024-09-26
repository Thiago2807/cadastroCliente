namespace CadastroCliente.API.Domain.Entities;

public sealed class EnderecoEntity : EntityBase<Guid>
{
    public Guid PessoaId { get; set; }
    public PessoaEntity? Pessoa { get; set; }


    public string Cep { get; set; } = default!;
    public string Logradouro { get; set; } = default!;
    public string Complemento { get; set; } = default!;
    public string Unidade { get; set; } = default!;
    public string Bairro { get; set; } = default!;
    public string Localidade { get; set; } = default!;
    public string Uf { get; set; } = default!;
    public string Estado { get; set; } = default!;
    public string Regiao { get; set; } = default!;
    public string Ibge { get; set; } = default!;
    public string Gia { get; set; } = default!;
    public string Ddd { get; set; } = default!;
    public string Siafi { get; set; } = default!;
}
