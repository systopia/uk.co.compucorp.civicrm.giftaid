{*
 +--------------------------------------------------------------------+
 | CiviCRM version 4.3                                              |
 +--------------------------------------------------------------------+
 | Copyright CiviCRM LLC (c) 2004-2011                                |
 +--------------------------------------------------------------------+
 | This file is a part of CiviCRM.                                    |
 |                                                                    |
 | CiviCRM is free software; you can copy, modify, and distribute it  |
 | under the terms of the GNU Affero General Public License           |
 | Version 3, 19 November 2007 and the CiviCRM Licensing Exception.   |
 |                                                                    |
 | CiviCRM is distributed in the hope that it will be useful, but     |
 | WITHOUT ANY WARRANTY; without even the implied warranty of         |
 | MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.               |
 | See the GNU Affero General Public License for more details.        |
 |                                                                    |
 | You should have received a copy of the GNU Affero General Public   |
 | License and the CiviCRM Licensing Exception along                  |
 | with this program; if not, contact CiviCRM LLC                     |
 | at info[AT]civicrm[DOT]org. If you have questions about the        |
 | GNU Affero General Public License or the licensing of CiviCRM,     |
 | see the CiviCRM license FAQ at http://civicrm.org/licensing        |
 +--------------------------------------------------------------------+
*}

{crmStyle ext=uk.co.compucorp.civicrm.giftaid file=resources/css/dist.css}
{crmScript ext=uk.co.compucorp.civicrm.giftaid file=resources/js/script.js}

