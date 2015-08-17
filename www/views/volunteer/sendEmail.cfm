<cfscript>
	rc.title = 'Send Email to Volunteers';


	if ( !StructIsEmpty(form) && StructKeyExists(form,'email') && Len(form.email) ) {
		emailList = form.email;

		sendFrom = 'chefs@magfest.org';

		subject = 'MAGClassic Staff Suite';

		saveContent variable='emailBody' { WriteOutput("
			<p>Hi!</p>
			<p>Thank you for requesting to work in the Staff Suite for MAGClassic! We are definitely looking for help. We just have some information to share with you and a few questions to ask to make sure this is what you would really like to do to help out at MAGClassic.</p>
			<p>The Staff Suite is tasked with providing free meals to qualified volunteers, staff, and guests during the event as an added perk. We don't have a full kitchen. And sometimes we don't have enough electricity. We cook out of electric roasters, slow cookers, griddles, and rice cookers. It's not uncommon to have to scatter the equipment to make sure we don't trip a circuit (which we have done on numerous occassions.) We wash dishes in a bathroom using totes as our tubs. At MAGFest at the Gaylord, this is all done secretly. At MAGClassic at the Mark Center, we have 2 banquet rooms in the Retreat and do dishes outside on the patio.</p>
			<p>Have I scared you off yet? Sweet! You're still there! :D </p>
			<p>We do work with raw meats and vegetables and cook from scratch. Some stuff is prepared in advance, such as rouxs and stocks. We do follow safety standards and that does mean you will be washing your hands often, wearing gloves and an apron, and be required to contain your hair and remove jewelry on your hands and wrist. We do ask that you bring a hat to wear and any hair below the chin be tied back. If you forget your hat, don't worry, we provide some lovely hair bouffants.</p>
			<p>We have times of being busy and we have times of being chill. The suite is open 24 hours and so there are some late night shifts with hot food to serve as well.<p>
			<p>If you are still interested, then we just have a few questions to ask. Visit http://magsuite.jennytru.com and fill out the form. If there are any other questions, a member of the Staff Suite management will be in touch with you. You will also be able to view the job descriptions and rules on this site as well.</p>
			<p>&nbsp;</p>
			<p>Thank you for your help and we look forward to working with you at MAGClassic!</p>
			<p>MAGFest Staff Suite</p>
		");}

		vEmail = new mail();
		vEmail.setFrom('MAGClassic Staff Suite <#sendFrom#>');
		vEmail.setReplyTo(sendFrom);
		vEmail.setSubject(subject);
		vEmail.setType('html');
		vEmail.setBody(emailBody);

		for ( e in emailList ) {
			vEmail.clearAttributes('to');
			vEmail.setTo(e);
			vEmail.send();
		}
	}
</cfscript>

<cfoutput>

</cfoutput>
