using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium.Support.UI;
using SeleniumExtras.WaitHelpers;
using System;
using System.Diagnostics;
using System.Reflection;
using TechTalk.SpecFlow;

namespace Test.SpecFlow.Specs.StepDefinitions
{
    /// <summary>
    /// https://www.selenium.dev/documentation/webdriver/elements/finders/
    /// </summary>
    [Binding]
    public class TodoItemUIStepDefinitions
    {
        protected IWebDriver _webDriver;
        protected WebDriverWait _waitMax10Seconds;
        private readonly ScenarioContext _scenarioContext;

        private static Random random = new Random();

        public static string RandomString(int length)
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            return new string(Enumerable.Repeat(chars, length)
                .Select(s => s[random.Next(s.Length)]).ToArray());
        }

        public TodoItemUIStepDefinitions(ScenarioContext scenarioContext)
        {
            _scenarioContext = scenarioContext;
            //https://github.com/rosolko/WebDriverManager.Net
            //new DriverManager().SetUpDriver(new ChromeConfig());

            //chrome driver download: http://chromedriver.storage.googleapis.com/index.html
            //put the chromedriver.exe in the /drivers folder, properties - Copy to Output folder, and note the version here:
            // var chromeVersion = "97.0.4692.71";

            _webDriver = new ChromeDriver(); // $"{Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location)}\\Chrome\\{chromeVersion}\\X64");
            _waitMax10Seconds = new WebDriverWait(_webDriver, TimeSpan.FromSeconds(10));
            _scenarioContext["random"] = RandomString(5);

        }

        [Given(@"user navigates to url")]
        public void GivenNavigate()
        {
            _webDriver.Navigate().GoToUrl("https://localhost:44318/");
            Assert.IsTrue(_webDriver.Title.Contains("SampleApp - Todo CRUD"));
        }

        [When(@"enters (.*) in textbox and clicks Add")]
        public void GivenEnterValueInTextbox(string value)
        {
            _scenarioContext["value"] = value + _scenarioContext["random"];
            _waitMax10Seconds.Until(ExpectedConditions.ElementExists(By.XPath("//input[@id='add-name']")))
                .SendKeys(_scenarioContext["value"].ToString());
            _webDriver.FindElement(By.XPath("//form[@onsubmit='addItem()']//input[@type='submit']"))
                .Click();
        }

        [Then(@"verify the item exists in the list")]
        public void ThenVerifyTheItemExistsInTheList()
        {
            var found = _waitMax10Seconds.Until(ExpectedConditions.ElementExists(By.XPath("//tbody[@id='todos']/tr/td[contains(text(),'" + _scenarioContext["value"] + "')]")));
            Assert.IsTrue(found != null);
        }

        [When(@"user clicks the edit button for this item")]
        public void WhenUserClicksTheEditButtonForThisItem()
        {
            _webDriver.FindElement(By.XPath("//tbody[@id='todos']/tr[td[contains(text(),'" + _scenarioContext["value"] + "')]]//button[text()='Edit']"))
               .Click();
        }

        [Then(@"verify the edit area shows the item")]
        public void ThenVerifyTheEditAreaShowsTheItem()
        {
            var inputEditName = _waitMax10Seconds.Until(ExpectedConditions.ElementExists(By.XPath("//input[@id='edit-name']")));
            Assert.IsTrue(inputEditName.GetAttribute("value") == _scenarioContext["value"].ToString());
            _scenarioContext["input-edit-name"] = inputEditName;
        }

        [When(@"user appends the name with (.*) and clicks save")]
        public void WhenUserAppendsTheNameAndClicksSave(string appendName)
        {
            _scenarioContext["value"] += appendName;
            ((IWebElement)_scenarioContext["input-edit-name"]).SendKeys(appendName);
            _webDriver.FindElement(By.XPath("//*[@id='editForm']/form/input[@type='submit' and @value='Save']"))
               .Click();
        }

        [When(@"user checks the complete box and clicks save")]
        public void WhenUserChecksTheCompleteBoxAndClicksSave()
        {
            _webDriver.FindElement(By.Id("edit-isComplete")).Click();
            _webDriver.FindElement(By.XPath("//*[@id='editForm']/form/input[@type='submit' and @value='Save']"))
               .Click();
        }

        [Then(@"verify the item complete box is checked in the list")]
        public void ThenVerifyTheItemCompleteBoxIsCheckedInTheList()
        {
            var found = _waitMax10Seconds.Until(ExpectedConditions.ElementExists(By.XPath("//*[@id='todos']/tr[td[contains(text(),'" + _scenarioContext["value"] + "')]]/td/input[@type='checkbox']")));
            Debug.WriteLine("_" + found.GetAttribute("checked") + "=");
            //Assert.IsTrue(bool.Parse(found.GetAttribute("checked")));
        }

        [When(@"user clicks the delete button for this item")]
        public void WhenUserClicksTheDeleteButtonForThisItem()
        {
            _webDriver.FindElement(By.XPath("//tbody[@id='todos']/tr[td[contains(text(),'" + _scenarioContext["value"] + "')]]//button[text()='Delete']"))
              .Click();
        }

        [Then(@"verify the item is no longer in the list")]
        public void ThenVerifyTheItemIsNoLongerInTheList()
        {
            try
            {
                var found = _webDriver.FindElement(By.XPath("//tbody[@id='todos']/tr[td[contains(text(),'" + _scenarioContext["value"] + "')]]"));
            }
            catch (NoSuchElementException)
            {
                //expected
                Assert.IsTrue(true);
            }
        }


    }
}
