<?php 
import('lib.pkp.classes.form.Form');

class PlagiarismSettingsForm extends Form {

	/** @var int */
	var $_journalId;

	/** @var object */
	var $_plugin;

	/**
	 * Constructor
	 * @param $plugin BadgesPlugin
	 * @param $journalId int
	 */
	function __construct($plugin, $journalId) {
		$this->_journalId = $journalId;
		$this->_plugin = $plugin;

		parent::__construct($plugin->getTemplateResource('settingsForm.tpl'));

		$this->addCheck(new FormValidatorPost($this));
		$this->addCheck(new FormValidatorCSRF($this));
	}
	/**
	 * Initialize form data.
	 */
	function initData() {
		$journalId = $this->_journalId;
		$plugin = $this->_plugin;
            $this->setData('plagiarismAutomaticEnabled', $plugin->getSetting($journalId, 'plagiarismAutomaticEnabled'));
			$this->setData('stage', $plugin->getSetting($journalId, 'stage'));
		}

    	/**
	 * Assign form data to user-submitted data.
	 */
	function readInputData() {
        $this->readUserVars(array('plagiarismAutomaticEnabled', 'stage'));
    }
    
    /**
	 * Fetch the form.
	 * @copydoc Form::fetch()
	 */
	function fetch($request) {
		$templateMgr = TemplateManager::getManager($request);
		$templateMgr->assign('pluginName', $this->_plugin->getName());
		return parent::fetch($request);
    }
    
   	/**
	 * Save settings.
	 */
	function execute(...$functionArgs) {
		$plugin = $this->_plugin;
		$journalId = $this->_journalId;
		$plugin->updateSetting($journalId, 'plagiarismAutomaticEnabled', $this->getData('plagiarismAutomaticEnabled'));
		$plugin->updateSetting($journalId, 'stage', $this->getData('stage'));
	    parent::execute(...$functionArgs);
	}



}

?>