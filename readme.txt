Copyright 2021-2022 Raducanu George-Cristian 311CA

Tema 2 - Metode Numerice

Pentru primele 2 task-uri am respectat structura, scheletul de cod oferit, iar pentru ultimul subpunct al problemei
am utilizat pseudocodul oferit in pdf.

Task 1 - Interpolare proximala

Pentru acest task am implementat functiile din schelet:
-proximal_2x2 ce aplica interpolare proximala pe o imagine alb-negru 2x2 considerand puncte echidistante cu
pasul STEP intre ele
-proximal_2x2_RGB realizeaza acelasi lucru ca si functia precedenta numai ca pe imagini color, aplicand-o
pe fiecare canal de culoare
-proximal_resize redimensioneaza o imagine alb-negru la dimensiunile date ca parametru, mai intai prin scalare
iar apoi prin intermediul interpolarii proximale determina valoarea corespunzatoare
-proximal_resize_RGB se foloseste de functia precedenta aplicata pe fiecare canal pentru a face "resize" unei imagini
color
-proximal_rotate roteste o imagine alb-negru utilizand o matrice de rotatie corespunzatoare -rotation_angle, iar apoi
prin intermediul interpolarii aproximeaza valoarea din imaginea finala
-proximal_rotate_RGB realizeaza rotirea unei imagini color aplicand functia precedenta pe fiecare canal de culoare.

Task 2 - Interpolare bicubica

Pentru task-ul 2 am realizat urmatoarele functii din schelet:
-fx, fy, fxy, precalc_d ce calculeaza si ofera derivatele dx, dy si dxy al fiecarui punct din imagine folosindu-se
de "derivatele" ca diferente finite
-bicubic_coef calculeaza confor definitiei matricea de coeficienti de interpolare bicubica intre 4 puncte (in dreptunghi asezate)
oferite ca parametrii
-bicubic_resize redimensioneaza o imagine alb-negru la dimensiunile pxq mai intei prin scalare, iar apoi aplicand interpolarea
bicubica pentru a aproxima valoarea pixelilor
-bicubic_resize_RGB este analogul functiei precedente numai ca pe imagini color, folosindu-se de functia precedenta pe fiecare canal

Task 3 - Interpolare Lanczos

Pentru task-ul 3 am implementat algoritmii ceruti din pseudocod in Octave avand in vedere precizarile facute pe forum:
-Algoritmul bloc nesimetric Lanczos
-Algoritmul bloc rational de tip Lanczos
-Algoritmul Lanczos de bloc rational de ordin adaptiv

Feedback:
Primele 2 task-uri au fost ok, avand si un schelet, iar ultimul task a fost mai greu intrucat nu am avut schelet insa,
faptul ca am avut pseudocodul in pdf a ajutatat f mult.