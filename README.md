# Introduction 
.net6 C# Sample App - A modern distributed DDD service api template

# Getting Started
1.	Clone, set the startup project to Api/AmpleApp.Api, and run - swagger page opens, using the same port and root folder shows a basic js UI
2.	Run tests (Test.UI & Test.SpecFlow.Specs UI feature tests require the app to be running in order to run the Selenium UI tests)

# Notes
1. Started from Microsoft's Todo sample api (https://docs.microsoft.com/en-us/aspnet/core/tutorials/first-web-api?view=aspnetcore-6.0&tabs=visual-studio)
2. This sample uses Entity Framework Core in-memory DbContext, so restarting the app clears the DB
3. This solution provides a possible starting template for building service apis and is not production-ready (in-memory database, no authentication, etc)
4. Package.Infrastructure projects are meant to reside in a nuget package feed, but for simplicity of this sample, the source projects are included and referenced
