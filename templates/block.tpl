{**
 * plugins/blocks/ListJournal/templates/block.tpl
 *
 * Copyright (c) 2021, Abdul Rahim Universitas Dinamika Bangsa
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * Common site sidebar menu -- "Make a Submission" block.
 *}
<style>
    .journals-image {
        max-width: 50px;
    }

    .journals-name {
        padding: 2px;
    }

    .pkp_block .block_journals ul li {
        padding: 4px;
        border-right: 0px;
        border-left: 0px;
    }

    .journals-name a {
        color: #007bff;
        padding-left: 4px;
    }

    .journals-name a:hover {
        text-decoration: none;
    }

    .journals_list {
        border: 1px solid #ccc;
    }

    .journals-issn {
        color: rgb(78, 71, 71);
        font-style: italic;
        font-size: 13px;
    }
</style>
<div class="pkp_block block_custom">
    <h2 class="title">
        {translate key="plugins.block.ListJournal.blockTitle"}
    </h2>
    <div class="content block_journals">
        <ul class="list-group">
            {foreach from=$myJournals item=journal}
                {capture assign="url"}{url journal=$journal->getPath()}{/capture}
                {assign var="thumb" value=$journal->getLocalizedData('journalThumbnail')}
                {assign var="description" value=$journal->getLocalizedDescription()}
                <li class="list-group-item d-flex journals_list">
                    <div class="journals-image">
                        {if $thumb}
                            <div class="thumb">
                                <a href="{$url|escape}">
                                    <img align="top"
                                        src="{$myJournalFilesPath}{$journal->getId()}/{$thumb.uploadName|escape:"url"}"
                                        {if $thumb.altText} alt="{$thumb.altText|escape|default:''}" {/if}>
                                </a>
                            </div>
                        {/if}
                    </div>
                    <div class="journals-name">
                        <a href="{$url|escape}" rel="bookmark">
                            {$journal->getLocalizedName()}
                            <br />
                            <span class="journals-issn">
                                {if $journal->getData('onlineIssn')}
                                    e-ISSN: {$journal->getData('onlineIssn')}
                                {/if}
                                {if $journal->getData('printIssn')}
                                    <br />
                                    p-ISSN: {$journal->getData('printIssn')} </span>
                            {/if}

                        </a>
                    </div>
                </li>
            {/foreach}
        </ul>
    </div>
</div>