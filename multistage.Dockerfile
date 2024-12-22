# Stage 1: Build
FROM mcr.microsoft.com/dotnet/sdk:8.0-alpine as build
WORKDIR /app
COPY source/ . 
RUN dotnet build app1.csproj -o /output

# Stage 2: Runtime
FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine
WORKDIR /app
COPY --from=build /output . 
ENTRYPOINT ["dotnet", "app1.dll"]

