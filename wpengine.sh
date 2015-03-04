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

cd "web/app/themes/${theme}"
rm .gitignore
npm install
bower install
if [ "$environment" == "staging" ]
then
  gulp
elif [ "$environment" == "production" ]
then
  gulp --production
fi
cd ../../../../

composer install

mv web/app wp-content
shopt -s extglob
rm -rf !(wp-content)
rm .DS_Store
rm .env.example
rm .gitignore
rm .travis.yml
rm wp-content/plugins/.gitkeep
rm wp-content/themes/.gitkeep
rm wp-content/uploads/.gitkeep

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
