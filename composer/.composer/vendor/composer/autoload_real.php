<?php

// autoload_real.php @generated by Composer

class ComposerAutoloaderInitf8f9885c9eb0a1c77c7fd122cd5ec379
{
    private static $loader;

    public static function loadClassLoader($class)
    {
        if ('Composer\Autoload\ClassLoader' === $class) {
            require __DIR__ . '/ClassLoader.php';
        }
    }

    /**
     * @return \Composer\Autoload\ClassLoader
     */
    public static function getLoader()
    {
        if (null !== self::$loader) {
            return self::$loader;
        }

        require __DIR__ . '/platform_check.php';

        spl_autoload_register(array('ComposerAutoloaderInitf8f9885c9eb0a1c77c7fd122cd5ec379', 'loadClassLoader'), true, true);
        self::$loader = $loader = new \Composer\Autoload\ClassLoader(\dirname(__DIR__));
        spl_autoload_unregister(array('ComposerAutoloaderInitf8f9885c9eb0a1c77c7fd122cd5ec379', 'loadClassLoader'));

        require __DIR__ . '/autoload_static.php';
        call_user_func(\Composer\Autoload\ComposerStaticInitf8f9885c9eb0a1c77c7fd122cd5ec379::getInitializer($loader));

        $loader->register(true);

        $includeFiles = \Composer\Autoload\ComposerStaticInitf8f9885c9eb0a1c77c7fd122cd5ec379::$files;
        foreach ($includeFiles as $fileIdentifier => $file) {
            composerRequiref8f9885c9eb0a1c77c7fd122cd5ec379($fileIdentifier, $file);
        }

        return $loader;
    }
}

/**
 * @param string $fileIdentifier
 * @param string $file
 * @return void
 */
function composerRequiref8f9885c9eb0a1c77c7fd122cd5ec379($fileIdentifier, $file)
{
    if (empty($GLOBALS['__composer_autoload_files'][$fileIdentifier])) {
        $GLOBALS['__composer_autoload_files'][$fileIdentifier] = true;

        require $file;
    }
}