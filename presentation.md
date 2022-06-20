# Htériser une cursive du 17e siècle

Élodie Paupe, Université de Neuchâtel – elodie.paupe@unine.ch
Chargée de projet auprès des AAEB (Jura, Suisse)

---
### Plan de la présentation
1. Introduction: le projet "Crimes et châtiments"
2. Le corpus
    1. Choix du corpus
    2. Présentation de la main
    3. Choix de transcription
    4. Intérêt du corpus
3. Retour d'expérience sur l'entraînement de modèles HTR
    1. Transkribus
    2. Kraken (FoNDUE)
4. Conclusion et développements à venir 

---
# "Crimes et châtiments. Procès de sorcellerie et procédures criminelles: numérisation, mise en ligne et médiation"

---
## Cadre institutionnel 
* Fondation intercantonale (BE, JU, BL, BS) créée en 1985
* Fonds entre le IXe s. et 1815, parmi lesquels le plus ancien document en langue française de Suisse (1244)
* Dossiers 
    * qui concernent le diocèse de Bâle et la principauté épiscopale
    * qui concernent l'administration française (dép. du Mont-Terrible et du Haut-Rhin 1793-1814)
    * en français, en allemand et en latin

---
![bg w:600](images/DioceseprincipautefinMAfr3.jpeg)

