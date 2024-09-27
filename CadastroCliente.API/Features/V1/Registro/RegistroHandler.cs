namespace CadastroCliente.API.Features.V1.Registro;

public class RegistroHandler(IPessoaRepository pessoaRepository)
    : IRequestHandler<AddCommand, AddResult>
{
    public Task<AddResult> Handle(AddCommand command, CancellationToken cancellationToken)
    {
        // Converter dados de entrada para a entitidade


        // Gerar Salt
        // Gerar Hash

        // Adicionar no objeto esses dados

        // Adicionar no banco de dados

        // Retornar e-mail e código do usuario
        throw new NotImplementedException();
    }
}
