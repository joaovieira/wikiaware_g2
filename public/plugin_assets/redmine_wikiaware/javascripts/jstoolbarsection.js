// section
jsToolBar.prototype.elements.section = {
	type: 'button',
	title: 'Section',
	fn: {
		wiki: function() {
			id = parseFloat(document.getElementById('lastSectionId').className) +1
			this.encloseSelection("@{{section('Title'," + id + ")}}@\n", "\n@{{section_end(" + id + ")}}@") 
		}
	}
}
