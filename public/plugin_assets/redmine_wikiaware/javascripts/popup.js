var popupStatus = 0;
function loadPopup(janela){
	if(popupStatus==0){
		$(janela).fadeIn("slow");
		popupStatus = 1;
	}
}

function disablePopup(janela){
	if(popupStatus==1){
		$(janela).fadeOut("slow");
		popupStatus = 0;
	}
}

function centerPopup( janela){
	var windowWidth = document.documentElement.clientWidth;
	var windowHeight = document.documentElement.clientHeight;
	var popupHeight = $(janela).height();
	var popupWidth = $(janela).width();
	$(janela).css({
		"position": "absolute",
		"top": windowHeight/2-popupHeight/2,
		"left": windowWidth/2-popupWidth/2
	});
}


$(document).ready(function(){
	$("#popup").click(function(){
		disablePopup("#popupContact2");
		centerPopup("#popupContact");
		loadPopup("#popupContact");		
	}); 

	$("#popup2").click(function(){
		disablePopup("#popupContact");
		centerPopup("#popupContact2");
		loadPopup("#popupContact2");
	});
	
	$(".settingsOK").click(function(){
		disablePopup("#popupContact");
	});
			
	$("#popupContactClose").click(function(){
		disablePopup("#popupContact");
	});

	$("#popupContactClose2").click(function(){
		disablePopup("#popupContact2");
	});
});