---
## Projet de numérisation "Crimes et châtiments" (2022-2025)
* Corpus relatif à la chasse aux sorcières et aux procès criminels (documents de 1461-1797; 25 m. linéraires/~110'000 pages)
* Axes du projet : 
    * inventorisation très détaillée (en ligne : https://archives-aaeb.jura.ch/suchinfo.aspx)
    * numérisation des sources 
    * développement de modèles HTR
    * mise en ligne des numérisations et des transcriptions dans un nouveau _front-end_ 
    * médiation 
* Recherche de financement en cours 

---
# Le corpus

---
##  i. Choix du corpus

* 57 pages, soit environ 8'800 mots
* bifeuillets manuscrits
* une seule main, celle du prévôt Farine actif entre 1580-1618 (plus de 3'500 documents tous fonds confondus)
* autres mains d'archivistes pour la numérotation

![bg right w:400](images/B_168_15-2-1_0001.jpg)

---
![bg w:360](images/B_168_15-2-3_0001.jpg)

---
![bg w:400](images/B_168_15-23-1_0001.jpg)

---
## ii. Présentation de la main
![w:800](images/B_168_15-10-3_0001_perpetrez.jpg)
AAEB B 168/15-10.3 p. 1

---
## iii. Choix de transcription
* La transcription n’est pas allographétique. 
* Les lettres aux formes variables selon leur position dans le mot sont transcrites par une forme unique.
* Les majuscules se divisent en deux groupes:
    * celles qui ont une morphologie distincte de la lettre minuscule ne posent pas de problème (B, E, P, Q, R, S, T...).
    * celles qui ne se distinguent des minuscules que par la taille (A, C, D, G, V...) et sont donc difficiles à différencier. 
* Les <i/j> sont identiques et systématiquement sous forme majuscule au début d’un mot. 

---
* On peut également noter qu’il manque souvent un jambage au groupe "mm", comme dans le nom de famille Hämmerlin.

"Hämmerlin" avec six jambages     |"Hämmerlin" avec cinq jambages
---                               |---
![w:200](images/hammerlin1.jpg)   |![w:200](images/hammerlin3.jpg)
AAEB B 168/15-23.3 p. 2           |AAEB B 168/15-23.3 p. 1

* Les abréviations sont toutes développées. 
* Les césures et apostrophes sont rendus d'après l'original.

---
## iv. Intérêt du corpus
* Histoire, sociohistoire, _gender studies_: grand intérêt pour la question de la chasse au sorcière
* Histoire du droit: procédures criminelles
* Philologie: documents en langue d'oïl dans une région frontière (au sud, le franco-provençal; à l'est, les langues germaniques)
---
# Retour d'expérience sur l'entraînement de modèles HTR

---
## Deux outils testés 
* Transkribus 
* FoNDUE (basé sur le moteur HTR Kraken) 
    ⇨ vendredi, 9h30, _FoNDUE – Mise en place d’une infrastructure eScriptorium à Genève_ par Simon Gabay

---
## Transkribus

---
### Retour d'expérience avec Transkribus
1. Entraîner un modèle à partir des données du seul corpus : 

Modèle     |Nombre de mots    |CER (set de validation)
---        |---               |---
AAEB_v2    |8'800 mots        |11%

---
2. Entraîner un modèle sur un modèle pré-existant (_fine tuning_) :

Modèle     |Nombre de mots    |Modèle de base               |Epochs   |CER (set de validation)
---        |---               |---                          |---      |---
AAEB_v4    |8'800 mots        |Charter Scripts XIII-XV_M1   |100      |5.69%


---
### Résultat avec le modèle AAEB_v4

![bg left:45% w:500](B_168_15-10_2_03_bis.jpeg)

de mesme quicelui lui donnat **ung** du 
poulsat quest dedans du pappier aupres 
de la bouete de graisse, duquel, elle 
**deluoit** faire a mourir gens et bestes 
**lontesffois** quelle navoit encor fait 
a mourir **p drsonne** Mais quelle avoit 
fait a mourir les bestes suigvantes 

B168/15-10.2, p. 3.

---
3. Entraîner un modèle sur un modèle préexistant + le corpus avec les abréviations développées

Modèle        |Nombre de mots    |Modèle de base               |Epochs   |CER (set de validation)
---           |---               |---                          |---      |---
AAEB_ab_v1    |8'800 mots        |Charter Scripts XIII-XV_M1   |100      |4,68%

---
### Résultat avec le modèle AAEB_ab_v1

![bg left:45% w:500](B_168_15-10_2_03_bis.jpeg)

de mesme quicelui lui donnat **ung** du 
poulsat quest dedans du pappier aupres 
de la bouete de graisse, duquel, elle 
**de boit** faire a mourir gens et bestes 
**Contesfois** quelle navoit encor fait 
a mourir personne Mais quelle avoit 
fait a mourir les bestes suigvantes 

B168/15-10.2, p. 3.

---
![bg w:900](images/B_168_15-10_2_01_découpe.jpg)

---
AAEB_ab_v1                                          |AAEB_v4
---                                                 |---
**Du** 19 **daougst** 1609                          |**D** 19 **daougt** 1609
Aignelatte vefve de The fouvent de                  |Aignelatte vefve de The fouvent de 
Bonfolz estant chargee **par** la **Comune**        |Bonfolz estant chargee **p** la **Comme** 
**caive** et **reputation** de La plus grande       |**came** et **repuentx** de La plus grande 
**partie** de la Comunaulte **dudit Baisol**        |**ptie** de la Comunaulte **dud Baise**
A estee tiree en prison Sur precedentes             |A estee tiree en prison. Sur precedentes 
**informations** prinses, A estee interrogue        |**u formapt** prinses, A estee interrogue 
**ce jourdhi** matin. Laquelle na                   |**ceourdhoi** matin. Laquelle na
rien volsus cougnoistre                             |rien volsus congnoistre.

---
### Modèle testé sur des mains proches

![bg right:40% w:450](images/B_168-17-1-2_0001.jpg)
* Main de Nicolas Farine (1612)

WER     |CER    |Word Acc   |Char Acc
---     |---    |---        |---
68.02%  |29.81% |20.87%     |60.31%

---
![bg right:40% w:450](images/B_168-17-1-2_0002.jpg)
* Main du Dr Faibvre (1612)

WER     |CER    |Word Acc   |Char Acc
---     |---    |---        |---
85.92%  |44.29% |8.15%      |42.87%

---
## FoNDUE 

---
### Retour d'expérience 

1. Entraînement à partir des données du corpus : 

Modèle     |Nombre de mots    |Accuracy
---        |---               |---
AAEB_v1    |8'800 mots        |83,8%


--- 
### i. Tentative de binarisation (méthode Otsu)

Modèle         |Nombre de mots    |Accuracy
---            |---               |---
AAEB_bin_v1    |8'800 mots        |75,1%

![bg right:33% w:400](/Users/elodiepaupe/kDrive/AAEB_ProcéduresCriminelles/Colloque:article/Paris/gris_Otsu_information.jpeg)

---
### ii. Modification de l'architecture d'apprentissage
Un second modèle a été entraîné avec une architecture transformée: 

```
-r 0.0001 -s '[1,0,0,3 Cr3,3,16 Mp3,3 Lfys64 Lbx128 Lbx256 Do]'
```
`-r` modifie le taux d'apprentissage (valeur par défaut: 0.001)
`-s` modifie l'architecture des réseaux de neurones (par défaut:  [1,48,0,1 Cr3,3,32 Do0.1,2 Mp2,2 Cr3,3,64 Do0.1,2 Mp2,2 S1(1x12)1,3 Lbx100 Do])


---
# Conclusions

---
* Transkribus
    * Modèle développé sur la main du prévôt Farine satisfaisant
    * Résultats sur d'autres mains, même proches, insatisfaisants
* FoNDUE
    * ??
    * ??

---
Prochaines étapes: 
* créer de la vérité de terrain pour quelques mains bien représentées dans les fonds ⇨ créer des modèles spécifiques
* à partir de ces données ⇨ créer un modèle générique 
* tester d'autres architectures pour améliorer le score
* publier les transcriptions et les numérisations 


---
## Merci de votre attention !
