namespace CadastroCliente.API.IOC.Data.Configuration;

public class PessoaConfiguration : IEntityTypeConfiguration<PessoaEntity>
{
    public void Configure(EntityTypeBuilder<PessoaEntity> builder)
    {
        builder.HasKey(pk => pk.Id);

        builder.Property(prop => prop.Nome)
            .HasMaxLength(100)
            .IsRequired(true);

        builder.Property(prop => prop.Email)
            .HasMaxLength(100)
            .IsRequired(true);

        builder.Property(prop => prop.DtNascimento)
            .IsRequired(true);

        builder.Property(prop => prop.Cpf)
            .HasMaxLength(11)
            .IsRequired(true);

        builder.Property(prop => prop.Hash)
            .IsRequired(true);

        builder.Property(prop => prop.Salt)
            .IsRequired(true);

        builder.HasIndex(index => index.Cpf)
            .IsUnique(true);
    }
}
