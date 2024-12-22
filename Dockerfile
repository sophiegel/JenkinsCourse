FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine
COPY . .
ENTRYPOINT ["dotnet", "app1.dll"]
