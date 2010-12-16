var iBox = 0;
var iButton = 5;
var selectedTop = null;
var selectedBottom = null;
var resized = false;
var titled = false;

function boxResizing() {
	var box = document.getElementById('statsbox');
	var tableElements = document.getElementById('listingsTop').className;
	
	var newHeight = tableElements * 35;
	if(box.className == 'true') {
		newHeight += 25;
	}
	box.style.height = (newHeight + 50) + 'px';
}

function slide() {
	var button = document.getElementById('statsbutton');
	var box = document.getElementById('statsbox');
	var table = document.getElementById('statstable');
	var listTop = document.getElementById('listingsTop');
	var listBottom = document.getElementById('listingsBottom');
	var contentBox = document.getElementById('contentBox');
	var adminForm;
	
	if(box.className == 'true') {
		adminForm = document.getElementById('size');
	}
	
	var t;
	var w = window.innerWidth;
	
	var v = Math.round((w*17)/100);
	
	if(button.className == 'closed') {
		if(table.style.display != 'none' && listTop.style.display != 'none' && listBottom.style.display != 'none') {
			table.style.display = 'none';
			listTop.style.display = 'none';
			listBottom.style.display = 'none';
			
			if(box.className == 'true') {
				if(adminForm.style.display != 'none') {
					adminForm.style.display = 'none';
				}
			}
		}
		
		if(iBox < v) {
			box.style.borderStyle = 'solid';
			
			++iButton;
			button.style.right = iButton + 'px';
			
			++iBox;
			box.style.width = iBox + 'px';
			contentBox.style.width = iBox + 'px';
			
			if(resized == false && table.getElementsByTagName('tr').length != 0) {
				boxResizing();
				resized = true;
			}
			t = setTimeout("slide()", 0);
		}
		else {
			button.className = 'open';
			
			table.style.display = '';
			listTop.style.display = ''
			listBottom.style.display = '';
			
			if(box.className == 'true') {
				adminForm.style.display = 'block';
			}
			
			var selectionTop = document.getElementById(selectedTop);
			if(selectedTop != null) {
				selectionTop.className = 'selectedTop';
			}
			var selectionBottom = document.getElementById(selectedBottom);
			if(selectedBottom != null) {
				selectionBottom.className = 'selectedBottom';
			}
			box.style.borderStyle = 'solid';
			
			if(!titled) {
				document.getElementById('E').title = "Edited";
				document.getElementById('R').title = "Read";
				document.getElementById('C').title = "Commented";
				document.getElementById('+').title = "More";
				document.getElementById('+R').title = "Most Recently";
				titled = true;
			}
			
			return;
		}
	}
	if(button.className == 'open') {
		if(table.style.display != 'none' && listTop.style.display != 'none' && listBottom.style.display != 'none') {
			table.style.display = 'none';
			listTop.style.display = 'none';
			listBottom.style.display = 'none';
			
			if(box.className == 'true') {
				if(adminForm.style.display != 'none') {
					adminForm.style.display = 'none';
				}
			}
		}
    	
    	if(iBox > 0) {
    		--iBox;
    		--iButton;
    		button.style.right = iButton + 'px';
    		box.style.width = iBox + 'px';
    		t = setTimeout("slide()", 0);
    	}
    	else {
    		button.className = 'closed';
    		box.style.borderStyle = 'none';
    		var deselection = document.getElementById(selectedTop);
    		return;
    	}
    }
}

function changeSelectedTop(top) {
	if(selectedTop == null) {
		var edited = document.getElementById('E');
		var read = document.getElementById('R');
		var commented = document.getElementById('C');
		
		if(edited.className != '_') {
			selectedTop = 'E';
		}
		if(read.className != '_') {
			selectedTop = 'R';
		}
		if(commented.className != '_') {
			selectedTop = 'C';
		}
	}
	
	var deselection = document.getElementById(selectedTop);
	deselection.className = '_';
	selectedTop = top;
	document.getElementById(selectedTop).className = 'selectedTop';
}

function changeSelectedBottom(bottom) {
	if(selectedBottom == null) {
		var most = document.getElementById('+');
		var recently = document.getElementById('+R');
		
		if(most.className != '_') {
			selectedBottom = '+';
		}
		if(recently.className != '_') {
			selectedBottom = '+R';
		} 
	}

	var deselection = document.getElementById(selectedBottom);
	deselection.className = '_';
	selectedBottom = bottom;
	document.getElementById(selectedBottom).className = 'selectedBottom';
}
