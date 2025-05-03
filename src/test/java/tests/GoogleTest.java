package tests;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.testng.annotations.*;
import static org.testng.Assert.*;

public class GoogleTest {

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
    public void testGoogleSearchTitle() {
        driver.get("https://www.google.com");
        assertEquals(driver.getTitle(), "Google");
        
        //new change on 03/05/2025 -- 11:53 AM
    }

    @AfterClass
    public void tearDown() {
        if (driver != null) driver.quit();
    }
}
