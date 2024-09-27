var builder = WebApplication.CreateBuilder(args);

builder.Services.AddDependencyInjection(builder.Configuration);

builder.Services.AddExceptionHandler<ExceptionHandler>();

var app = builder.Build();

app.UseExceptionHandler(options => { });

app.Run();
