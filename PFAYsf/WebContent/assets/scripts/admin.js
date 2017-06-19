$(document).ready(function(){

	$(".masquer").hide();
	
	$("#nlleCategorie").click(function(){
		
		$(".masquer").hide();
		
		$(".nlleCategorie").show("slow");
	})
	$("#updateCategorie").click(function(){
		$(".masquer").hide();
		$(".updateCategorie").show("slow");
	})
	$("#nouveauModule").click(function(){
		$(".masquer").hide();
		$(".nouveauModule").show("slow");
	})
	$("#updateModule").click(function(){
		$(".masquer").hide();
		$(".updateModule").show("slow");
	})
	$("#nlleMatiere").click(function(){
		$(".masquer").hide();
		$(".mlleMatiere").show("slow");
	})
	$("#updateMatiere").click(function(){
		$(".masquer").hide();
		$(".updateMatiere").show("slow");
	})
	$("#nouveauChapitre").click(function(){
		$(".masquer").hide();
		$(".nouveauChapitre").show("slow");
	})
	$("#updateChapitre").click(function(){
		$(".masquer").hide();
		$(".updateChapitre").show("slow");
	})
});
