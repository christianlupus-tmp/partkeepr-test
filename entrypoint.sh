#! /bin/bash

echo "Prepare the configuration"
cp app/config/parameters.php.dist app/config/parameters.php

echo "Prepare composer"
composer self-update


echo "Install all dependencies"
composer install --prefer-source --no-interaction

echo "Warm-up the cache"
app/console cache:warmup --env=test

echo "Create the schema"
app/console doctrine:schema:create --env=test
    
echo "Run the test file"
SYMFONY__TESTDB=mysql DB=mysql vendor/bin/phpunit -c app/ --coverage-html build/logs/code-coverage
