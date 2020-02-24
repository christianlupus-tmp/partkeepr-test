#! /bin/bash

# Setting some basic constants
export SYMFONY__TESTDB=mysql
export DB=mysql

echo "Who am I?"
whoami

echo "Prepare the configuration"
cp app/config/parameters.php.dist app/config/parameters.php
cp /test-data/config_test.yml app/config

echo "Prepare composer"
composer self-update

echo "Install all dependencies"
composer install --prefer-source --no-interaction

echo "Warm-up the cache"
app/console cache:warmup --env=test

echo "Create the schema"
app/console doctrine:schema:create --env=test
    
echo "Run the test file"
vendor/bin/phpunit -c app/ --coverage-html build/logs/code-coverage