<div id="gift-aid-add" class="crm-block crm-form-block crm-export-form-block gift-aid">
    <h2>{ts}Add To Gift Aid{/ts}</h2>

    <div class="help"><p>{ts}Use this form to submit Gift Aid contributions.{/ts}</p></div>

    <table class="form-layout">
        <tr>
            <td>
                <table class="form-layout">
                    <tr>
                        <td class="label">{$form.title.label}</td>
                        <td>{$form.title.html}</td>
                    <tr>
                    <tr>
                        <td class="label">{$form.description.label}</td>
                        <td>{$form.description.html}</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

    <h3>{ts}Summary{/ts}</h3>

    <p>Number of selected contributions: {$selectedContributions}</p>

    {if $totalAddedContributions}
        <div class="crm-accordion-wrapper crm-accordion_title-accordion crm-accordion-closed">
            <div class="crm-accordion-header">
                Number of contributions that will be added to this batch: {$totalAddedContributions}
            </div>
            <!-- /.crm-accordion-header -->
            <div class="crm-accordion-body">
                <table class="selector">
                    <thead>
                    <tr>
                        <th>{ts}Name{/ts}</th>
                        <th>{ts}Gift Aidable Amount{/ts}</th>
                        <th>{ts}Total Amount{/ts}</th>
                        <th>{ts}No of items{/ts}</th>
                        <th>{ts}Type{/ts}</th>
                        <th>{ts}Source{/ts}</th>
                        <th>{ts}Received{/ts}</th>
                    </tr>
                    </thead>
                    {foreach from=$contributionsAddedRows item=row}
                        <tr class="contribution" data-contribution-id="{$row.contribution_id}">
                            <td>
                                <a href="{crmURL p='civicrm/contact/view' q="reset=1&cid=`$row.contact_id`"}">{$row.display_name}</a>
                            </td>
                            <td>{$row.gift_aidable_amount}</td>
                            <td>{$row.total_amount}</td>
                            <td>{$row.line_items|@count}</td>
                            <td>{$row.financial_account}</td>
                            <td>{$row.source}</td>
                            <td>{$row.receive_date}</td>
                        </tr>
                        <tr class="line-items-container">
                            <td colspan="7">
                                {include file="CRM/Civigiftaid/Form/Task/LineItems.tpl" contributionId=$row.contribution_id}
                            </td>
                        </tr>
                    {/foreach}
                </table>
            </div>
            <!-- /.crm-accordion-body -->
        </div>
        <!-- /.crm-accordion-wrapper -->
    {else}
        {include file="CRM/Civigiftaid/Form/Task/EmptyAccordion.tpl" content="Number of contributions that will be added to this batch: $totalAddedContributions"}
    {/if}
    {if $alreadyAddedContributions}
        <div class="crm-accordion-wrapper crm-accordion_title-accordion crm-accordion-closed">
            <div class="crm-accordion-header">
                Number of contributions already in a batch: {$alreadyAddedContributions}
            </div>
            <!-- /.crm-accordion-header -->
            <div class="crm-accordion-body">
                <table class="selector">
                    <thead>
                    <tr>
                        <th>{ts}Name{/ts}</th>
                        <th>{ts}Gift Aidable Amount{/ts}</th>
                        <th>{ts}Total Amount{/ts}</th>
                        <th>{ts}No of items{/ts}</th>
                        <th>{ts}Type{/ts}</th>
                        <th>{ts}Source{/ts}</th>
                        <th>{ts}Received{/ts}</th>
                        <th>{ts}Batch{/ts}</th>
                    </tr>
                    </thead>
                    {foreach from=$contributionsAlreadyAddedRows item=row}
                        <tr class="contribution" data-contribution-id="{$row.contribution_id}">
                            <td>
                                <a href="{crmURL p='civicrm/contact/view' q="reset=1&cid=`$row.contact_id`"}">{$row.display_name}</a>
                            </td>
                            <td>{$row.gift_aidable_amount}</td>
                            <td>{$row.total_amount}</td>
                            <td>{$row.line_items|@count}</td>
                            <td>{$row.financial_account}</td>
                            <td>{$row.source}</td>
                            <td>{$row.receive_date}</td>
                            <td>{$row.batch}</td>
                        </tr>
                        <tr class="line-items-container">
                            <td colspan="8">
                                {include file="CRM/Civigiftaid/Form/Task/LineItems.tpl" contributionId=$row.contribution_id}
                            </td>
                        </tr>
                    {/foreach}
                </table>
            </div>
            <!-- /.crm-accordion-body -->
        </div>
        <!-- /.crm-accordion-wrapper -->
    {else}
        {include file="CRM/Civigiftaid/Form/Task/EmptyAccordion.tpl" content="Number of contributions already in a batch: $alreadyAddedContributions"}
    {/if}
    {if $notValidContributions}
        <div class="crm-accordion-wrapper crm-accordion_title-accordion crm-accordion-closed">
            <div class="crm-accordion-header">
                Number of contributions not valid for gift aid: {$notValidContributions}
            </div>
            <!-- /.crm-accordion-header -->
            <div class="crm-accordion-body">
                <table class="selector">
                    <thead>
                    <tr>
                        <th>{ts}Name{/ts}</th>
                        <th>{ts}Gift Aidable Amount{/ts}</th>
                        <th>{ts}Total Amount{/ts}</th>
                        <th>{ts}No of items{/ts}</th>
                        <th>{ts}Type{/ts}</th>
                        <th>{ts}Source{/ts}</th>
                        <th>{ts}Received{/ts}</th>
                        <th>{ts}Reason{/ts}</th>
                    </tr>
                    </thead>
                    {foreach from=$contributionsNotValid item=row}
                        <tr class="contribution" data-contribution-id="{$row.contribution_id}">
                            <td>
                                <a href="{crmURL p='civicrm/contact/view' q="reset=1&cid=`$row.contact_id`"}">{$row.display_name}</a>
                            </td>
                            <td>{$row.gift_aidable_amount}</td>
                            <td>{$row.total_amount}</td>
                            <td>{$row.line_items|@count}</td>
                            <td>{$row.financial_account}</td>
                            <td>{$row.source}</td>
                            <td>{$row.receive_date}</td>
                            <td>{assign var=contribution_id value=$row.contribution_id}{$rejectionReasons.$contribution_id}</td>
                        </tr>
                        <tr class="line-items-container">
                            <td colspan="7">
                                {include file="CRM/Civigiftaid/Form/Task/LineItems.tpl" contributionId=$row.contribution_id}
                            </td>
                        </tr>
                    {/foreach}
                </table>
            </div>
            <!-- /.crm-accordion-body -->
        </div>
        <!-- /.crm-accordion-wrapper -->
    {else}
        {include file="CRM/Civigiftaid/Form/Task/EmptyAccordion.tpl" content="Number of contributions not valid for gift aid: $notValidContributions"}
    {/if}

    <p>{ts}Use this form to submit Gift Aid contributions. Note that this action is irreversible, i.e. you cannot take contributions out of a batch once they have been added.{/ts}</p>

    <p><strong>Possible reasons for contributions not valid for gift aid:</strong></p>

    <ol>
        <li>Contribution status is not 'Completed'</li>
        <li>Related Contact does not have a valid gift aid declaration</li>
        <li>Related Contact's gift aid declaration does not cover the contribution date</li>
    </ol>

    {$form.buttons.html}
</div>
