# AdminScripts
All kind of scripts which help me to maintain a website. I treat this repository as a private repo just to do not lose my files. It means that the quality of the scripts might be not perfect. Do not hasitate to use those scripts. But remember that **I do not take the responsibility of what you do with those scripts.** Visit my homepage to contact me: [Wojciech Romanek](https://wromanek.info).

## cloneTablesWithNewPrefix.sh
I use this script for reproducing test database based on production database. The script clones all tables which starts with *sourcePrefix* to tables with same names but with *sourcePrefix* replaced by *targetPrefix*. 

:exclamation:**All tables with specified *targetPrefix* will be dropped first if exists.**:exclamation:

### Example
```
./cloneTablesWithNewPrefix.sh your_db_username your_db_password your_db_name source_preffix target_preffix
```

Let's assume that you have three folowing tables in your db:
```
prod_users
prod_articles
prod_languages
```
And you run the scripts using `prod_` as *sourcePrefix* and `test_` as *targetPrefix* you will get following result:
```
prod_users
prod_articles
prod_languages
test_users
test_articles
test_languages
```
So the source table will stay not changed. New tables with `test_` prefix will be created. The newly created tables will contain exactly the same data which which source tables contained at the moment of running script.

## copyToNewLocation.sh
This is very simple script - what it does is simply copying all Joomla CMS files to new localisation. It backups *configuration.php* from target folder. The reason for backup is that I use this script for updating my testing enviroment with the current state of production. In my test enviroment I use diffrent DB so I just do not want to accidentally run test enviroment connected to the production DB.

Please contact me if you have any questions or suggestions. 
