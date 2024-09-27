namespace CadastroCliente.API.IOC.Data.Repository;

public class PessoaRepository (ApplicationDataContext context)
    : IPessoaRepository
{
    public async Task AddRepository(PessoaEntity entity)
    {
        await context.Pessoas.AddAsync(entity);
        var result = await context.SaveChangesAsync();

        if (result <= 0)
            throw new InternetServerErrorException("Não foi possível criar o usuário, verifique e tente novamente.");
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
        var result = await context.Pessoas
            .AsNoTracking()
            .Include(x => x.Endereco)
            .ToListAsync();

        return result;
    }

    public async Task VerificarUsuario(string email = "", string cpf = "")
    {
        List<Expression<Func<PessoaEntity, bool>>> expressions = [
            (x => x.Email == email),
            (x => x.Cpf == cpf)
        ];

        for (int i = 0; i < expressions.Count; i++)
        {
            bool response = await context.Pessoas.AnyAsync(expressions[i]);

            if (response)
                throw new BadRequestException($"Usuário já cadastrado, campo: {(i == 0 ? "E-mail" : "Cpf")}");
        }
    }
}
