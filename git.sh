git add .
read -r -p 'Enter commit message: ' input
git commit -S -m "$input"
git push origin source
