{PROGRAMME : Carré_Magique

CONST Taille=5

TYPE Tab:tableau [1..Taille,1..Taille] de réel

Procédure InitTab(var T1:Tab) //Procédure 1 : On initialise le tableau

VAR
	i:REEL
	j:REEL

DEBUT
	POUR  i de 1 à Taille FAIRE
		POUR j de 1 à Taille FAIRE
			T1[i,j] <- 0
		FINPOUR
	FINPOUR
FIN

Procédure Test(VAR Colonne,Ligne:REEL) //Procédure 2 : Le tableau se répète; si on dépasse la taille du tableau par la droite, on revient à gauche, etc
DEBUT
	REPETER
		SI Colonne>Taille ALORS
			Colonne <-Colonne-Taille
		SINON
			Si Colonne<1 ALORS
				Colonne <= Colonne+Taille
			FINSI
		FINSI

	SI Ligne>Taille ALORS
		Ligne <- Ligne-Taille
	SINON
		SI Ligne<1 ALORS
			Ligne <- Ligne+Taille
		FINSI
	FINSI

	JUSQU'A ((Colonne>=1) ET (Colonne<=Taille)) ET ((Ligne>=1) ET (Ligne<=Taille))
FIN

Procédure PoseNombre(VAR T1:Tab; VAR Colonne,Ligne:REEL) //Procédure 3 : On place les nombres dans le tableau
VAR Nombre : REEL

DEBUT
	Nombre <- 1
	Colonne <- (Taille DIV 2)+1
	Ligne <- (Taille DIV 2)

	POUR Nombre de 1 à Taille*Taille FAIRE
		Test(Colonne,Ligne)

		SI (T1[Colonne,Ligne] <> 0) ALORS
			Colonne <- Colonne-1
			Ligne <- Ligne-1

			Test(Colonne,Ligne)
		FINSI

		T1[Colonne,Ligne] <- Nombre

		Colonne <- Colonne+1
		Ligne <- Ligne -1
	FINPOUR
FIN

Procédure AfficherTab(VAR T1:Tab) //Procédure 4 : On affiche le tableau magique
VAR i:REEL
	j:REEL

DEBUT
	POUR i de 1 à Taille FAIRE
		POUR j de 1 à Taille FAIRE
			ECRIRE(" "&T1[j,i])
		FINPOUR
	FINPOUR
FIN


//Programme principal. On appelle les procédure afin d'afficher le tableau et on indique à l'utilisateur le résultat du carré magique
VAR T1:Tab
	Somme,Colonne,Ligne:REEL

DEBUT
	InitTab(T1)

	ECRIRE("Voici votre tableau")

	PoseNombre(T1,Colonne,Ligne)

	AfficherTab(T1)

	Somme <- Taille*(Taille*Taille+1)/2
	ECRIRE("La somme pour chaque Ligne,Colonne et Diagonales du carre magique est : "&Somme)
FIN
}





//PROGRAMME :

//BUT: Faire un carré magique, où chaque lignes, colonnes et les deux diagonales ont la même somme.
//ENTREE: Un tableau au dimension de la constante
//SORTIE: Un tableau qui represente le carré magique


program Carre_Magique;

uses crt;

CONST
	Taille=5;
	
Type
	Tab=array[1..Taille,1..Taille] of integer;


	
//Procedure 1
//BUT: Initialisation tableau
//ENTREE:Le tableau
//SORTIE:Le tableau initialisé avec la valeur 0, de dimension Taille

procedure InitTab(var T1:Tab);

var
	i:integer;
	j:integer;
	
begin

	for i:=1 to Taille do
	begin
		for j:=1 to Taille do
		begin
			T1[i,j]:=0;
		end;
	end;

end;


