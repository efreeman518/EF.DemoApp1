using OpenQA.Selenium;
using OpenQA.Selenium.Firefox;
using OpenQA.Selenium.Remote;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.SpecFlow.Specs.Drivers;

public class SeleniumDriver
{
    private IWebDriver _driver;
    private readonly ScenarioContext _scenarioContext;

    public SeleniumDriver(ScenarioContext scenarioContext) => _scenarioContext = scenarioContext;

    public IWebDriver Setup()
    {
        var firefoxOptions = new FirefoxOptions();
        _driver = new RemoteWebDriver(new Uri("https://localhost:43434/"), firefoxOptions.ToCapabilities());

        //Set the driver
        _scenarioContext.Set(_driver, "WebDriver");
        _driver.Manage().Window.Maximize();
        return _driver;
    }
}
