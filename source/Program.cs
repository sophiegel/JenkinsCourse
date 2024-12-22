var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

var who = Environment.GetEnvironmentVariable("WHO") ?? "Georgia";
app.MapGet("/", () => $"Hello {who}");
app.Run();
