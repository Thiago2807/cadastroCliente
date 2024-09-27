namespace CadastroCliente.API.IOC.Data;

public class ApplicationDataContext (DbContextOptions<ApplicationDataContext> options)
    : DbContext(options)
{
    public DbSet<EnderecoEntity> Enderecos { get; set; }
    public DbSet<PessoaEntity> Pessoas { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);

        modelBuilder.ApplyConfigurationsFromAssembly(typeof(ApplicationDataContext).Assembly);
    }
}
