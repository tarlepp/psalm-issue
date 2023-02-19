# What is this?

Trying to reproduce Psalm issue https://github.com/vimeo/psalm/issues/9340

## How to test this?

1. Clone this repository
1. Run `docker-compose up`
1. After container is up and running, run following commands
   1. `docker-compose exec php composer install` to install Psalm
   1. `docker-compose exec php ./vendor/bin/psalm`

With taht you should see that Psalm crashes, and if you change Psalm version to 5.6
in `composer.json` file and install it then you will see expected results.

## License

[The MIT License (MIT)](LICENSE)

Copyright © 2023 Tarmo Leppänen
