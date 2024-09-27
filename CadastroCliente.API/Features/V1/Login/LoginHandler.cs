namespace CadastroCliente.API.Features.V1.Login;

public class LoginHandler (IPessoaRepository pessoaRepository, IConfiguration configuration)
    : IRequestHandler<LoginQuery, LoginResult>
{
    public async Task<LoginResult> Handle(LoginQuery query, CancellationToken cancellationToken)
    {
        var entity = await pessoaRepository.GetRepository(query.Email);

        var responseValid = HashHelper.VerificarSenha(query.Senha, entity.Salt, entity.Hash);

        if (!responseValid)
            throw new BadRequestException("A senha informada está incorreta. Por favor, verifique e tente novamente.");

        var response = entity.Adapt<LoginResult>();

        // Adicionar o Token aqui
        response.Token = JWTUtility.GenerateJwtToken(configuration, entity);

        return response;
    }
}
