namespace CadastroCliente.API.Features.V1.Listagem;

public class ListagemHandler (IPessoaRepository pessoaRepository)
    : IRequestHandler<ListagemQuery, IEnumerable<ListagemResult>>
{
    public async Task<IEnumerable<ListagemResult>> Handle(ListagemQuery query, CancellationToken cancellationToken)
    {
        var entity = await pessoaRepository.ListRepository();

        var response = entity.Adapt<IEnumerable<ListagemResult>>();

        return response;
    }
}
