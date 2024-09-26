namespace CadastroCliente.API.Domain.Entities;

public class EntityBase<T>
{
    public T Id { get; set; } = default!;
    public DateTime DtCriacao { get; set; } = DateTime.UtcNow;
}
