namespace CadastroCliente.API.IOC;

public class ValidationBehavior<TRequest, TResponse>(IEnumerable<IValidator<TRequest>> validations)
    : IPipelineBehavior<TRequest, TResponse> where TRequest : IRequest<TResponse>
{
    public async Task<TResponse> Handle(TRequest request, RequestHandlerDelegate<TResponse> next, CancellationToken cancellationToken)
    {
        var context = new ValidationContext<TRequest>(request);

        var validationsResults = await Task.WhenAll(validations.Select(v => v.ValidateAsync(context, cancellationToken)));

        var failures = validationsResults
            .Where(r => r.Errors.Count != 0)
            .SelectMany(r => r.Errors)
            .FirstOrDefault();

        if (failures != null)
            throw new ValidationException(failures.ErrorMessage);

        return await next();
    }
}