#!/bin/bash

echo "🧪 Running TestNG tests with Maven..."
mvn clean test

echo "📊 Generating Allure report..."
allure generate target/allure-results --clean -o allure-report

echo "📁 Adding changes to Git..."
git add .
git commit -m "🔁 Test run and Allure report update"
git push origin main

echo "✅ All done! Code and report committed and pushed."


echo "🚀 Deploying Allure report to GitHub Pages..."

cd allure-report
git init
git checkout -b gh-pages
git remote add origin https://github.com/abhi-5177/java-selenium-ci-allure
git config user.name "abhi-5177"
git config user.email "abhiptl5177@gmail.com.com"
git add .
git commit -m "📈 Update Allure report"
git push --force origin gh-pages

cd ..
