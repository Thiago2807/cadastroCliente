namespace CadastroCliente.API.IOC.Data.Repository;

public class PessoaRepository (ApplicationDataContext context)
    : IPessoaRepository
{
    public async Task AddRepository(PessoaEntity entity)
    {
        await context.Pessoas.AddAsync(entity);
        await context.SaveChangesAsync();
    }

    public async Task<PessoaEntity> GetRepository(string email)
    {
        var result = await context.Pessoas.AsNoTracking().FirstOrDefaultAsync(x => x.Email == email);

        if (result == null)
            throw new NotFoundException("Não encontramos um usuário com o e-mail informado.");

        return result;
    }

    public async Task<IEnumerable<PessoaEntity>> ListRepository()
    {
        var result = await context.Pessoas.AsNoTracking().ToListAsync();

        return result;
    }
}
