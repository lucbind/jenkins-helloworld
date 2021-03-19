git add --all
git commit -m $1
git branch -M main
git push -u jenkins-helloworld  main
