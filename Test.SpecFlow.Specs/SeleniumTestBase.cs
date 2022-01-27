using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium.Edge;
using OpenQA.Selenium.Support.UI;

namespace Test.SpecFlow.Specs;

public class SeleniumTestBase : IDisposable
{
    protected ScenarioContext _scenarioContext;
    protected IWebDriver _driver;
    protected WebDriverWait _waitMax10Seconds;
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

    public void CreateDriver(string browser = "Chrome")
    {
        if (_driver != null && browser != _scenarioContext.Get<string>("browser")?.ToString())
        {
            _driver.Quit();
        }

        _driver = browser switch
        {
            "Edge" => new EdgeDriver(),
            //"Firefox" => new FirefoxDriver(),
            //"IE" => new InternetExplorerDriver(),
            _ => new ChromeDriver(),
        };

        if(!_scenarioContext.TryAdd("browser",browser)) _scenarioContext.Set(browser, "browser");
        _waitMax10Seconds = new WebDriverWait(_driver, TimeSpan.FromSeconds(10));
    }

    protected virtual void Dispose(bool disposing)
    {
        if (disposing && _driver != null)
        {
            _driver.Quit();
            _driver.Dispose();
        }
    }

    public void Dispose()
    {
        Dispose(true);
        GC.SuppressFinalize(this);
    }
}
