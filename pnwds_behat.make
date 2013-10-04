core = 7.x

; Include Build Kit install profile makefile via URL
; Pinned to release April 18, 2013
includes[] = http://drupalcode.org/project/buildkit.git/blob_plain/56388b594c80e5e1d9e68c856d67bf8fd7a80439:/drupal-org.make

; Overrides for Build Kit

projects[features][version] = 2.0-rc2

projects[rubik][subdir] = contrib
projects[tao][subdir] = contrib

; Modules

projects[admin_menu][subdir] = contrib
projects[admin_menu][version] = 3.0-rc4

projects[entity][subdir] = contrib
projects[entity][version] = 1.1