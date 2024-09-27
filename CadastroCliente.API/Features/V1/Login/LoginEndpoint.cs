namespace CadastroCliente.API.Features.V1.Login;

public class LoginEndpoint : ICarterModule
{
    public void AddRoutes(IEndpointRouteBuilder app)
    {
        app.MapPost("/api/v1/pessoa/login", async (LoginQuery request, ISender sender) =>
        {
            var response = await sender.Send(request);

            return Results.Ok(response);
        })
        .WithName("Login");
    }
}
