<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=charset=ISO-8859-1">

<link rel="stylesheet" type="text/css" href="././assets/css/index.css">
<script src="././assets/scripts/jquery.js"></script>
<script src="././assets/scripts/admin.js"></script>

<title>Admin</title>
</head>
	<header>
	<%@ include file="header.jsp" %>
	</header>
<body>
<div>

</div>
	<!--  nouvelle categorie -->
	<div class="masquer nlleCategorie">
		<h2>nouvelle categorie</h2>
		<form method="post" enctype="multipart/form-data"
			id="formajoutercategorie">
			<input type="hidden" name="choix" value='nlleCategorie'> <input
				type="text" class="input" name="categorie" required> <br>
			<textarea name="desc" class="input textarea" required></textarea>
			<br> <input type="file" class="input" name="icon"><br>
			<input type="submit" value="Ajouter" class="button"><br>
		</form>
		
	</div>
	<!-- fin nouvelle categorie -->
	<br>
	
	<!-- select cetegorie for update -->
	<div class="masquer updateCategorie">
		<h2>Selectionner une Categorie pour la modification</h2>
		<form method="post">
			<select name="selectCategorieFormUpdate">

				<c:forEach items="${ categories }" var="categorie">
					<option value="${categorie.id }">${ categorie.categorie }</option>
				</c:forEach>
			</select> <input type="submit" value="Modifier" class="button" id="mod">

		</form>
	</div>
	<!-- update categorie -->
	<c:if test="${categorie.id!=null}">
	<h2>Modifier une categorie</h2>
	<form class="formModSup" method="post" enctype="multipart/form-data">

		

			<input type='hidden' name='choix' value='updateCategorie'>
			<input type="hidden" name="idCategorie" value="${categorie.id }">
			<input type="text" class="input" name="categorie"
				value=" ${categorie.categorie }" required>
			<br>
			<textarea name="desc" class="input textarea" required>${categorie.description }</textarea>
			<br>
			<input type="hidden" value="${categorie.icon}" name="img">
			<input type="file" class="input" name="icon">
			<br>
			<input type="submit" value="Modifier" class="button">
			<br>
		
	</form>
	
	<!-- archiver les categorie -->
	<table width="50%" align="center">
		<tr>
			<th>Icone</th>
			<th>Categorie</th>
			<th>Gerer</th>
		</tr>
		<c:forEach items="${ categories }" var="categorie">

			<tr>
				<td><img alt="${categorie.categorie }"
					src="images/${categorie.icon }"></td>
				<td>${categorie.categorie }</td>

				<td><c:choose>
						<c:when test="${categorie.archiver==true }">
							<a href="Admin?idC=${categorie.id}&archiver=0">Reactiver</a>
						</c:when>
						<c:when test="${categorie.archiver==false }">
							<a href="Admin?idC=${categorie.id}&archiver=1">Archiver</a>
						</c:when>
					</c:choose></td>
			</tr>
		</c:forEach>

	</table>
	
	</c:if>
	
	<!-- nouveau module -->
	<div class="masquer nouveauModule">
		<h2>Nouvelle Module</h2>
		<form method='post' enctype='multipart/form-data'>

			<input type='hidden' name='choix' value='nouveauModule'>
			<c:forEach items="${listeModule}" var="module">
				<input type='hidden' name='editeur' value="${module.editeur}">
			</c:forEach>

			<input type='text' name='module' class='input'
				placeholder='Titre de module' required='Champ obligatoire'>
			<br>
			<textarea name='description' class='input textarea'
				placeholder='Description du module' required='Champ obligatoire'></textarea>
			<br> <label for='icon'>Icon de module :</label> <input
				type='file' name='icon' id='icon'> <br> <select
				name="categorie">
				<c:forEach items="${ categories }" var="categorie">
					<option value="${categorie.id }">${ categorie.categorie }</option>
				</c:forEach>
			</select><br> <span>Lier les modules avec ses matiere : </span>


			<c:forEach items="${listeMatiere }" var="matiere">
				<span><input type="checkbox" name="${matiere.id }"
					value="${matiere.id }"></span>
				<span>${matiere.matiere }</span>

			</c:forEach>

			</table>
			<br>
			<button type='submit' class='button'>Sauvegarder</button>
		</form>
	
	</div>
	<!-- update module -->
	<div class="masquer updateModule">
		<div id="selectModuleForUpdate">
			<form method="post">
				<label for="selectModuleUpdate" class="label">Selectionner
					le module a modifier</label> <select name="selectModuleForUpdate"
					id="selectModuleUpdate">
					<c:forEach items="${ listeModuleById }" var="module">
						<option value="${ module.id }">${module.module }</option>
					</c:forEach>
				</select>
				<button class="submit" type="submit">Ok</button>
			</form>
		</div>
	</div>
	<c:if test="${ moduleForUpdate!=null }">

		<form method='post' enctype='multipart/form-data'>
			<c:set var="idModule" value="0" />
			<c:forEach items="${ moduleForUpdate }" var="module">
				<c:set var="idModule" value="${module.id }" />
				<input type='hidden' name='choix' value='updateModule'>
				<input type="hidden" name="idCategorie" value="${ module.id }">
				<input type='text' name='module' class='input'
					placeholder='Titre de module' required='Champ obligatoire'
					value="${ module.module }">
				<br>
				<textarea name='description' class='input textarea'
					placeholder='Description du module' required='Champ obligatoire'>${ module.description }</textarea>
				<br>
				<label for='icon'>Icon de la matiere:</label>
				<input type="hidden" name="img" value="${ module.image }">
				<input type='file' name='icon' id='icon'>
				<br>
				<select name="categorie">
					<option value="${ module.idCategorie }">${ module.categorie }</option>
					<c:forEach items="${ categories }" var="categorie">
						<option value="${categorie.id }">${ categorie.categorie }</option>
					</c:forEach>
				</select>
				<br>
				<button type="submit">Sauvegarder</button>
		</form>
		<div id="newMatiereForModule">
			<span id="ajouterMatiere">Ajouter des matieres</span> <br>
			<c:forEach items="${listeMatiere }" var="matiere">
				<c:set var="existe" value="false" />
				<c:forEach items="${ moduleMatieres}" var="moduleMatiere">
					<c:if test="${ matiere.id==moduleMatiere.idMatiere }">
						<c:set var="existe" value="true" />
					</c:if>
				</c:forEach>
				<c:if test="${ existe==false }">
					<label class="label">${matiere.matiere }</label>
					<a href="Admin?idMatiereForAdd=${matiere.id }&module=${idModule}">Ajouter</a>
					<br>
				</c:if>
			</c:forEach>
			</form>
			</c:forEach>
			<br>
			<h2>Liste des matiere du module</h2>
			<c:forEach items="${ moduleMatieres }" var="matiere">
				<span>${ matiere.matiere }</span>
				<a
					href="Admin?moduleMatiere=${matiere.id }&module=${matiere.module}">Supprimer</a>
				<br>
			</c:forEach>
			<!-- archiver les modules -->
	<table align="center">

		<tr>
			<th>Icon</th>
			<th>Module</th>
			<th>Gerer</th>
		</tr>
		<c:forEach items="${ listeModule }" var="module">

			<tr>
				<td><img alt="${module.module }" src="images/${module.image }"></td>
				<td>${module.module }</td>
				<td><c:choose>
						<c:when test="${module.archiver==true }">
							<a href="Admin?idMo=${module.id}&archiver=0">Reactiver</a>
						</c:when>
						<c:when test="${module.archiver==false }">
							<a href="Admin?idMo=${module.id}&archiver=1">Archiver</a>
						</c:when>
					</c:choose></td>
			</tr>
		</c:forEach>

	</table>
	</c:if>

	<!-- nouvelle matiere -->
	<div class="masquer mlleMatiere">
		<h2>Nouvelle Matière</h2>
		<form method='post' enctype='multipart/form-data'>
			<input type='hidden' name='choix' value='nlleMatiere'>
			<c:forEach items="${listeMatiere }" var="matiere">

				<input type='hidden' name='editeur' value="${matiere.editeur}">
			</c:forEach>
			<input type='text' name='matiere' class='input'
				placeholder='Titre de la matiere' required='Champ oblégatoire'>
			<br>
			<textarea name='description' class='input textarea'
				placeholder='Description de la matiere' required='Champ oblégatoire'></textarea>
			<br> <label for='icon'>Icon de la matiere:</label> <input
				type='file' name='icon' id='icon'> <br> <label>Lier
				la matière avec les modules:</label> <br>

			<c:forEach items="${listeModule }" var="module">
				<span><input type="checkbox" name="${module.id }"
					value="${module.id }"></span>
				<span>${module.module }</span>

			</c:forEach>
			<br>
			<button type='submit' class='button'>Sauvegarder</button>
		</form>
	
	</div>
	<!-- archiver les matieres -->
	
	
	<!-- update matiere -->
	<div class="masquer updateMatiere">
		<div id="selectMatiereForUpdate">

			<form method="post">
				<label for="selectMatiereUpdate" class="label">Selectionner
					la matiere a modifier</label> <select name="selectMatiereForUpdate"
					id="selectMatiereUpdate">
					<c:forEach items="${ listeMatiereById }" var="matiere">
						<option value="${ matiere.id }">${matiere.matiere }</option>
					</c:forEach>
				</select>
				<button class="submit" type="submit">Ok</button>
			</form>
		</div>
		
		<table align="center">

		<tr>
			<th>Icone</th>
			<th>Matiere</th>
			<th>Gerer</th>
		</tr>
		<c:forEach items="${ listeMatiere }" var="matiere">

			<tr>
				<td><img alt="${matiere.matiere }"
					src="images/${matiere.image }"></td>
				<td>${matiere.matiere }</td>
				<td><c:choose>
						<c:when test="${matiere.archiver==true }">
							<a href="Admin?idMa=${matiere.id}&archiver=0">Reactiver</a>
						</c:when>
						<c:when test="${matiere.archiver==false }">
							<a href="Admin?idMa=${matiere.id}&archiver=1">Archiver</a>
						</c:when>
					</c:choose></td>
			</tr>
		</c:forEach>

	</table>
		
	</div>
	<c:if test="${ matiereForUpdate!=null }">

		<form method='post' enctype='multipart/form-data'>
			<c:set var="idMatiere" value="0" />
			<c:forEach items="${ matiereForUpdate }" var="matiere">
				<c:set var="idMatiere" value="${matiere.id }" />
				<input type='hidden' name='choix' value='updateMatiere'>
				<input type="hidden" name="idCategorie" value="${ matiere.id }">
				<input type='text' name='matiere' class='input'
					placeholder='Titre de matiere' required='Champ obligatoire'
					value="${ matiere.matiere }">
				<br>
				<textarea name='description' class='input textarea'
					placeholder='Description du matiere' required='Champ obligatoire'>${ matiere.description }</textarea>
				<br>
				<label for='icon'>Icon de la matiere:</label>
				<input type="hidden" name="img" value="${ matiere.image }">
				<input type='file' name='icon' id='icon'>
				<br>

				<br>
				<button type="submit">Sauvegarder</button>
		</form>
		<div id="newModuleForMatiere">
			<span id="ajouterModule">Ajouter des modules</span> <br>
			<c:forEach items="${listeModule }" var="module">
				<c:set var="existe" value="false" />
				<c:forEach items="${ matiereModules}" var="matiereModule">
					<c:if test="${ module.id==matiereModule.idModule }">
						<c:set var="existe" value="true" />
					</c:if>
				</c:forEach>
				<c:if test="${ existe==false }">
					<label class="label">${module.module }</label>
					<a href="Admin?idModuleForAdd=${module.id }&matiere=${idMatiere}">Ajouter</a>
					<br>
				</c:if>
			</c:forEach>
			</form>
			</c:forEach>
			<br>
			<h2>Liste des modules du matieres</h2>
			<c:forEach items="${ matiereModules }" var="module">
				<span>${ module.module }</span>
				<a
					href="Admin?matiereModuleForDelete=${module.id }&matiere=${module.matiere}">Supprimer</a>
				<br>
			</c:forEach>
	</c:if>

	<div class="masquer nouveauChapitre">
		<!--  nouvelle chapitre -->
		<h2>nouveau chapitre</h2>
		<form method="post" enctype="multipart/form-data"
			id="formajouterchapitre">
			<input type="hidden" name="choix" value='nouveauChapitre'>
			<c:forEach items="${listeChapitre }" var="chapitre">

				<input type='hidden' name='editeur' value="${chapitre.editeur}">
			</c:forEach>
			<input type="text" class="input" name="chapitre" required> <br>
			<textarea name="desc" class="input textarea" required></textarea>
			<br> <input type="text" class="input" name="question" required>
			<select name="selectMatiereFormUpdate">
				<c:forEach items="${ listeMatiere }" var="matiere">
					<option value="${matiere.id }">${ matiere.matiere }</option>
				</c:forEach>
			</select> importer un Cours : <input type="file" class="input" name="fichier"><br>

			<input type="submit" value="Ajouter" class="button"><br>
		</form>
	</div>


	<!-- fin nouvelle chapitre -->
	
	<!-- select chapitre for update -->
	<div class="masquer updateChapitre">
		<h2>Selectionner un Chapitre pour la modification</h2>
		<form method="post">


			<select name="selectChapitreFormUpdate">
				<c:forEach items="${ listeChapitreById }" var="chapitre">
					<option value="${chapitre.id }">${ chapitre.chapitre }</option>
				</c:forEach>
			</select> <input type="submit" value="Modifier" class="button" id="mod">


		</form>
	</div>
	<!-- update chapitre -->
	<c:if test="${chapitre.id!=null}">
	<h2>Modifier un chapitre</h2>
	<form class="formModSup" method="post" enctype="multipart/form-data">

		

			<input type='hidden' name='choix' value='updateChapitre'>
			<input type="hidden" name="idChapitre" value="${chapitre.id }">
			<input type="text" class="input" name="chapitre"
				value=" ${chapitre.chapitre }" required>
			<br>
			<textarea name="desc" class="input textarea" required>${chapitre.description }</textarea>
			<br>
			<input type="text" class="input" name="question"
				value=" ${chapitre.question }" required>
			<select name="selectMatiereFormUpdate">
				<c:forEach items="${ listeMatiere }" var="matiere">
					<option value="${matiere.id }">${ matiere.matiere }</option>
				</c:forEach>
			</select>
			<input type="hidden" value="${chapitre.fichier}" name="img">
			<input type="file" class="input" name="icon">
			<br>
			<input type="submit" value="Modifier" class="button">
			
	</form>
	<!-- archiver les chapitres -->
	<table align="center">

		<tr>
			<th>Chapitre</th>
			<th>Description</th>
			<th>Gerer</th>
		</tr>
		<c:forEach items="${ listeChapitre }" var="chapitre">

			<tr>
				<td>${chapitre.chapitre}</td>
				<td>${chapitre.description }</td>
				<td><c:choose>
						<c:when test="${chapitre.archiver==true }">
							<a href="Admin?idCh=${chapitre.id}&archiver=0">Reactiver</a>
						</c:when>
						<c:when test="${chapitre.archiver==false }">
							<a href="Admin?idCh=${chapitre.id}&archiver=1">Archiver</a>
						</c:when>
					</c:choose></td>
			</tr>
		</c:forEach>

	</table>
</c:if>

</body>
</html>