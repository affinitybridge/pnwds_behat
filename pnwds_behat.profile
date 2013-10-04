<?php

/**
 * Implements hook_form_FORM_ID_alter() for install_configure_form().
 *
 * Allows the profile to alter the site configuration form.
 */
function pnwds_behat_form_install_configure_form_alter(&$form, $form_state) {
  // Pre-populate the site name with the server name.
  $form['site_information']['site_name']['#default_value'] = $_SERVER['SERVER_NAME'];
}

/**
 * Implements hook_block_info_alter().
 */
function pnwds_behat_block_info_alter(&$blocks, $theme, $code_blocks) {
  if ('bartik' == $theme) {
    $blocks['system']['main']['status'] = 1;
    $blocks['system']['main']['region'] = 'content';
  }
}