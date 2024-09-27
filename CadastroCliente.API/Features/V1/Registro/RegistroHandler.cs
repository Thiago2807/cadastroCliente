namespace CadastroCliente.API.Features.V1.Registro;

public class RegistroHandler(IPessoaRepository pessoaRepository)
    : IRequestHandler<AddCommand, AddResult>
{
    public async Task<AddResult> Handle(AddCommand command, CancellationToken cancellationToken)
    {
        await pessoaRepository.VerificarUsuario(command.Email, command.Cpf);

        // Converter dados de entrada para a entitidade
        var entity = command.Adapt<PessoaEntity>();

        // Gerar Salt
        entity.Salt = HashHelper.GerarSalt();

        // Gerar Hash
        entity.Hash = HashHelper.GerarHash(command.Senha, entity.Salt);

        // Adicionar no banco de dados
        await pessoaRepository.AddRepository(entity);

        return new AddResult(entity.Id, entity.Email);
    }
}
