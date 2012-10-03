<?php

error_reporting(E_ALL);

/**
 * Utility of display methods
 *
 * @author Bertrand Chevrier, <bertrand.chevrier@tudor.lu>
 * @package tao
 * @subpackage helpers
 */

if (0 > version_compare(PHP_VERSION, '5')) {
    die('This file was generated for PHP 5');
}

/**
 * Utility of display methods
 *
 * @access public
 * @author Bertrand Chevrier, <bertrand.chevrier@tudor.lu>
 * @package tao
 * @subpackage helpers
 */
class ontoBrowser_helpers_Display
{
    /**
     * enable you to cut a long string and end it with [...] and add an hover
     * to display the complete string on mouse over.
     *
     * @access public
     * @author Bertrand Chevrier, <bertrand.chevrier@tudor.lu>
     * @param  string input
     * @param  int maxLength
     * @return string
     */
    public static function reverseConstantLookup($value)
    {
    	$consts = get_defined_constants(true);
    	foreach ($consts['user'] as $ckey => $cval) {
    		if ($cval === $value) {
    			return $ckey;
    		}
    	}
    	return $value;
    }

} /* end of class tao_helpers_Display */

?>