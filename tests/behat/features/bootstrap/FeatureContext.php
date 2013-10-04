<?php

use Behat\Behat\Exception\PendingException,
    Behat\Gherkin\Node\TableNode;
use Drupal\DrupalExtension\Context\DrupalContext;

use Symfony\Component\Process\Process;

use Behat\Behat\Event\ScenarioEvent,
    Behat\Behat\Event\StepEvent,
    Behat\Behat\Event\FeatureEvent,
    Behat\Behat\Event\SuiteEvent;

use Behat\Mink\Element\NodeElement,
    Behat\Mink\Element\Element;

use Behat\Mink\Exception\ElementNotFoundException;
use Behat\Mink\Exception\UnsupportedDriverActionException;
use Behat\Mink\Session;

use Behat\Mink\Selector\CssSelector,
    Behat\Mink\Selector\SelectorsHandler;

use Drupal\Driver\DrushDriver;

require_once 'vendor/autoload.php';

/**
 * Features context.
 */
class FeatureContext extends DrupalContext {

  public static $drush_server_pid = FALSE;

  /**
   * @Given /^the module "([^"]*)" is enabled$/
   */
  public function theModuleIsEnabled($module) {
    echo $this->getDrupal()->getDriver()->drush('pm-enable', array($module), array('yes' => NULL));
  }

  /**
   * @Given /^I revert all features$/
   */
  public function iRevertAllFeatures() {
    echo $this->getDrupal()->getDriver()->drush('features-revert-all', array(), array('yes' => NULL));
  }

  /**
   * @Given /^I revert the "([^"]*)" feature$/
   */
  public function iRevertTheFeature($feature) {
    echo $this->getDrupal()->getDriver()->drush('features-revert', array($feature), array('yes' => NULL));
  }

  /**
   * @When /^I wait "([^"]*)"$/
   */
  public function iWait($seconds) {
    $this->getSession()->wait($seconds * 1000,
    "jQuery('#edit-site-information .fieldset-legend').html() == 'Site information'");
  }

  /**
   * @Given /^the user "([^"]*)" has a password of "([^"]*)"$/
   */
  public function theUserHasAPasswordOf($username, $new_password) {
    $this->getDrupal()->getDriver()->drush('user-password', array($username), array('password' => $new_password));
  }

  /** @BeforeFeature @reinstall */
  public static function setupFeature(FeatureEvent $event) {
    $options = array(
      'site-name' => '"PNWDS Behat"',
      'account-mail' => 'admin@testab.com',
      'account-pass' => 'p4ssw0rd',
      'yes' => NULL,
    );
    $drushdriver = new DrushDriver('self');
    echo $drushdriver->drush('site-install', array('pnwds_behat', 'install_configure_form.update_status_module=\'array(FALSE,FALSE)\''), $options);
  }

  /**
   * Run after every scenario.
   *
   * @AfterScenario
   */
  public function afterScenario($event) {
    // Remove any nodes that were created.
    // if (!empty($this->nodes)) {
    //   foreach ($this->nodes as $node) {
    //     $this->getDriver()->nodeDelete($node);
    //   }
    // }

    // Remove any users that were created.
    // if (!empty($this->users)) {
    //   foreach ($this->users as $user) {
    //     $this->getDriver()->userDelete($user);
    //   }
    //   $this->getDriver()->processBatch();
    // }

    // Remove any terms that were created.
    // if (!empty($this->terms)) {
    //   foreach ($this->terms as $term) {
    //     $this->getDriver()->termDelete($term);
    //   }
    // }
  }
}
