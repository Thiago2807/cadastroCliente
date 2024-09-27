namespace CadastroCliente.API.Features.V1.Registro;

public class RegistroEndpoint : ICarterModule
{
    public void AddRoutes(IEndpointRouteBuilder app)
    {
        app.MapPost("/api/v1/pessoa/registro", async (AddCommand request, ISender sender) =>
        {
            var response = await sender.Send(request);

            return Results.Created("", response);
        })
        .WithName("Add");
    }
}
