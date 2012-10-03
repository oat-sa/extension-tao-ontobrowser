<?php
/**
 * QtiAuthoring Controller provide actions to edit a QTI item
 *
 * @author CRP Henri Tudor - TAO Team - {@link http://www.tao.lu}
 * @package taoItems
 * @subpackage actions
 * @license GPLv2  http://www.opensource.org/licenses/gpl-2.0.php
 */

class ontoBrowser_actions_Browse extends tao_actions_CommonModule {

	/**
	 * constructor: initialize the service and the default data
	 * @return Delivery
	 */
	public function __construct(){

		parent::__construct();

	}
	
	/**
	 * Return the currently viewing resource
	 * 
	 * @return core_kernel_classes_Resource
	 */
	private function getCurrentResource() {
		if ($this->hasRequestParameter('uri')) {
			$uri = $this->getRequestParameter('uri');
		} else {
			$uri = TAO_OBJECT_CLASS;
		}
		return new core_kernel_classes_Resource($uri);
	}
	
	public function index() {
		$res = $this->getCurrentResource();
		
		$this->setData('res', $res);
		$this->setData('types', $res->getTypes());
		$this->setData('triples', $res->getRdfTriples()->getIterator());
		
		if ($res->isClass()) {
			$class = new core_kernel_classes_Class($res->getUri());
			$this->setData('subclassOf', $class->getParentClasses(false));
			$this->setData('subclasses', $class->getSubClasses());
			$this->setData('instances', $class->getInstances());
		}
		
		$this->setView('browse.tpl');
	}

}
?>
