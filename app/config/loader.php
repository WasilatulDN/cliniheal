<?php

$loader = new \Phalcon\Loader();

$loader->registerDirs(
    [
        APP_PATH . '/controllers/',
        APP_PATH . '/models/',
        APP_PATH . '/config/route-group/',
        APP_PATH . '/validations/'
    ]
);

$loader->registerClasses(
    [
        'PHPMailer'         => '/library/PHPMailer/PHPMailer.php',
    ]
);

$loader->registerNamespaces(
    [
        'PHPMailer\PHPMailer' => APP_PATH . '/library/PHPMailer/'
    ]
);

$loader->register();