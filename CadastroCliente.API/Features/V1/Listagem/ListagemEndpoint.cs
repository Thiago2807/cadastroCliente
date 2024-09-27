namespace CadastroCliente.API.Features.V1.Listagem;

public class ListagemEndpoint : ICarterModule
{
    public void AddRoutes(IEndpointRouteBuilder app)
    {
        app.MapGet("/api/v1/pessoa", async (ISender sender) =>
        {
            var response = await sender.Send(new ListagemQuery());

            return Results.Ok(response);
        })
        .WithName("Listagem")
        .RequireAuthorization();
    }
}
