//using OpenQA.Selenium;
//using TechTalk.SpecFlow;
//using Test.SpecFlow.Specs.Drivers;

//namespace Test.SpecFlow.Specs.Hooks;
//[Binding]
//public sealed class HookInitialization
//{
//    // For additional details on SpecFlow hooks see http://go.specflow.org/doc-hooks

//    private readonly ScenarioContext _scenarioContext;

//    public HookInitialization(ScenarioContext scenarioContext) => _scenarioContext = scenarioContext;

//    [BeforeScenario("@tag1")]
//    public void BeforeScenarioWithTag()
//    {
//        // Example of filtering hooks using tags. (in this case, this 'before scenario' hook will execute if the feature/scenario contains the tag '@tag1')
//        // See https://docs.specflow.org/projects/specflow/en/latest/Bindings/Hooks.html?highlight=hooks#tag-scoping

//        //TODO: implement logic that has to run before executing each scenario
//    }

//    [BeforeScenario(Order = 1)]
//    public void FirstBeforeScenario()
//    {
//        // Example of ordering the execution of hooks
//        // See https://docs.specflow.org/projects/specflow/en/latest/Bindings/Hooks.html?highlight=order#hook-execution-order

//        SeleniumDriver seleniumDriver = new SeleniumDriver(_scenarioContext);
//        _scenarioContext.Set(seleniumDriver, "SeleniumDriver");
//    }

//    [AfterScenario]
//    public void AfterScenario()
//    {
//        Console.WriteLine("Selenium webdriver quit");
//        _scenarioContext.Get<IWebDriver>("SeleniumDriver").Quit();
//    }
//}
