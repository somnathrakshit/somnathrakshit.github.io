git add *
read -r -p 'Enter commit message: ' input
git commit -m "$input"
git push origin source
