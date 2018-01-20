program cryptage_decryptage;
 uses crt,dos;
 //definition des variables
 var choix,choixA,choixA1,i,decalle:integer;
     a1,b1,c1,d1:integer;
            S,texte,clef,tc,nom:string ;
            fftext:text;


FUNCTION cesar_cryptage (txt:string;decallage:integer):string;
     var nbre,i,d:integer;res,t:string;
                                                  { Création d'une Fonction permettant de crypter un texte}
  begin
  txt:= upcase (txt);
  i:=1;res:='';
    while i<= length(txt) do begin
      if (ord(txt[i]) > 90) or (ord(txt[i]) < 65) then
        t[i]:=txt[i]
      else begin
        nbre:= (ord(txt[i]) -65);
        d:= (nbre + decallage ) mod 26 + 65;
        t[i]:= chr(d);
       end;
     res:= res + t[i];
     i:=i + 1;
    end;
  cesar_cryptage:= res;
 end;

 FUNCTION cesar_decryptage (txt:string ; decallage:integer):string;
     var nbre,i,d,nbre1:integer;res,t:string;              {Creation d'une fonction permattant de decrypter un texte}

  begin
  txt:=upcase (txt);
    i:=1;res:='';
    while i<= length(txt) do begin
      if (ord(txt[i]) > 90) or (ord(txt[i]) < 65) then
        t[i]:=txt[i]
      else begin
        nbre:= (ord(txt[i]) - 65);
        nbre1:=(nbre - decallage );
        if nbre1 < 0 then
        d:=nbre1 + 26+65
        else d:=nbre1 mod 26+65;         {difference ici avec l'insertion du moins}
        t[i]:= chr(d);
       end;
     res:= res + t[i];
     i:=i + 1;
    end;
  cesar_decryptage:= res;
 end;

FUNCTION virginere_cryptage(txt : string; cle : string; var t : string) : string;
      var i, j, nbre : integer;
     res : string;
    begin
	res :='';
	i := 0; txt:= upcase (txt); cle:= upcase (cle);
	while i <= length(txt) do begin
		j:= 1;
		while (j <= length(cle)) and ( j <= length(txt)) do begin
			if ( ord(txt[i]) > 90) or (ord(txt[i]) < 65 ) then
				t[i] := texte[i]
			else begin
				t[i] := cle[j];
				j := j+1;
			end;
			i := i+1;
		end;
	end;
	for i := 1 to length(txt) do begin
            if ( ord(txt[i]) > 90) or (ord(txt[i]) < 65 ) then
               res := res + txt[i]
            else begin
                 nbre := ord(txt[i]) mod 65 + ord(t[i]);
                 if nbre > 90 then
                    res := res + chr(nbre - 26)
                 else res := res + chr(nbre);
            end;
        end;
        t:='CLEF DECOMPOSEE : ' + t;
	virginere_cryptage := res;
end;

FUNCTION virginere_decryptage(txt : string; cle : string; var t : string) : string;
var i, j, nbre : integer;
     res : string;
begin
	res :='';
	i := 0;  txt:= upcase (txt); cle:= upcase (cle);
	while i <= length(txt) do begin
		j:= 1;
		while (j <= length(cle)) and ( j <= length(txt)) do begin
                 {Intervalle des 26 lettres de l'alphabet française dans le code ascii}
			if ( ord(txt[i]) > 90) or (ord(txt[i]) < 65 ) then
				t[i] := txt[i]
			else begin
				t[i] := cle[j];
				j := j+1;
			end;
			i := i+1;
		end;
	end;
	for i := 1 to length(txt) do begin
            if ( ord(txt[i]) > 90) or (ord(txt[i]) < 65 ) then
                res := res + texte[i]
            else begin
                 nbre := abs(ord(t[i]) -  ord(txt[i]));

                 res:=res + chr(nbre +65);
            end;
        end;
        t:='CLEF DECOMPOSEE : ' + t;
	virginere_decryptage:= res;
end;

FUNCTION alberti_cryptage (txt:string ):string;
 var i,j,nbre:integer;
 t,res,st:string ;
begin
   res:='';t:=upcase ('awvsfdliebhknrjqzgmxpucoty');
  i:=1;j:=1; txt:=upcase(txt);
   while i <= length(txt) do begin
         if (ord(txt[i]) < 65) or (ord(txt[i]) > 90) then begin
            st[i]:= txt[i];
            res:=res + st[i];
            if i mod 5 = 0 then
                  j:= j+1;
          end
          else begin
              if i mod 5 <> 0 then begin
                nbre:= ord(txt[i]) -65+j ;
                if nbre > 26 then
                st[i]:=t[nbre mod 26]
                else st[i]:=t[nbre];
             end
             else begin
             j:=j+1;
             nbre:=ord(txt[i]) -65+j ;
             if nbre > 26 then
             st[i]:= t[nbre mod 26]
             else  st[i]:= t[nbre];
           end;
         res:=res +st[i];
    end;
   i:=i +1;
   end;
 alberti_cryptage:=res;
end;

FUNCTION alberti_decryptage (txt:string ):string;
 var i,j,k,nbre:integer;
 t,res,st:string ;
begin
   res:='';t:=upcase ('awvsfdliebhknrjqzgmxpucoty');
  i:=1;j:=1; txt:=upcase(txt);
   while i <= length(txt) do begin
         if (ord(txt[i]) < 65) or (ord(txt[i]) > 90) then begin
            st[i]:= txt[i];
            if i mod 5 = 0 then
                  j:= j+1;
          end
         else begin
            k:=0;
            repeat
                k:=k +1;
            until (txt[i] = t[k]);
              if i mod 5 = 0 then
                  j:= j+1;
              nbre:= k -j;
              if nbre >= 0 then
                 st[i]:=chr(nbre+65)
             else st[i]:=chr(nbre +91);
        end;
         res:=res +st[i];
   i:=i +1;
   end;
 alberti_decryptage:=res;
end;

 FUNCTION hill_cryptage(t : string ;a:integer;b:integer;c:integer;d:integer) : string;
var i, nbre1,nbre2,Z1,Z2,k : integer;
     Y1,Y2:char;
     res ,st: string;
begin
        t:=upcase(t);
	res :='';
	i := 1;k := 1;st:='';
        while k <= length(t) do begin
            if ( ord(t[k]) <= 90) and (ord(t[k]) >= 65 ) then begin
               st:= st + t[k];
               i := i + 1;
            end;
           k := k + 1;
        end;
        i := 1;
      if length(st) mod 2 <> 0 then st := st +'X';
	while i <= length(st) do begin
                 nbre1 := (ord(st[i]) - 64); nbre2 := (ord(st[i+1]) - 64);
                 Z1:= (a*nbre1 + b*nbre2) mod 26;
                 Z2:= (c*nbre1 + d*nbre2) mod 26;
                 Y1:= chr(Z1 +64);  Y2:= chr(Z2 +64);
                 res:= res + Y1 + Y2;
                 i:=i + 2;
        end;
	hill_cryptage := res;
end;
FUNCTION hill_decryptage(t : string ;a,b,c,d:integer) : string;
var i, nbre1,nbre2,Z1,Z2,nbre,det,inv : integer;
     Y1,Y2:char;
     res : string;
begin
        t:=upcase(t);
	res :='VOICI VOTRE TEXTE CRYPTE : ';
	i := 1;
        det:=a*d-b*c;
      repeat
        nbre:= (det*i ) mod 26;
        i:=i + 2;
      until (nbre = 1);
      inv:=i-2;
        i := a;
        a := (d*inv) mod 26;
        if a <= 0 then
           a := a + 26;
        d := (i*inv) mod 26;
        if d <= 0 then
           d := d + 26;
        c := (-c*inv) mod 26;
        if c <= 0 then
           c := c + 26;
        b := (-b*inv) mod 26;
        if b <= 0 then
           b := b + 26;
        i := 1;
	while i <= length(t) do begin
                 nbre1 := (ord(t[i])- 64); nbre2 := (ord(t[i+1]) -64);
                  Z1:= (a*nbre1 + b*nbre2) mod 26;
                  Z2:= (c*nbre1 + d*nbre2) mod 26;
                 Y1:= chr(Z1 +64);  Y2:= chr(Z2 +64);
                 res:= res + Y1 + Y2;
                 i:=i + 2;
        end;
    hill_decryptage := res;
end;


 PROCEDURE format1;{Procedure permettant de créer un format de texte}
         Begin
             {TRACEE DES LIGNES ET COLONNE}
             gotoxy(11,1);{positionne le curseur à 11ème colonne et sur la 1ème ligne}
             write(chr(218));{caractère du code ascii le crochet}
           for i:=12 to 50 do {Première ligne}
              begin
              gotoxy(i,1);
              write(chr(196));
             end;
             for i:=11 to 49 do {deuxième ligne}
              begin
                  gotoxy(i,5);
                  write(chr(196));
              end;
           for i:=11 to 49 do {troisième ligne}
              begin
                  gotoxy(i,22);
                  write(chr(196));
              end;
           for i:=2 to 25 do {première colonne}
              begin
                  gotoxy(11,i);
                  write(chr(179));
              end;
                  gotoxy(11,25);
                  write(chr(192));    {ECRIT DES CROCHETS}
                  gotoxy(50,25);
                  write(chr(217));
           for i:=12 to 49 do {quatième ligne}
              begin
                  gotoxy(i,25);
                  write(chr(196));
              end;
                 gotoxy(50,1);
                 write(chr(191));
           for i:=2 to 24 do { deuxième colonne}
              begin
                 gotoxy(50,i);
                 write(chr(179));
              end;
          End;

          PROCEDURE format2;
           Begin
                textbackground(5);clrscr;format1;
                gotoxy(23,3);
                writeln('TEXTE A CRYPTER');
                gotoxy(15,9);
                writeln('[1].SAISIR INTERACTIVEMENT');
                gotoxy(15,14);
                writeln('[2].CHARGER D"UN FICHIER');
                gotoxy(15,19);
                writeln('[3].QUITTER');
                gotoxy(15,23);
                write('VOTRE CHOIX : ');

            End;

  PROCEDURE chargement_fichier (var nomfich:string);
  type fich=text;
     var  ftext:fich;
          ln : string;
    begin
    write('entrez le nom du fichier : ');
    readln(nomfich);
      assign(ftext,nomfich);
      reset(ftext);
        while not eof(ftext) do begin
         readln(ftext,ln);
         write(ln);
      end;writeln;
      writeln('appuyer sur entree pour le [de]cryptage du texte : ');
      close(ftext);
     readln;
    end;

   PROCEDURE menu_gen;
           begin
              textbackground(1);{change le fond ecran en bleu}
              clrscr;
               format1; {Appel de la procedure permettant de mettre les lignes et colonnes}
              gotoxy(23,3);
              writeln('MENU PRINCIPAL');
              gotoxy(25,11);
              writeln('[1].CRYPTER UN TEXTE');
              gotoxy(25,15);
              writeln('[2].DECRYPTER UN TEXTE');
              gotoxy(25,19);
              writeln('[3].QUITTER');
              gotoxy(25,23);
              write('VOTRE CHOIX : ');
           end;

 PROCEDURE menu_gen2; begin
            textbackground(2);clrscr; format1;
            gotoxy(15,3);
            writeln('CHOIX DE L"ALGORITHME DE CRYPTAGE');
            gotoxy(17,7);
            writeln('[1].CODE DE CESAR');
            gotoxy(17,9);
            writeln('[2].CHIFFRE DE DELASTELLE');
            gotoxy(17,11);
            writeln('[3].CHIFFRE DE TEMPLIERS');
            gotoxy(17,13);
            writeln('[4].CHIFFRE DE PIGPEN');
            gotoxy(17,15);
            writeln('[5].CHIFFRE DE VIGINERE');
            gotoxy(17,17);
            writeln('[6].CHIFFRE DE HILL');
            gotoxy(17,19);
            writeln('[7].CADRAN D"ALBERTI');
            gotoxy(17,21);
            writeln('[8].QUITTER');
            gotoxy(17,23);
            write('VOTRE CHOIX : ');
       end;
PROCEDURE menu_gen3; begin
      textbackground(2);clrscr; format1;
      gotoxy(15,3);
      writeln('CHOIX DE L"ALGORITHME DE DECRYPTAGE');
      gotoxy(17,7);
      writeln('[1].CODE DE CESAR');
      gotoxy(17,9);
      writeln('[2].CHIFFRE DE DELASTELLE');
      gotoxy(17,11);
      writeln('[3].CHIFFRE DE TEMPLIERS');
      gotoxy(17,13);
      writeln('[4].CHIFFRE DE PIGPEN');
      gotoxy(17,15);
      writeln('5.CHIFFRE DE VIGINERE');
      gotoxy(17,17);
      writeln('[6].CHIFFRE DE HILL');
      gotoxy(17,19);
      writeln('[7].CADRAN D"ALBERTI');
      gotoxy(17,21);
      writeln('[8].QUITTER');
      gotoxy(17,23);
      write('VOTRE CHOIX : ');
  end;
  PROCEDURE virginere_ecrit;  begin
  textbackground(0);
  clrscr;tc:=' ';
  writeln('ENTREZ VOTRE TEXTE A CRYPTER PUIS APPUYER SUR <ENTREE> : '); readln(texte);
  writeln('ENTREZ LA CLEF DE CRYPTAGE : ');   readln(clef);
  s:=virginere_cryptage(texte, clef,tc);writeln(tc);
  writeln('TEXTE CRYPTE : ',s);
  writeln('APPUYER SUR <ENTREE> POUR CONTINUER : ');
  readln;
end;
PROCEDURE virginere_charg; begin
     textbackground(0);CLRSCR;
     chargement_fichier(nom);
     assign(fftext,nom);
     reset(fftext);
     writeln('entrez la clef de cryptage [constituer uniquement de lettre] : ');
     readln(clef);
     while not eof(fftext) do begin
           readln(fftext,s);
           s:=virginere_cryptage(s,clef,tc);
           writeln('TEXTE CRYPTE : ',s);
     end;
     writeln('appuyer sur <entree> pour continuer : ');
     readln;
end;

PROCEDURE cesar_dec_ecrit; begin
    textbackground(0);clrscr;
    write('ENTREZ LE NOMBRE DE DECALLAGE SOUHAITE : ');readln(decalle);
    writeln('ENTREZ VOTRE TEXTE A DECRYPTER PUIS APPUYER SUR <ENTREE> : ');readln(texte);
    s:=cesar_decryptage(texte, decalle);
    writeln('TEXTE DECRYPTE : ',s);
    write('APPUYER SUR <ENTREE> POUR CONTINUER: ');
    readln; {permet d'arrêter l'exécution}
  end ;
PROCEDURE cesar_charg;  begin
     textbackground(0);CLRSCR;nom:='';
     chargement_fichier(nom);
     assign(fftext,nom);
     reset(fftext);
     write('entrez le nombre de decallage : ');
     readln(decalle);
     while not eof(fftext) do begin
           readln(fftext,s);
           s:=cesar_cryptage(s,decalle);
           writeln('TEXTE CRYPTE : ',s);
     end;
     writeln('appuyer sur <entree> pour continuer : ');
     readln;
end;
 PROCEDURE cesar_dec_charg; begin
     textbackground(0);CLRSCR;nom:='';
     chargement_fichier(nom);
     assign(fftext,nom);
     reset(fftext);
     write('entrez le nombre de decallage : ');
     readln(decalle);
     while not eof(fftext) do begin
           readln(fftext,s);
           s:=cesar_decryptage(s,decalle);
           writeln('TEXTE CRYPTE : ',s);
     end;
     writeln('appuyer sur <entree> pour continuer : ');
     readln;
end;
PROCEDURE virginere_dec_ecrit;
begin
      textbackground(0);clrscr;tc:=' ';
      writeln('ENTREZ LE TEXTE A DECRYPTER PUIS APPUYER SUR <ENTREE> : ');readln(texte);
      writeln('ENTREZ LA CLEF DE DECRYPTAGE [constituer uniquement de lettre] : ');readln(clef);
      s:=virginere_decryptage (texte, clef,tc);
      writeln(tc);
      writeln('TEXTE DECRYPTE : ',s);writeln('APPUYER SUR <ENTREE> POUR CONTINUER : ');
      readln;
    end ;
 PROCEDURE virginere_dec_charg; begin
       textbackground(0); CLRSCR;
       chargement_fichier(nom);
       assign(fftext,nom);
       reset(fftext);
       writeln('entrez la clef de decryptage [constituer uniquement de lettre] : ');
       readln(clef);
       while not eof(fftext) do begin
             readln(fftext,s);
             s:=virginere_cryptage(s,clef,tc);
             writeln(s);
       end;writeln('appuyer sur <entree> pour continuer : ');
       readln;
    end;
PROCEDURE cesar_ecrit;  begin
      textbackground(0);clrscr;
      gotoxy(10,2);
      write('ENTREZ LE NOMBRE DE DECALLAGE SOUHAITE : ');
      readln(decalle);
      gotoxy(10,3);
      writeln('ENTREZ VOTRE TEXTE A CRYPTER PUIS APPUYER SUR <ENTREE>: ');
      gotoxy(5,4);
      readln(texte);
      s:=cesar_cryptage(texte, decalle);
      writeln('TEXTE CRYPTE : ',s);
      writeln('APPUYER SUR <ENTREE> POUR CONTINUER : ');
      readln;
    end;

PROCEDURE hill_ecrit; begin
    textbackground(0);clrscr;
    writeln('ENTREZ VOTRE TEXTE A CRYPTER PUIS APPUYER SUR <ENTREE> : ');readln(texte);
    writeln('ENTREE LES VALEURS DE LA CLEF [constituer de chiffre uniquement]');
    write('entrez la 1ere valeur : ');readln(a1);
    write('entrez la 2eme valeur : ');readln(b1);
    write('entrez la 3eme valeur : ');readln(c1);
    write('entrez la 4eme valeur : ');  readln(d1);
    s:=hill_cryptage(texte,a1,b1,c1,d1);
    writeln(s);
    writeln('APPUYER SUR <ENTREE> POUR CONTINUER : ');
    readln;
  end;
PROCEDURE hill_charg; begin
     textbackground(0);CLRSCR;
     chargement_fichier(nom);
     assign(fftext,nom);
     reset(fftext);
      writeln('ENTREE LES VALEURS DE LA CLEF [constituer de chiffre uniquement]');
      write('entrez la 1ere valeur : ');readln(a1);
      write('entrez la 2eme valeur : ');readln(b1);
      write('entrez la 3eme valeur : ');readln(c1);
      write('entrez la 4eme valeur : ');readln(d1);
     while not eof(fftext) do begin
           readln(fftext,s);
           s:=hill_cryptage(s,a1,b1,c1,d1);
           writeln(s);
     end;
     writeln('appuyer sur <entree> pour continuer : ');
     readln;
end;
PROCEDURE hill_dec_ecrit; begin
    textbackground(0);clrscr;
    writeln('ENTREZ VOTRE TEXTE A CRYPTER PUIS APPUYER SUR <ENTREE> : ');readln(texte);
    writeln('ENTREE LES VALEURS DE LA CLEF [constituer de chiffre uniquement]');
    write('entrez la 1ere valeur : ');readln(a1);
    write('entrez la 2eme valeur : ');readln(b1);
    write('entrez la 3eme valeur : ');readln(c1);
    write('entrez la 4eme valeur : ');  readln(d1);
    s:=hill_decryptage(texte,a1,b1,c1,d1);
    writeln(s);
    writeln('APPUYER SUR <ENTREE> POUR CONTINUER : ');
    readln;
  end;
PROCEDURE hill_dec_charg; begin
     textbackground(0);CLRSCR;
     chargement_fichier(nom);
     assign(fftext,nom);
     reset(fftext);
      writeln('ENTREE LES VALEURS DE LA CLEF [constituer de chiffre uniquement]');
      write('entrez la 1ere valeur : ');readln(a1);
      write('entrez la 2eme valeur : ');readln(b1);
      write('entrez la 3eme valeur : ');readln(c1);
      write('entrez la 4eme valeur : ');readln(d1);
     while not eof(fftext) do begin
           readln(fftext,s);
           s:=hill_decryptage(s,a1,b1,c1,d1);
           writeln(s);
     end;
     writeln('appuyer sur <entree> pour continuer : ');
     readln;
end;


 PROCEDURE alberti_charg; begin
     textbackground(0);CLRSCR;nom:='';
     chargement_fichier(nom);
     assign(fftext,nom);
     reset(fftext);
     while not eof(fftext) do begin
           readln(fftext,s);
           s:=alberti_cryptage(s);
           writeln('TEXTE CRYPTE : ',s);
     end;
     writeln('appuyer sur <entree> pour continuer : ');
     readln;
end;
PROCEDURE alberti_ecrit;  begin
  textbackground(0);clrscr;tc:=' ';
  writeln('ENTREZ VOTRE TEXTE A CRYPTER PUIS APPUYER SUR <ENTREE> : '); readln(texte);
  s:=alberti_cryptage(texte);
  writeln('TEXTE CRYPTE : ',s);
  writeln('APPUYER SUR <ENTREE> POUR CONTINUER : ');
  readln;
end;
 PROCEDURE alberti_dec_charg; begin
     textbackground(0);CLRSCR;nom:='';
     chargement_fichier(nom);
     assign(fftext,nom);
     reset(fftext);
     while not eof(fftext) do begin
           readln(fftext,s);
           s:=alberti_decryptage(s);
           writeln('TEXTE CRYPTE : ',s);
     end;
     writeln('appuyer sur <entree> pour continuer : ');
     readln;
end;
PROCEDURE alberti_dec_ecrit;  begin
  textbackground(0);clrscr;tc:=' ';
  writeln('ENTREZ VOTRE TEXTE A CRYPTER PUIS APPUYER SUR <ENTREE> : '); readln(texte);
  s:=alberti_decryptage(texte);
  writeln('TEXTE CRYPTE : ',s);
  writeln('APPUYER SUR <ENTREE> POUR CONTINUER : ');
  readln;
end;

                  {PROGRAMME CRYPTAGE}
Procedure cryptage;
begin
   repeat {repeat du principal cas de}
                     menu_gen2; //differents algo de cryptages
                      read(choixA);clrscr;
         case choixA of
              {CRYPTAGE CESAR}
              1:begin
                    repeat
                           format2; readln(choixA1);  clrscr; {saisir ou charger un texte}
                                     if choixA1 = 1 then cesar_ecrit
                                      else if choixA1 =2 then cesar_charg;
                    until(choixA1=3);
                    clrscr;
               end;
              {CRYPTAGE VIGINERE}
              5:begin
                    repeat
                           format2; readln(choixA1);
                                     if choixA1 = 1 then virginere_ecrit
                                      else if choixA1=2 then virginere_charg;
                    until(choixA1=3);
                    clrscr;
                end;
              {CRYPTAGE DE HILL}
              6:begin
                    repeat
                          format2;
                           readln(choixA1);  clrscr;
                                     if choixA1 = 1 then hill_ecrit
                                      else if choixA1=2 then hill_charg;
                    until(choixA1=3);
                    clrscr;
                end;
                {CRYPTAGE ALBERTI}
                7:begin
                    repeat
                          format2;
                                     readln(choixA1);  clrscr;
                                     if choixA1 = 1 then alberti_ecrit
                                      else if choixA1=2 then alberti_charg;
                    until(choixA1=3);
                    clrscr;
                end;
         end;
   until(choixA=8);
    clrscr;
 end;//procedure de cryptage

 Procedure decryptage;
 begin                   {PROGRAMME DECRYPTAGE}
                       Repeat
                          menu_gen3;
                          read(choixA);  clrscr;
       case choixA of
                {DECRYPTAGE CESAR}
                1:begin
                              repeat
                                   format2;
                                    readln(choixA1);  clrscr;
                                     if choixA1=1 then cesar_dec_ecrit
                                      else if choixA1=2 then cesar_dec_charg;
                                 until(choixA1=3);
                                 clrscr;
                         end;
                 {DECRYPTAGE VIGINERE}
                5:begin
                    repeat
                          format2;
                           readln(choixA1);  clrscr;
                                     if choixA1 = 1 then virginere_dec_ecrit
                                        else if choixA1=2 then virginere_dec_charg;
                    until(choixA1=3);
                              clrscr;
                end;
                 {DECRYPTAGE DE HILL}
              6:begin
                    repeat
                          format2;
                           readln(choixA1);  clrscr;
                                     if choixA1 = 1 then hill_dec_ecrit
                                      else if choixA1=2 then hill_dec_charg;
                    until(choixA1=3);
                    clrscr;
                end;

                {DECRYPTAGE ALBERTI}
                7:begin
                    repeat
                           format2;
                                     readln(choixA1);  clrscr;
                                     if choixA1 = 1 then alberti_dec_ecrit
                                      else if choixA1=2 then alberti_dec_charg;
                    until(choixA1=3);
                    clrscr;
                end;
          end;

                 until(choixA=8);
                 clrscr;
 end;//end du decryptage
                      {DEBUT DU PROGRAMME PRINCIPAL}
BEGIN
REPEAT
       menu_gen; read(choix);clrscr;
       case choix of
             1:cryptage;
             2:decryptage;
        end ; //case
       readln;
    UNTIL choix=3;
END.





