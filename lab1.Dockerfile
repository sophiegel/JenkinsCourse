# Set runtime version using ARG
ARG DOTNET_VERSION=8.0

# Stage 1: Build
FROM mcr.microsoft.com/dotnet/sdk:${DOTNET_VERSION}-alpine AS build
WORKDIR /app

# Copy source files
COPY source/ . 

# Build the application
RUN dotnet build app1.csproj -o /output

# Stage 2: Runtime
FROM mcr.microsoft.com/dotnet/aspnet:${DOTNET_VERSION}-alpine AS runtime

# Use ARG to set an environment variable
ENV WHO=${WHO}

# Set an explicit folder and user
WORKDIR /app
RUN adduser -D ubuntu
USER ubuntu

# Copy the built files from the build stage
COPY --from=build /output/ .

# Use WHO variable in the app
ENTRYPOINT ["dotnet", "app1.dll"]

# Expose a port
EXPOSE 8080

