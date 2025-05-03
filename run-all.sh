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
