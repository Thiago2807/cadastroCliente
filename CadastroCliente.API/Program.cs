var builder = WebApplication.CreateBuilder(args);

builder.Services.AddCarter();

builder.Services
    .AddDependencyInjection(builder.Configuration)
    .AddValidatorsFromAssembly(typeof(Program).Assembly)
    .AddJWTConfiguration(builder.Configuration);

builder.Services.AddMediatR(config =>
{
    config.RegisterServicesFromAssembly(typeof(Program).Assembly);
    config.AddOpenBehavior(typeof(ValidationBehavior<,>));
});

builder.Services.AddExceptionHandler<ExceptionHandler>();

builder.Services.AddAuthorization();

var app = builder.Build();

app.MapCarter();

app.UseExceptionHandler(options => { });

app.UseAuthentication();
app.UseAuthorization();

app.Run();
