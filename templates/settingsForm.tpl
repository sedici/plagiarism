<div id="PlagiarismSettings">
<div id="description">{translate key="plugins.generic.plagiarism.manager.setting.description" }</div>
 <script>
 $(function() {ldelim}
		// Attach the form handler.
		$('#PlagiarismSettingsForm').pkpHandler('$.pkp.controllers.form.AjaxFormHandler');
	{rdelim});
</script>

<form class="pkp_form" id="PlagiarismSettingsForm" method="post" action="{url router=$smarty.const.ROUTE_COMPONENT op="manage" category="generic" plugin=$pluginName verb="settings" save=true}">
	{csrf}
	{include file="controllers/notification/inPlaceNotification.tpl" notificationId="badgesSettingsFormNotification"}

	{fbvFormArea id="plagiarismSettingsFormArea"}

		{fbvFormSection list="true"}
			{fbvElement type="checkbox" id="plagiarismAutomaticEnabled" label="plugins.generic.plagiarism.manager.setting.automatic" checked=$plagiarismAutomaticEnabled|compare:true}
		{/fbvFormSection}
		<h3> {translate key="plugins.generic.plagiarism.manager.setting.stages" } </h3>
		<p>  {translate key="plugins.generic.plagiarism.manager.setting.stages.description" } </p>
        {fbvFormSection list=true}
				{fbvElement type="radio" id="stages-submission" name="stage" value="submission" checked=$stage|compare:"submission" label="plugins.generic.plagiarism.manager.setting.stages.submission"}
				{fbvElement type="radio" id="stages-review" name="stage" value="review" checked=$stage|compare:"review" label="plugins.generic.plagiarism.manager.setting.stages.review"}
				{fbvElement type="radio" id="stages-copyediting" name="stage" value="copyediting" checked=$stage|compare:"copyediting" label="plugins.generic.plagiarism.manager.setting.stages.copyediting"}
				{fbvElement type="radio" id="stages-production" name="stage" value="production" checked=$stage|compare:"production" label="plugins.generic.plagiarism.manager.setting.stages.production"}
			{/fbvFormSection}
	{/fbvFormArea}

	{fbvFormButtons}
</form>

<p><span class="formRequired">{translate key="common.requiredField"}</span></p>
</div>