# Movies — ASP.NET Core MVC

A movie web application using ASP.NET Core MVC, Entity Framework Core and SQL Server.

## Technologies

- C# and ASP.NET Core, targeting .NET 6.
- MVC controllers, models and Razor views.
- Entity Framework Core 6 with the SQL Server provider.

## Structure

- `Movies/Controllers/`: HTTP request handling.
- `Movies/Models/` and `Movies/Data/`: data models and persistence.
- `Movies/Views/`: rendered pages.
- `Movies/wwwroot/`: static assets.
- `MovieHubDB.sql`: included SQL database script.

## Local setup

Install the .NET 6 SDK and SQL Server, review the database script and configure a local connection string for your environment. Then run:

```bash
dotnet restore Movies/Movies.csproj
dotnet run --project Movies/Movies.csproj
```

Use the localhost URL printed by the application. Store local credentials outside committed configuration.
