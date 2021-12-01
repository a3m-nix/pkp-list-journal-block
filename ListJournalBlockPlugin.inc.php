<?php

/**
 * @file plugins/blocks/ListJournal/ListJournalBlockPlugin.inc.php
 *
 * Copyright (c) 2021 Universitas Dinamika Bangsa
 * Copyright (c) 2021 Abdul Rahim
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @class MakeSubmissionBlockPlugin
 * @ingroup plugins_blocks_makeSubmission
 *
 * @brief Class for the "Make a Submission" block plugin
 */
import('lib.pkp.classes.plugins.BlockPlugin');

class ListJournalBlockPlugin extends BlockPlugin
{
    /**
     * Get the display name of this plugin.
     *
     * @return String
     */
    public function getDisplayName()
    {
        return __('plugins.block.ListJournal.displayName');
    }

    /**
     * Get a description of the plugin.
     */
    public function getDescription()
    {
        return __('plugins.block.ListJournal.description');
    }

    /**
     * @copydoc BlockPlugin::getContents()
     *
     * @param null|mixed $request
     */
    public function getContents($templateMgr, $request = null)
    {
        $journalDao = DAORegistry::getDAO('JournalDAO');
        $journals = $journalDao->getAll(true)->toArray();
        $templateMgr->assign(array(
            'myJournals' => $journals,
            'myJournalFilesPath' => $request->getBaseUrl() . '/' . Config::getVar('files', 'public_files_dir') . '/journals/',
        ));
        return parent::getContents($templateMgr, $request);
    }
}
