namespace CadastroCliente.API.IOC;

public class ExceptionHandler : IExceptionHandler
{
    public async ValueTask<bool> TryHandleAsync(HttpContext context, Exception exception, CancellationToken cancellationToken)
    {
        (string Detalhes, string Titulo, int StatusCode) = exception switch
        {
            NotFoundException =>
            (
                exception.Message,
                exception.GetType().Name,
                StatusCodes.Status404NotFound
            ),
            BadRequestException =>
            (
                exception.Message,
                exception.GetType().Name,
                StatusCodes.Status400BadRequest
            ),
            InternetServerErrorException =>
            (
                exception.Message,
                exception.GetType().Name,
                StatusCodes.Status500InternalServerError
            ),
            _ =>
            (
                exception.Message,
                exception.GetType().Name,
                StatusCodes.Status500InternalServerError
            )
        };

        var detalhesProblema = new ProblemDetails
        {
            Title = Titulo,
            Detail = Detalhes,
            Status = StatusCode,
            Instance = context.Request.Path
        };

        context.Response.StatusCode = StatusCode;
        await context.Response.WriteAsJsonAsync(detalhesProblema, cancellationToken: cancellationToken);

        return true;
    }
}