//Procedure 2
//BUT:Permettre au tableau de se répeter ; si on est à la dernière colonne, on passera à la première colonne. Idem pour les lignes.
//ENTREE: Tableau à deux dimension
//SORTIE: Tableau qui se répète
//_______________________________________________________________________________
procedure Test(var Colonne,Ligne:integer);
begin
	repeat
		//Si Colonne est plus grand que Taille, on soustrait la Taille, ainsi, si on est tout à droite, on reviendra tout à gauche (permet au tableau de se repeter)
		if Colonne>Taille then
		begin
			Colonne:=Colonne-Taille;
		end
		//
		//Si Colonne est plus petit que 1, on additionne la Taille, ainsi, si on est tout à gauche, on ira tout à gauche (permet au tableau de se repeter)
		else
			if Colonne<1 then
			begin
				Colonne:=Colonne+Taille
			end;
		//
		
		//Si Ligne est plus grand que Taille, on soustrait la Taille, ainsi, si on est tout en bas, on reviendra en haut (permet au tableau de se repeter)
		if Ligne>Taille then
		begin
			Ligne:=Ligne-Taille;
		end
		//Si Ligne est plus petit que 1, on additionne la Taille, ainsi, si on est tout en haut, on reviendra en bas (permet au tableau de se repeter)
		else	
			if Ligne<1 then
			begin
				Ligne:=Ligne+Taille;
			end;
		//
		until ((Colonne>=1) AND (Colonne<=Taille)) AND ((Ligne>=1) AND (Ligne<=Taille));

end;




//Procedure 3
//BUT:La pose des nombres. On se deplacera au nord-est de la position du dernier nombre s'il y a un vide (materialisé en 0). Ou au nord-ouest s'il n'y a pas de vide (donc un nombre)
//ENTREE:Le Tableau
//SORTIE:Tableau avec les nombres
//_______________________________________________________________________________

procedure PoseNombre(var T1:Tab; var Colonne,Ligne:integer);
var
	nombre:integer;

begin
	
	nombre:=1;
	//On indique la position de départ : au nord du milieu
	Colonne:=(Taille DIV 2)+1;
	Ligne:=(Taille DIV 2);
	
	
  for nombre:=1 to Taille*Taille do //On commence à poser les nombres, donc la taille * la taille pour combler toutes les cases du tableau
	begin	
		
		//Appelle de la procédure Test pour rester dans le tableau
		Test(Colonne,Ligne);
		
		//On vérifie si la case est vide (Donc 0)
		if (T1[Colonne,Ligne]<>0) then
		begin
			//Si la case est occupé (<>0) on se déplace vers le nord-ouest
			Colonne:=Colonne-1;
			Ligne:=Ligne-1;
			
			//Appelle de la procédure Test pour rester dans le tableau
			Test(Colonne,Ligne);
		end;

		
		//On pose le nombre
		T1[Colonne,Ligne]:=nombre;
		
		//On se déplace vers le Nord-est comme on ne rentre pas dans le SI, donc que la case est vide
		Colonne:=Colonne+1;
		Ligne:=Ligne-1;
		
	end;

end;


//Procédure 4
//BUT:Affiche le tableau avec les valeurs
//ENTREE:Le tableau
//SORTIE:Affiche le tableau avec les valeurs
//_______________________________________________________________________________

procedure AfficherTab(var T1:Tab);
var
	i:integer;
	j:integer;

begin

	for i:=1 to Taille do
	begin
		for j:=1 to Taille do
		begin
			write(' ',T1[j,i]);
		end;
		
		writeln;
		writeln;
	end;

end;


//Programme principal
var
	T1:Tab;
	Somme,Colonne,Ligne:integer;
	
begin
	
	clrscr;
	
	InitTab(T1);//Appelle de la procédure InitTab pour initialiser le tableau
	
	Writeln('Voici votre Tableau');
	
	PoseNombre(T1,Colonne,Ligne); //Appelle de la procédure PoseNombre pour remplir le tableau
	
	writeln;
	
	AfficherTab(T1); //Appelle de la procédure AfficherTab pour afficher le tableau
	
	Somme := Taille*(Taille*Taille+1) div 2; //On calcule la somme du carré magique et on l'affiche
	writeln('La somme pour chaque Ligne,Colonne et Diagonales du carre magique est : ',Somme);
	
  readln;	

end.
