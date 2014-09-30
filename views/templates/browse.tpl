<?php
use oat\ontoBrowser\helpers\Display;
use oat\tao\helpers\Template;
?>
<link rel="stylesheet" type="text/css" href="<?=Template::css('browse.css')?>" />
<div class="main-container">
    <h2><?=$res->getLabel()?> (<?=$res->getUri()?>)</h2>
    <div class="form-content">
        <div class="xhtml_form">
    		<form name=open id="openform"><input type="text" name="uri" id="openuri" size="100"></input>
    			<button type="submit" class="small rgt" value="<?=__('open')?>"><?=__('open')?></button>
    		</form>
		</div>
    </div>
	<h3><?=__('types')?></h3>
	<?php foreach($types as $instance):?>
		<a href='<?=$instance->getUri()?>' class="browseLink"><?=strlen($instance->getLabel()) > 0 ? $instance->getLabel() : __('noname')?></a><br />
	<?php endforeach;?>
	<?php if (isset($subclasses)) :?>
	<div>
		<h3><?=__('subclass of')?></h3>
		<?php foreach($subclassOf as $subclass):?>
			<a href='<?=$subclass->getUri()?>' class="browseLink"><?=strlen($subclass->getLabel()) > 0 ? $subclass->getLabel() : __('noname')?></a><br />
		<?php endforeach;?>
		<h3><?=__('subclasses')?></h3>
		<?php foreach($subclasses as $subclass):?>
			<a href='<?=$subclass->getUri()?>' class="browseLink"><?=strlen($subclass->getLabel()) > 0 ? $subclass->getLabel() : __('noname')?></a><br />
		<?php endforeach;?>
		<h3><?=__('instances')?></h3>
		<?php foreach($instances as $instance):?>
			<a href='<?=$instance->getUri()?>' class="browseLink"><?=strlen($instance->getLabel()) > 0 ? $instance->getLabel() : __('noname')?></a><br />
		<?php endforeach;?>
	</div>
	<?php endif;?>
</div>
<div class="data-container-wrapper">
	<table class="matrix">
	  <caption class="triples-title"><?=__('Triples with subject')?> <?=$res->getLabel()?></caption>
        <thead>
            <tr><th><?=__('predicate')?></th><th><?=__('object')?></th><th class="small"><?=__('ModelId')?></th><th class="small"><?=__('lg')?></th></tr>
        </thead>
        <tbody>
		<?php foreach($triples as $triple):	?>
		    <?php $class = ($triple->lg == '' || $triple->lg == DEFAULT_LANG || $triple->lg ==get_data("userLg")) ? "inScope" : "notInScope"; ?>
			<tr class="<?= $class ?>">
			    <td><a href="<?=$triple->predicate?>" class="browseLink"><?=Display::reverseConstantLookup($triple->predicate)?></a></td><td><?php
				if (\common_Utils::isUri($triple->object)) {
					$obj = new \core_kernel_classes_Resource($triple->object);
					echo '<a href="'.$obj->getUri().'" class="browseLink">'.(strlen($obj->getLabel()) > 0 ? $obj->getLabel() : __('noname')).'</a>';
				} else {
					echo $triple->object;
				}
			?></td><td ><?=$triple->modelid?></td><td ><?=$triple->lg?></td></tr>
		<?php endforeach;?>
		</tbody>
	</table>
	<table class="matrix">
	  <caption class="triples-title"><?=__('Triples with object')?> <?=$res->getLabel()?></caption>
        <thead>
    		<tr><th><?=__('subject')?></th><th><?=__('predicate')?></th><th class="small"><?=__('ModelId')?></th><th class="small"><?=__('lg')?></th></tr>
        </thead>
        <tbody>
		<?php foreach($otriples as $triple):?>
            <?php $class = ($triple->lg == '' || $triple->lg == DEFAULT_LANG || $triple->lg ==get_data("userLg")) ? "inScope" : "notInScope"; ?>
			<tr class="<?= $class ?>">
			    <td><?php
				if (\common_Utils::isUri($triple->subject)) {
					$obj = new \core_kernel_classes_Resource($triple->subject);
					echo '<a href="'.$obj->getUri().'" class="browseLink">'.(strlen($obj->getLabel()) > 0 ? $obj->getLabel() : __('noname')).'</a>';
				} else {
					echo $triple->subject;
				}
			?></td><td><?=Display::reverseConstantLookup($triple->predicate)?></td><td ><?=$triple->modelid?></td><td ><?=$triple->lg?></td></tr>
		<?php endforeach;?>
		</tbody>
	</table>
		<table class="matrix">
	  <caption class="triples-title"><?=__('Triples with predicate')?> <?=$res->getLabel()?></caption>
        <thead>
		  <tr><th><?=__('subject')?></th><th><?=__('object')?></th><th class="small"><?=__('ModelId')?></th><th class="small"><?=__('lg')?></th></tr>
        </thead>
        <tbody>
		<?php foreach($ptriples as $triple): ?>
            <?php $class = ($triple->lg == '' || $triple->lg == DEFAULT_LANG || $triple->lg ==get_data("userLg")) ? "inScope" : "notInScope"; ?>
			<tr class="<?= $class ?>">
			    <td><?php
				if (\common_Utils::isUri($triple->subject)) {
					$obj = new \core_kernel_classes_Resource($triple->subject);
					echo '<a href="'.$obj->getUri().'" class="browseLink">'.(strlen($obj->getLabel()) > 0 ? $obj->getLabel() : __('noname')).'</a>';
				} else {
					echo $triple->object;
				}
			?></td><td><?=Display::reverseConstantLookup($triple->object)?></td><td><?=$triple->modelid?></td><td><?=$triple->lg?></td></tr>
		<?php endforeach;?>
		</tbody>
	</table>

</div>