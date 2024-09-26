namespace CadastroCliente.API.Domain.Entities;

public sealed class PessoaEntity : EntityBase<Guid>
{
    public string Nome { get; set; } = default!;
    public string Email { get; set; } = default!;
    public DateTime DtNascimento { get; set; }
    public string Cpf { get; set; } = default!;
    public byte[] Hash { get; set; } = default!;
    public byte[] Salt { get; set; } = default!;

    public EnderecoEntity Endereco { get; set; } = default!;
}
