api = 2
core = 7.x

projects[drupal][type] = core
projects[drupal][version] = "7.23"

; Buildkit includes

; Use vocabulary machine name for permissions
; http://drupal.org/node/995156
projects[drupal][patch][995156] = http://drupal.org/files/995156-46_portable_taxonomy_permissions-D7.patch

; End of Buildkit includes

; PNWDS Behat Example Profile
projects[pnwds_behat][type] = profile
projects[pnwds_behat][download][type] = git
projects[pnwds_behat][download][url] = http://github.com/smithmilner/pnwds_behat.git
