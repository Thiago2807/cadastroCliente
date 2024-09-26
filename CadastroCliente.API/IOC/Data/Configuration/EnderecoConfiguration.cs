namespace CadastroCliente.API.IOC.Data.Configuration;

public class EnderecoConfiguration : IEntityTypeConfiguration<EnderecoEntity>
{
    public void Configure(EntityTypeBuilder<EnderecoEntity> builder)
    {
        builder.HasKey(pk => pk.Id);

        builder.HasOne(one => one.Pessoa)
            .WithOne(one => one.Endereco)
            .HasForeignKey<EnderecoEntity>(fk => fk.PessoaId);

        builder.Property(prop => prop.Cep)
            .HasMaxLength(9)
            .IsRequired(true);

        builder.Property(prop => prop.Logradouro)
            .HasMaxLength(100)
            .IsRequired(true);

        builder.Property(prop => prop.Complemento)
            .HasMaxLength(50)
            .IsRequired(false);

        builder.Property(prop => prop.Unidade)
            .HasMaxLength(10)
            .IsRequired(false);

        builder.Property(prop => prop.Bairro)
            .HasMaxLength(50)
            .IsRequired(true);

        builder.Property(prop => prop.Localidade)
            .HasMaxLength(100)
            .IsRequired(true);

        builder.Property(prop => prop.Uf)
            .HasMaxLength(2)
            .IsRequired(true);

        builder.Property(prop => prop.Estado)
            .HasMaxLength(100)
            .IsRequired(true);

        builder.Property(prop => prop.Regiao)
            .HasMaxLength(20)
            .IsRequired(true);

        builder.Property(prop => prop.Ibge)
            .HasMaxLength(7)
            .IsRequired(true);

        builder.Property(prop => prop.Gia)
            .HasMaxLength(9)
            .IsRequired(false);

        builder.Property(prop => prop.Ddd)
            .HasMaxLength(3)
            .IsRequired(true);

        builder.Property(prop => prop.Siafi)
            .HasMaxLength(10)
            .IsRequired(true);
    }
}
