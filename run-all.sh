#!/bin/bash

#set -e  # Stop on error
git push origin main

echo "🧹 Cleaning old builds..."
mvn clean test

echo "📂 Preparing Allure history (for trends)..."
mkdir -p allure-results/history || echo "history folder already exists"
cp -r allure-report/history/* allure-results/history 2>/dev/null || echo "No previous history"

echo "📊 Generating Allure report..."
allure generate allure-results --clean -o allure-report

echo "🧠 Updating history after report..."
cp -r allure-report/history/* allure-results/history || echo "No history to copy"

echo "🧾 Generating single HTML Allure report..."
allure generate --single-file allure-results --clean -o allure-report

# -----------------------
# ✅ Push test code updates to MAIN branch
# -----------------------
echo "🔄 Committing test and report changes to MAIN branch..."
git add .
git commit -m "✅ Test run and updated Allure report - $(date)" || echo "Nothing to commit"
git push origin main

# -----------------------
# ✅ Push report to GH-PAGES branch
# -----------------------
echo "🌐 Preparing GH-PAGES branch with single HTML report..."

rm -rf gh-pages
mkdir gh-pages
cp -r allure-report/index.html gh-pages/
cd gh-pages
echo "Allure Report on GitHub Pages" > README.md
touch .nojekyll

echo "🚀 Deploying to gh-pages..."
git init
git checkout -b gh-pages
git remote add origin git@github.com:abhi-5177/java-selenium-ci-allure.git
git config user.name "abhi-5177"
git config user.email "abhiptl5177@gmail.com"
git add .
git commit -m "📊 Deploy Allure report to GitHub Pages - $(date)"
git push --force origin gh-pages

cd ..
rm -rf gh-pages

echo "🎉 DONE! Your report is live at:"
echo "👉 https://<your-username>.github.io/<your-repo>/index.html"