var i = 0;
var selectedTop = null;
var selectedBottom = null;

function slide() {
	var button = document.getElementById('statsbutton');
	var box = document.getElementById('statsbox');
	var table = document.getElementById('statstable');
	var listTop = document.getElementById('listingsTop');
	var listBottom = document.getElementById('listingsBottom');
	
	var t;
	var w = window.innerWidth;
	
	var v = Math.round((w*17)/100);
	
	if(button.className == 'closed') {
		if(table.style.display != 'none' && listTop.style.display != 'none' && listBottom.style.display != 'none') {
			table.style.display = 'none';
			listTop.style.display = 'none';
			listBottom.style.display = 'none';
		}
		
		if(i < v) {
			++i;
			button.style.right = i + 'px';
			box.style.width = i + 'px';
			t = setTimeout("slide()", 0);
		}
		else {
			button.className = 'open';
			listTop.style.display = ''
			listBottom.style.display = '';
			table.style.display = '';
			var selectionTop = document.getElementById(selectedTop);
			if(selectedTop != null) {
				selectionTop.className = 'selectedTop';
			}
			var selectionBottom = document.getElementById(selectedBottom);
			if(selectedBottom != null) {
				selectionBottom.className = 'selectedBottom';
			}
			return;
		}
	}
	if(button.className == 'open') {
		if(table.style.display != 'none' && listTop.style.display != 'none' && listBottom.style.display != 'none') {
			table.style.display = 'none';
			listTop.style.display = 'none';
			listBottom.style.display = 'none';
		}
    	
    	if(i > 0) {
    		--i;
    		button.style.right = i + 'px';
    		box.style.width = i + 'px';
    		t = setTimeout("slide()", 0);
    	}
    	else {
    		button.className = 'closed';
    		var deselection = document.getElementById(selectedTop);
    		deselection.className = '_';
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
