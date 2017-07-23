# Warfare Way
Projet réalisé pour le cours 420-PRB-DM<br/>
Créé par Philippe Guilmette et Étienne Boutet<br/>
Le 24 janvier 2017<br/><br/>
**PRENDRE NOTE: Le développement du jeu n'est plus continué.**

Installation
-----------------------------------------------
1. Télécharger et installer Eiffel Studio 16.05 selon votre système d’exploitation sur le site : [https://www.eiffel.org/downloads](https://www.eiffel.org/downloads)
2. Avoir le compilateur Microsoft C et le compilateur MinGW pour 32-bit et 64-bit d’installé.
3. Télécharger la librairie Eiffel_Game2 sur le site : [https://github.com/tioui/Eiffel_Game2](https://github.com/tioui/Eiffel_Game2) (branche ```master```)
	* Si vous êtes sur **Windows**, prenez la branche ```windows_build``` au lieu de ```master```.
4. Installer la librairie Eiffel_Game2
	* Sous **Windows** :
		1. Déplacer le dossier ```game2``` dans le répertoire des librairies d’Eiffel Studio (Par défaut, le dossier est dans le répertoire ```Program Files```) : ```EiffelSoftware\EiffelStudio 16.05 GPL\contrib\library```.
	* Sous **Linux (Ubuntu)** :
		1. Renommer le dossier de la librairie pour ```game2``` et le déplacer dans le répertoire des librairies d’Eiffel Studio (```contrib/library```). Par défaut, le dossier est dans le répertoire ```usr/lib/EiffelStudio_XX.XX``` ou ```/usr/local/Eiffel_XX.XX```.
		2. Installer les librairies C : ```SDL2```, ```SDL2_image```, ```SDL2_gfx```, ```SDL2_ttf```, ```OpenAL```, ```libsndfile```, ```libmpg123```, ```OpenGL```, ```GLU```, ```libepoxy``` et les kits d’outils de développement et de dépendances avec la commande suivante :
		```
		sudo apt-get install libsdl2-dev libsdl2-gfx-dev libsdl2-
		image-dev libsdl2-ttf-dev libopenal-dev libsndfile1-dev
		libmpg123-dev libepoxy-dev libgl1-mesa-dev libglu1-mesa-dev
		```
		3. Exécuter le script ```compile_c_library.sh``` du répertoire ```game2```.
5. Télécharger le jeu sur le lien : [https://github.com/iPHiLGG/warfareWay](https://github.com/iPHiLGG/warfareWay) (branche ```master```) et dézipper le fichier.
6. Pour **Windows** seulement : Prendre les fichiers contenus dans le dossier ```DDL32``` si votre Windows est en 32-bit sinon prenez les fichiers contenus dans le dossier ```DDL64``` et déplacez-les dans le répertoire du jeu (où le fichier ```.ecf``` est situé).
<br/><br/><br/>
**Note pour Linux (Ubuntu)** : Il est possible qu’une erreur survienne avec la commande ```apt-get``` qui indique que ```libsdl2-dev``` dépend de ```libgles2-mesa-dev```. Dans ce cas, exécuter les commandes suivantes :
	```
	sudo apt-get install libgles2-mesa-dev
	sudo apt-get install libsdl2-dev libsdl2-gfx-dev libsdl2-image-dev
	libsdl2-ttf-dev libopenal-dev libsndfile1-dev libmpg123-dev
	libepoxy-dev libgl1-mesa-dev libglu1-mesa-dev
	```

Compilation
-----------------------------------------------
1. Ouvrir le jeu dans Eiffel Studio 16.05 (le fichier ```warfareWay.ecf```).
2. Sur le bouton « Compiler », dans le haut, appuyer sur la petite flèche sur la droite du bouton et sélectionner « Finaliser ».