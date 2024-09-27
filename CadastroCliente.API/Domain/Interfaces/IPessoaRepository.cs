namespace CadastroCliente.API.Domain.Interfaces;

public interface IPessoaRepository
{
    Task AddRepository(PessoaEntity entity);
    Task<PessoaEntity> GetRepository(string email);
    Task<IEnumerable<PessoaEntity>> ListRepository();
}
