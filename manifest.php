<?php
/**
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; under version 2
 * of the License (non-upgradable).
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 *
 * Copyright (c) 2013-2019 (original work) Open Assessment Technologies SA;
 *
 */

$extpath = dirname(__FILE__).DIRECTORY_SEPARATOR;
$taopath = dirname(dirname(__FILE__)).DIRECTORY_SEPARATOR.'tao'.DIRECTORY_SEPARATOR;

return array(
    'name' => 'ontoBrowser',
	'label' => 'Model Browser',
	'description' => 'Developement tool to browse the generis ontology',
    'license' => 'GPL-2.0',
    'version' => '5.0.2',
	'author' => 'Open Assessment Technologies',
    'requires' => array(
        'tao'           => '>=21.0.0',
        'taoBackOffice' => '>=3.0.0'
    ),
    'managementRole' => 'http://www.tao.lu/Ontologies/TAO.rdf#OntoBrowserRole',
    'acl' => array(
        array('grant', 'http://www.tao.lu/Ontologies/TAO.rdf#OntoBrowserRole', array('ext'=>'ontoBrowser')),
    ),
    'routes' => array(
        'ontoBrowser' => 'oat\\ontoBrowser\\actions',
    ),
    'uninstall' => array(),
    'update' => oat\ontoBrowser\model\Updater::class,
	'constants' => array(
		# views directory (required for templates)
		"DIR_VIEWS"				=> $extpath."views".DIRECTORY_SEPARATOR,

		#BASE URL (required by i10n)
		'BASE_URL'				=> ROOT_URL . 'ontoBrowser/',
	)
);
