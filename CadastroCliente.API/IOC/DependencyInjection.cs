namespace CadastroCliente.API.IOC;

public static class DependencyInjection
{
    public static IServiceCollection AddDependencyInjection(this IServiceCollection services, IConfiguration configuration)
    {
        var connectionString = configuration.GetConnectionString("Database");
        var versionDb = ServerVersion.AutoDetect(connectionString);

        services.AddDbContext<ApplicationDataContext>(options =>
            options.UseMySql(connectionString, versionDb,
                b => b.MigrationsAssembly(typeof(ApplicationDataContext).Assembly.FullName))
        );

        services.AddScoped<IPessoaRepository, PessoaRepository>();

        return services;
    }
}
