namespace CadastroCliente.API.IOC.Data;

public class ApplicationDataContext (DbContextOptions<ApplicationDataContext> options)
    : DbContext(options)
{
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);
    }
}
