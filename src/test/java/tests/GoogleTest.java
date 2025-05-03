package tests;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.testng.annotations.*;
import static org.testng.Assert.*;

public class GoogleTest {

    WebDriver driver;

    @BeforeClass
    public void setUp() {
        driver = new ChromeDriver();
    }

    @Test
    public void testGoogleSearchTitle() {
        driver.get("https://www.google.com");
        assertEquals(driver.getTitle(), "Google");
    }

    @AfterClass
    public void tearDown() {
        if (driver != null) driver.quit();
    }
}
