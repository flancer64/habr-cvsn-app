# 'composer' vs 'npm': multi-module project deployment

Demo for Habr: https://habr.com/ru/post/458018/ (in russian)


## Overview
This project has one dependent module 'habr-cvsn-mod-func' that has own dependency 'habr-cvsn-mod-base'. Project and modules have php & js scripts and can be deployed using `composer` or `npm`.


## Deployment scripts
* **rebuild_composer.sh**: deploy PHP project using `composer`;
* **rebuild_npm_01_regular.sh**: deploy `nodejs` project w/o VCS support for dependencies;
* **rebuild_npm_02_link_external.sh**: deploy `nodejs` project with VCS support for dependencies (sources are placed outside the project structure);
* **rebuild_npm_03_link_internal.sh**: deploy `nodejs` project with VCS support for dependencies (sources are placed inside the project structure);

## PHP 
```
$ ./rebuild_composer.sh
...
$ php ./index.php
This is application.
This is func module.
This is base module.
```

## nodejs
```
$  ./rebuild_npm_*.sh
...
$ nodejs index.js 
This is application.
This is func module.
This is base module.
```