var i = 0;
var selected = "E";

function slide() {
	var button = document.getElementById('statsbutton');
	var box = document.getElementById('statsbox');
	var table = document.getElementById('statstable');
	var list = document.getElementById('listings');
	
	var t;
	var w = window.innerWidth;
	
	var v = Math.round((w*17)/100);
	
	if(button.className == 'closed') {
		if(table.style.display != 'none' && list.style.display != 'none') {
			table.style.display = 'none';
			list.style.display = 'none';
		}
		
		if(i < v) {
			++i;
			button.style.right = i + 'px';
			box.style.width = i + 'px';
			t = setTimeout("slide()", 0);
		}
		else {
			button.className = 'open';
			list.style.display = ''
			table.style.display = '';
			var selection = document.getElementById(selected);
			selection.className = 'selected';
			return;
		}
	}
	if(button.className == 'open') {
		if(table.style.display != 'none' && list.style.display != 'none') {
			table.style.display = 'none';
			list.style.display = 'none';
		}
    	
    	if(i > 0) {
    		--i;
    		button.style.right = i + 'px';
    		box.style.width = i + 'px';
    		t = setTimeout("slide()", 0);
    	}
    	else {
    		button.className = 'closed';
    		var deselection = document.getElementById(selected);
    		selected = 'E';
    		deselection.className = '_';
    		return;
    	}
    }
}

function changeSelected(coiso) {
	var deselection = document.getElementById(selected);
	deselection.className = '_';
	selected = coiso;
	document.getElementById(selected).className = 'selected';
}
