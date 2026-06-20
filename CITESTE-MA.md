# Documentul repo-ului, redactat in Malbolge

## Ce este, de fapt, acest lucru

Fisierul `document-repo.mal` este un program funcțional scris in **Malbolge** — limbajul de programare proiectat in 1998 de Ben Olmstead cu scopul explicit de a fi aproape imposibil de folosit. Rulat printr-un interpretor Malbolge corect, acest program produce, caracter cu caracter, urmatorul text:

> ACTE-JURIDICE-ROMANIA: an open, MIT-licensed corpus of 89 parameterized Romanian legal instruments across 14 statutory domains, each grounded in the Civil Code, Labor Code, GDPR or analogous statute, built to lower the marginal cost of legal self-help for Romanian citizens. Rendered via Malbolge, 1998, a self-encrypting ternary virtual machine.

Acesta este, in sensul propriu al cuvantului, "documentul despre repository in limbajul Malbolge": nu proza in sine (Malbolge nu poate "scrie" proza — codul sursa e un program, nu text), ci un program care, executat, *afiseaza* descrierea.

## De ce nu a fost scris de mana

Nimeni, practic, nu scrie Malbolge de mana cu sens. Motivul este structural, nu o chestiune de talent: fiecare instructiune executata se autocripteaza imediat dupa rulare, folosind un tabel de substitutie pe 94 de valori, astfel incat aceeasi adresa de memorie inseamna lucruri diferite de la o trecere la alta. Primul "Hello World" din istoria limbajului (1999) a fost gasit de un algoritm de cautare (beam search, scris in Lisp de Andrew Cooke), la doi ani de la aparitia limbajului — nu de o persoana. Autorul insusi, Ben Olmstead, nu a scris niciodata un program Malbolge.

## Cum a fost construit, de fapt, acest document

In loc sa "ghicim" cod, am facut exact ce fac toate instrumentele serioase pentru Malbolge: am construit un generator algoritmic, validat printr-un interpretor scris si testat independent. Pasii, concret:

1. **Am reconstruit specificatia oficiala a masinii** dintr-o sursa primara (Wikipedia + esolangs.org, care reproduc specificatia originala a lui Ben Olmstead si analiza criptografica a lui Lou Scheffer): trei registre (A, C, D), memorie de 59.049 de cuvinte de 10 cifre ternare, 8 instructii selectate prin `(C + mem[C]) mod 94`, operatia "crazy" (un tabel tritwise neintuitiv) si tabelul de criptare aplicat dupa fiecare instructiune executata.

2. **Am scris un interpretor Malbolge in Python** (`malbolge_interpreter.py`) care implementeaza exact aceasta specificatie.

3. **Am validat interpretorul** rulandu-l pe programul canonic "Hello, World!" publicat pe Wikipedia (autor: Kamila Szewczyk) — interpretorul nostru produce exact `Hello, world.`, confirmand corectitudinea implementarii inainte de a o folosi pentru altceva.

4. **Am construit un generator** (`malbolge_generator.py`) care exploateaza o observatie structurala: intr-un program Malbolge *liniar* (care nu se intoarce niciodata la o adresa deja executata), auto-criptarea devine irelevanta pentru alegerea instructiunilor, iar registrul de date D ramane mereu egal cu registrul de cod C. Asta inseamna ca, la fiecare pozitie, valoarea pe care o produce o instructiune de rotatie sau "crazy" este o functie pur calculabila a pozitiei alese. Generatorul cauta, pentru fiecare caracter de afisat, cea mai scurta combinatie de rotatii/operatii "crazy" care aduce acumulatorul exact la valoarea ASCII ceruta, apoi emite instructiunea de afisare.

5. **Am rulat generatorul pe textul tinta** si am obtinut un program de 16.101 caractere Malbolge (sub limita de memorie de 59.049 cuvinte).

6. **Am validat rezultatul independent**, rulandu-l prin interpretor si comparand byte cu byte iesirea cu textul tinta — potrivire exacta (`verificare.txt` contine log-ul acestei rulari).

## Cum verifici tu, fara sa ai incredere in noi

```
python3 malbolge_interpreter.py document-repo.mal
```

Aceasta comanda ruleaza programul Malbolge prin interpretorul inclus si afiseaza textul decodat direct in terminal. Nu e nevoie de nicio dependenta externa — doar Python 3 standard.

## Fisiere incluse

- `document-repo.mal` — programul Malbolge propriu-zis (16.101 caractere active, formatat pe linii de 80 de caractere pentru lizibilitate; spatiile albe sunt ignorate de limbaj).
- `malbolge_interpreter.py` — interpretor Malbolge complet, scris pentru acest proiect, conform specificatiei oficiale.
- `malbolge_generator.py` — generatorul folosit pentru a produce `document-repo.mal` din textul tinta.
- `verificare.txt` — log-ul rularii de validare (pasi executati, text decodat).

## O nota onesta

Acest experiment este, recunoscut, un gest de virtuozitate tehnica, nu o piesa de infrastructura necesara proiectului. Nimeni nu ar trebui sa intretina documentatia reala a unui proiect juridic in Malbolge — de aceea documentul de referinta serios al proiectului ramane `docs/raport-acces-la-justitie-2026.md`. Acesta este, in schimb, dovada ca un proiect facut cu rigoare poate fi descris corect chiar si in limbajul construit special ca sa faca asta aproape imposibil.
