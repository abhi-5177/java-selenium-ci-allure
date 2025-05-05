package tests;


import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.testng.annotations.*;
import static org.testng.Assert.*;

public class demoQA {

    WebDriver driver;

    @BeforeClass
    public void setUp() {
        driver = new ChromeDriver();
		System.setProperty("webdriver.chrome.driver", "/usr/bin/chromedriver");

       /* ChromeOptions options = new ChromeOptions();
        options.addArguments("--headless", "--disable-gpu");
        driver = new ChromeDriver(options);
*/
    }

    @Test
    public void testdemoQA() {
        driver.get("https://demoqa.com/");
        assertEquals(driver.getTitle(), "DEMOQA");
        
        //new change on 05/05/2025 -- 11:00 AM
    }

    @AfterClass
    public void tearDown() {
        if (driver != null) driver.quit();
    }
}
