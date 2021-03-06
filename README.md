# PNWDS Behat and Mink with Drupal Example.

One way to use Behat with a Drupal distrobution.

[![Build Status](https://travis-ci.org/affinitybridge/pnwds_behat.png)](https://travis-ci.org/affinitybridge/pnwds_behat)

[Travis CI build history](https://travis-ci.org/affinitybridge/pnwds_behat/builds)

### Requirements
* PHP 5.4+ (If you would like to use the PHP builtin server drush makes use of)
* Drush
* [Selenium Stand Alone Server](http://docs.seleniumhq.org/download/) for javascript tests

### Build Instructions

We need to build out both the Drupal modules and the behat/mink and Drupal Extension dependencies for the tests.

To build out Drupal core and contributed modules we use drush make

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

To build out the behat tests. We first change into the the tests directory and use composer to run the build. For configuration differences copy the example behat.local.yml and add your configuration. Usually you just need to change the local URL of the project and the full path to the root of Drupal.

```
$ cd tests/behat
$ curl http://getcomposer.org/installer | php
$ php composer.phar install
$ cp behat.local.yml.example behat.local.yml
```

[Presentation Slides 2013](https://docs.google.com/presentation/d/1NWW8-mQcJUXkuzFiutCypHtAo7LpKMmpYIJW_sFU8p8/edit?usp=sharing)