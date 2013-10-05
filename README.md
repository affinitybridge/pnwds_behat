# PNWDS Behat and Mink with Drupal Example.

One way to use Behat with a Drupal distrobution.

[![Build Status](https://travis-ci.org/affinitybridge/pnwds_behat.png)](https://travis-ci.org/affinitybridge/pnwds_behat)

[Travis CI build history](https://travis-ci.org/affinitybridge/pnwds_behat/builds)

### Requirements
* PHP 5.4+
* Drush
* [Selenium Stand Alone Server](http://docs.seleniumhq.org/download/) for javascript tests

## Build Instructions

We need to build out both the drupal modules and the behat/mink and drupal extension dependencies for the tests.

To build out drupal core and contributed modules we use drush make

```
$ ls
pnwds_behat
$ mkdir drupal
$ mkdir profiles
$ mv pnwds_behat profiles
$ mv profiles drupal
$ cd drupal
$ drush make profiles/pnwds_behat/pnwds_behat_distro.make --yes
$ cd profiles/pnwds_behat
````

To build out the behat tests first change into the the tests directory and use composer to run the build.

```
$ cd tests/behat
$ curl http://getcomposer.org/installer | php
$ php composer.phar install
```