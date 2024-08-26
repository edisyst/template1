echo "# template1" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M master
git remote add origin https://github.com/edisyst/template1.git
git push -u origin master
