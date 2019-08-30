##############################################################################
cd ~/projects/
git clone git@bitbucket.org:arcamens/slock.git slock-code
##############################################################################
# Push slock staging branch.
cd ~/projects/django-slock-code

# clean up all .pyc files. 
find . -name "*.pyc" -exec rm -f {} \;
git status
git add *
git commit -a
git push -u origin staging
##############################################################################
# Push slock onto master.

cd ~/projects/django-slock-code
# clean up all .pyc files. 
find . -name "*.pyc" -exec rm -f {} \;

git status
git add *
git commit -a
git push -u origin master
##############################################################################
# Create staging branch.
cd ~/projects/django-slock-code
git branch -a
git checkout -b staging
git push --set-upstream origin staging
##############################################################################
# Create releases.

git tag -a v1.0.0 -m 'Initial release.'
git push origin : v1.0.0

git tag -a v2.0.0 -m 'Running on django 2.'
git push origin : v2.0.0

##############################################################################
# merge staging into master.
git checkout master
git merge staging
git push -u origin master
git checkout staging
##############################################################################
# Upload it to pypi.
python setup.py sdist register upload
rm -fr dist
##############################################################################
cd ~/projects/

django-admin startproject demo django-slock-code
#####k#########################################################################
# create django-slock virtualenv.
cd ~/.virtualenvs/
ls -la
virtualenv django-slock -p python
#####k#########################################################################
# activate django-slock virtualenv.

cd ~/.virtualenvs/
source django-slock/bin/activate
cd ~/projects/django-slock-code
##############################################################################
# Make migrations for the app.
cd ~/projects/django-slock-code

python manage.py makemigrations slock
##############################################################################
# Install requirements.
cd ~/projects/django-slock-code

pip install -r requirements.txt 

