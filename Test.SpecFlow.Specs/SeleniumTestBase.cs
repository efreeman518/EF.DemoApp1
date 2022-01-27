using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium.Edge;
using OpenQA.Selenium.Firefox;
using OpenQA.Selenium.IE;
using OpenQA.Selenium.Support.UI;

namespace Test.SpecFlow.Specs;

public class SeleniumTestBase : IDisposable
{
    protected IWebDriver _webDriver;
    protected WebDriverWait _waitMax10Seconds;
    protected ScenarioContext _scenarioContext;

    private static readonly Random random = new();

    public SeleniumTestBase(ScenarioContext scenarioContext)
    {
        _scenarioContext = scenarioContext;       
    }

    public static string RandomString(int length)
    {
        const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        return new string(Enumerable.Repeat(chars, length)
            .Select(s => s[random.Next(s.Length)]).ToArray());
    }

    public IWebDriver CreateDriver(string browser = "Chrome")
    {
        if (_webDriver != null && browser != _scenarioContext["browser"]?.ToString())
        {
            _webDriver.Quit();
            _webDriver.Dispose();
        }

        _scenarioContext["browser"] = browser;

        _webDriver = browser switch
        {
            "Firefox" => new FirefoxDriver(),
            "IE" => new InternetExplorerDriver(),
            "Edge" => new EdgeDriver(),
            _ => new ChromeDriver(),
        };
        _waitMax10Seconds = new WebDriverWait(_webDriver, TimeSpan.FromSeconds(10));

        return _webDriver;
    }

    protected virtual void Dispose(bool disposing)
    {
        if (disposing && _webDriver != null)
        {
            _webDriver.Quit();
            _webDriver.Dispose();
        }
    }

    public void Dispose()
    {
        Dispose(true);
        GC.SuppressFinalize(this);
    }
}
