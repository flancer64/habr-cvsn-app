<?php
/**
 * Authors: Alex Gusev <alex@flancer64.com>
 * Since: 2019
 */

namespace Flancer64\HabrCvN\App;


class Main
{
    public function run()
    {
        echo "This is application.\n";
        $func = new \Flancer64\HabrCvN\Func\Lib();
        $func->exec();
    }
}