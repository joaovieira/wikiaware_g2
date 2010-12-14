
var lastView=-1;
$(document).ready(function() {	
  //Get all the LI from the #tabMenu UL
  $('#tabMenu > li').click(function(){        
  
   if( lastView !=    $('#tabMenu > li').index(this) ){
		 //remove the selected class from all LI    
	    $('#tabMenu > li').removeClass('selected');
		 //Reassign the LI
	    $(this).addClass('selected');
	    
	    //Hide all the DIV in .boxBody
	    $('.boxBody div').slideUp('fast');
	    
	    //Look for the right DIV in boxBody according to the Navigation UL index, therefore, the arrangement is very important.
	    $('.boxBody div:eq(' + $('#tabMenu > li').index(this) + ')').slideDown('slow');

		lastView=$('#tabMenu > li').index(this);
   }else{
		 //Hide all the DIV in .boxBody
	    	$('.boxBody div').slideUp('fast');
		lastView=-1;
	    	$(this).removeClass('selected'); 
   }
    
  }).mouseover(function() {

    //Add and remove class, Personally I dont think this is the right way to do it, anyone please suggest    
    $(this).addClass('mouseover');
    $(this).removeClass('mouseout');   
    
  }).mouseout(function() {
    
    //Add and remove class
    $(this).addClass('mouseout');
    $(this).removeClass('mouseover');    
    
  });
	$('#avenidas *').tooltip();
	$('#ruas *').tooltip();
	$('#pracas *').tooltip();
	$('#becos *').tooltip();
	$('#ilhas *').tooltip();
});
