
var becosVisible=false;
var linksVisible=false;
var ruasVisible=false;
var avenidasVisible=false;
var numHits = "10";
var latestId = 0;
var initializer=2;
function setCookie(NameOfCookie, value, expiredays)
{

// Three variables are used to set the new cookie.
// The name of the cookie, the value to be stored,
// and finally the number of days until the cookie expires.
// The first lines in the function convert
// the number of days to a valid date.

var ExpireDate = new Date ();
ExpireDate.setTime(ExpireDate.getTime() + (expiredays * 24 * 3600 * 1000));

// The next line stores the cookie, simply by assigning
// the values to the "document.cookie" object.
// Note the date is converted to Greenwich Mean time using
// the "toGMTstring()" function.

document.cookie = NameOfCookie + "=" + escape(value) +
((expiredays == null) ? "" : "; expires=" + ExpireDate.toGMTString());
}
function getCookie(NameOfCookie)
{

// First we check to see if there is a cookie stored.
// Otherwise the length of document.cookie would be zero.

if (document.cookie.length > 0)
{

// Second we check to see if the cookie's name is stored in the
// "document.cookie" object for the page.

// Since more than one cookie can be set on a
// single page it is possible that our cookie
// is not present, even though the "document.cookie" object
// is not just an empty text.
// If our cookie name is not present the value -1 is stored
// in the variable called "begin".

begin = document.cookie.indexOf(NameOfCookie+"=");
if (begin != -1) // Note: != means "is not equal to"
{

// Our cookie was set.
// The value stored in the cookie is returned from the function.

begin += NameOfCookie.length+1;
end = document.cookie.indexOf(";", begin);
if (end == -1) end = document.cookie.length;
return unescape(document.cookie.substring(begin, end)); }
}
return null;

// Our cookie was not set.
// The value "null" is returned from the function.

}

function expandLinks()
{
        setCookie('linksExpanded','0',21,'','','');
        linksVisible = true;
        $("linksArea").show();
}
function collapseLinks()
{
        setCookie('linksExpanded','1',21,'','','');
        linksVisible = false;
        $("linksArea").hide();
}
function toggleLinks()
{
		
        if (!linksVisible){
			refreshLinks();
			expandLinks();
			becosVisible=false;
			ruasVisible = false;
			avenidasVisible = false;
        }else   collapseLinks();
}

function expandBecos()
{
        setCookie('linksExpanded','0',21,'','','');
        becosVisible = true;
        $("linksArea").show();
}
function collapseBecos()
{
        setCookie('linksExpanded','1',21,'','','');
        becosVisible = false;
        $("linksArea").hide();
}

function toggleBecos()
{
		
        if (!becosVisible){ 
			refreshBecos();
			expandBecos();
			linksVisible = false;
			ruasVisible = false;
			avenidasVisible = false;
        }else   collapseBecos();
}

function expandRuas()
{
        setCookie('linksExpanded','0',21,'','','');
        ruasVisible = true;
        $("linksArea").show();
}
function collapseRuas()
{
        setCookie('linksExpanded','1',21,'','','');
        ruasVisible = false;
        $("linksArea").hide();
}
function toggleRuas()
{
//		window.alert(tmp);
        if (!ruasVisible){
			refreshRuas();
			expandRuas();
			becosVisible=false;
			linksVisible = false;
			avenidasVisible = false;
        }else   collapseRuas();
}

function expandAvenidas()
{
        setCookie('linksExpanded','0',21,'','','');
        avenidasVisible = true;
        $("linksArea").show();
}
function collapseAvenidas()
{
        setCookie('linksExpanded','1',21,'','','');
        avenidasVisible = false;
        $("linksArea").hide();
}
function toggleAvenidas()
{
//		window.alert(tmp);
        if (!avenidasVisible){
			refreshAvenidas();
			expandAvenidas();
			becosVisible=false;
			linksVisible = false;
			ruasVisible = false;
        }else   collapseAvenidas();
}

function links_init()
{
       refreshLinks();
}

function becos_init()
{
       refreshBecos();
}

function ruas_init()
{
       refreshRuas();
}

function avenidas_init()
{
       refreshAvenidas();
}

var preContent='0';
function refreshLinks()
{
        preContent='0';
	new Ajax.Updater('wikiLinks', '/links/index',
        {

                onCreate: function(){$('ajax-indicator').style.visibility="hidden"; },
                onSuccess: function(){$('ajax-indicator').style.visibility="visible";
				preContent =  $('wikiLinks').innerHTML;} 
        });
}

preContent='0';
function refreshBecos()
{
        preContent='0';
		new Ajax.Updater('wikiLinks', '/links/showBecos',
        {
                onCreate: function(){$('ajax-indicator').style.visibility="hidden"; },
                onSuccess: function(){$('ajax-indicator').style.visibility="visible";
				preContent =  $('wikiLinks').innerHTML;} 
        });
}

preContent='0';
function refreshRuas()
{
	var tmp = window.location.href;
	
        preContent='0';
	new Ajax.Updater('wikiLinks', '/links/showRuas',
        {
				parameters: {pagina:tmp, numeroHits:numHits},
                onCreate: function(){$('ajax-indicator').style.visibility="hidden"; },
                onSuccess: function(){$('ajax-indicator').style.visibility="visible";
				preContent =  $('wikiLinks').innerHTML;} 
        });
}

preContent='0';
function refreshAvenidas()
{
	var tmp = window.location.href;
	
        preContent='0';
	new Ajax.Updater('wikiLinks', '/links/showAvenidas',
        {
				parameters: {pagina:tmp, numeroHits:numHits},
                onCreate: function(){$('ajax-indicator').style.visibility="hidden"; },
                onSuccess: function(){$('ajax-indicator').style.visibility="visible";
				preContent =  $('wikiLinks').innerHTML;} 
        });
}
