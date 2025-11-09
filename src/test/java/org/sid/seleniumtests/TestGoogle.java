package org.sid.seleniumtests;

import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.testng.Assert;
import org.testng.annotations.Test;

public class TestGoogle {

    @Test
    public void testTitle() throws InterruptedException {
        // Configure automatiquement le ChromeDriver
        WebDriverManager.chromedriver().setup();

        // Lance le navigateur Chrome
        WebDriver driver = new ChromeDriver();
         Thread.sleep(2000);
        // Ouvre Google
        driver.get("https://www.google.com");
        Thread.sleep(2000);
        // Récupère le titre
        String title = driver.getTitle();
        System.out.println("Titre de la page : " + title);

        // Vérifie que le titre contient "Google"
        Assert.assertTrue(title.contains("Google"));
        Thread.sleep(2000);
        // Ferme le navigateur
        driver.quit();
    }
}

