<cfsilent>
	<cfscript>
		rc.title = 'MAGClassic September 11-13, 2015';
	</cfscript>
</cfsilent>

<cfoutput>
    <h1>#rc.title# <small>Staff Suite Menu, Schedule, and Information</small></h1>
    
    <p>The Staff Suite for MAGClassic will be open Thursday night for load-in/setup staff and Friday morning for all other staff and guests. The suite will close at 4pm or when the food runs out, whichever happens first.</p>
    
    <h2>Meal &amp; Menu Schedule:</h2>
    <p>More menu information can be found on the <a href="#buildUrl('menu')#">menu page</a></p>
    
    <ul class="list-unstyled front-menu">
        <li><h3 class="h4">Thursday</h3>
            <ul>
                <li><strong>Late Dinner</strong> : 9pm - 4am &ndash; Japanese Curry</li>
            </ul>
        </li>
        <li><h3 class="h4">Friday</h3>
            <ul>
                <li><strong>Breakfast</strong> : 7am - 11am &ndash; Scrambled Eggs &amp; Biscuits</li>
                <li><strong>Lunch</strong> : 12pm - 4pm &ndash; Cold Sandwiches</li>
                <li><strong>Dinner/Overnight</strong> : 5pm-9pm/9pm-4am &ndash; Bulgogi Beef</li>
            </ul>
        </li>
        <li><h3 class="h4">Saturday</h3>
            <ul>
                <li><strong>Breakfast</strong> : 7am - 11am &ndash; Pancakes</li>
                <li><strong>Lunch</strong> : 12pm - 4pm &ndash; Cold Sandwiches</li>
                <li><strong>Dinner/Overnight</strong> : 5pm-9pm/9pm-4am &ndash; Italian Chicken</li>
            </ul>
        </li>
        <li><h3 class="h4">Sunday</h3>
            <ul>
                <li><strong>Breakfast</strong> : 7am - 11am &ndash; Bread Pudding & Rice Pudding</li>
                <li><strong>Lunch</strong> : 12pm - 4pm &ndash; Leftovers</li>
            </ul>
        </li>
    </ul>
</cfoutput>
