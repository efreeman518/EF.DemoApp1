using OpenQA.Selenium;
using SeleniumExtras.WaitHelpers;
using System.Diagnostics;

namespace Test.SpecFlow.Specs.StepDefinitions
{
    /// <summary>
    /// https://www.selenium.dev/documentation/webdriver/elements/finders/
    /// </summary>
    [Binding]
    public class TodoItemUIStepDefinitions : SeleniumTestBase
    {
        public TodoItemUIStepDefinitions(ScenarioContext scenarioContext): base(scenarioContext)
        {
            _scenarioContext["random"] = RandomString(5);
        }

        [Given(@"the client configuration (.*)")]
        public void GivenTheClientConfiguration(string browser)
        {
            _webDriver = CreateDriver(browser);
        }


        [Given(@"user browser navigates to (.*)")]
        public void GivenNavigate(string url)
        {
            _webDriver.Navigate().GoToUrl(url);
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
            Thread.Sleep(1000); //wait for refresh with same elements, otherwise next line finds the old element which is stale on the following GetAttribute()
            var found = _waitMax10Seconds.Until(ExpectedConditions.ElementExists(By.XPath("//*[@id='todos']/tr[td[contains(text(),'" + _scenarioContext["value"] + "')]]/td/input[@type='checkbox']")));
            Assert.IsTrue(bool.Parse(found.GetAttribute("checked"))); //OpenQA.Selenium.StaleElementReferenceException: 'stale element reference: element is not attached to the page document'
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
                _ = _webDriver.FindElement(By.XPath("//tbody[@id='todos']/tr[td[contains(text(),'" + _scenarioContext["value"] + "')]]"));
            }
            catch (NoSuchElementException)
            {
                //expected
                Assert.IsTrue(true);
            }
        }

    }
}
