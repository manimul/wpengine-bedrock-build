environment=$1
theme="sage"

if [ "$environment" == "staging" ]
then
  git checkout develop
elif [ "$environment" == "production" ]
then
  git checkout master
else
  echo "Invalid environment."
  exit
fi

exists=`git show-ref refs/heads/wpengine`
if [ -n "$exists" ]
then
  git branch -D wpengine
fi
git checkout -b wpengine

cp -r web/app wp-content
rm "wp-content/themes/${theme}/.gitignore"
rm .gitignore
echo "/*\n!wp-content/" >> .gitignore
git ls-files | xargs git rm --cached

git add .
git commit -am "Setting up WPEngine build."
if [ "$environment" == "staging" ]
then
  git push staging wpengine:master
  git checkout develop
elif [ "$environment" == "production" ]
then
  git push production wpengine:master
  git checkout master
fi
git branch -D wpengine
rm -rf wp-content/
