"""
    GdprProtectiaDatelor

Modul pentru categoria: gdpr-protectia-datelor
Contine 3 template-uri de documente juridice romanesti.
"""
module GdprProtectiaDatelor

export lista_documente, obtine_template, genereaza_document

"""Dictionar cu toate template-urile din aceasta categorie."""
const TEMPLATES = Dict{String, String}(
    "cerere-acces-date-personale" => """# Cerere de acces la datele personale (Art. 15 GDPR)

## Cand se foloseste

Pentru a solicita unei companii, institutii sau persoane care iti prelucreaza datele personale (operator de date) sa confirme ce date detine despre tine si sa iti furnizeze o copie a acestora, conform dreptului de acces prevazut de Regulamentul General privind Protectia Datelor (GDPR). Operatorul are, de regula, un termen de o luna pentru a raspunde, termen care poate fi prelungit in conditii specifice.

## Model

Catre: [DENUMIRE OPERATOR DE DATE - COMPANIE/INSTITUTIE], [ADRESA/EMAIL RESPONSABIL PROTECTIA DATELOR, DACA ESTE CUNOSCUT]

Subsemnatul/Subsemnata [NUME COMPLET], CNP [CNP, doar daca este necesar pentru identificare], domiciliat(a) in [ADRESA], avand adresa de email [EMAIL] / numarul de client [NUMAR CLIENT/CONT, daca este relevant],

in temeiul art. 15 din Regulamentul (UE) 2016/679 (GDPR), solicit prin prezenta:

- Confirmarea daca prelucrati date cu caracter personal care ma privesc;
- O copie a datelor personale pe care le detineti despre mine;
- Informatii privind scopul prelucrarii, categoriile de date prelucrate, destinatarii sau categoriile de destinatari carora le-au fost ori le vor fi divulgate datele, perioada pentru care vor fi stocate datele sau criteriile utilizate pentru a determina aceasta perioada;
- Informatii privind sursa datelor, daca acestea nu au fost colectate direct de la mine.

Va rog sa imi comunicati raspunsul in termenul legal de o luna de la primirea prezentei cereri, la adresa de email [EMAIL] / la adresa postala [ADRESA].

Data: [DATA]

Semnatura: ____________________

## Checklist

- [ ] Ai identificat corect operatorul de date (compania/institutia) si, daca este posibil, adresa responsabilului cu protectia datelor (DPO).
- [ ] Cererea include suficiente date pentru ca operatorul sa te poata identifica fara a solicita date excesive.
- [ ] Ai mentionat o adresa de contact clara pentru raspuns.
- [ ] Ai notat data trimiterii cererii, pentru a putea urmari termenul de o luna.
- [ ] Daca nu primesti raspuns sau raspunsul este nesatisfacator, ai posibilitatea de a depune o plangere la Autoritatea Nationala de Supraveghere a Prelucrarii Datelor cu Caracter Personal (ANSPDCP).
""",
    "cerere-opozitie-prelucrare-date" => """# Cerere de opozitie la prelucrarea datelor personale (Art. 21 GDPR)

## Cand se foloseste

Pentru a te opune prelucrarii datelor tale personale de catre o companie sau institutie, in special atunci cand prelucrarea se bazeaza pe interesul legitim al operatorului sau este facuta in scop de marketing direct. In cazul marketingului direct, dreptul de opozitie este absolut: operatorul trebuie sa opreasca prelucrarea in acest scop, fara a putea cere o justificare suplimentara.

## Model

Catre: [DENUMIRE OPERATOR DE DATE], [ADRESA/EMAIL RESPONSABIL PROTECTIA DATELOR, DACA ESTE CUNOSCUT]

Subsemnatul/Subsemnata [NUME COMPLET], domiciliat(a) in [ADRESA], avand adresa de email [EMAIL] / numarul de client [NUMAR CLIENT/CONT, daca este relevant],

in temeiul art. 21 din Regulamentul (UE) 2016/679 (GDPR), ma opun prelucrarii datelor mele cu caracter personal in scopul de [DESCRIE SCOPUL - DE EXEMPLU MARKETING DIRECT/PROFILARE/ALT SCOP BAZAT PE INTERES LEGITIM].

[DACA OPOZITIA SE BAZEAZA PE SITUATIA PARTICULARA, NU PE MARKETING DIRECT, ADAUGA:] Motivele pentru care ma opun acestei prelucrari, legate de situatia mea particulara, sunt: [DESCRIE MOTIVELE].

Va rog sa incetati prelucrarea datelor mele in scopul mentionat si sa imi confirmati acest lucru in scris.

Va rog sa raspundeti in termenul legal de o luna de la primirea prezentei cereri, la adresa de email [EMAIL] / la adresa postala [ADRESA].

Data: [DATA]

Semnatura: ____________________

## Checklist

- [ ] Ai precizat clar scopul prelucrarii caruia te opui (marketing direct, profilare, alt scop bazat pe interes legitim).
- [ ] Pentru opozitia la marketing direct, nu este necesara o justificare suplimentara - dreptul este absolut.
- [ ] Pentru alte tipuri de prelucrare, ai descris motivele legate de situatia ta particulara.
- [ ] Ai mentionat o adresa de contact clara pentru raspuns.
- [ ] Daca operatorul nu se conformeaza, poti depune o plangere la Autoritatea Nationala de Supraveghere a Prelucrarii Datelor cu Caracter Personal (ANSPDCP).
""",
    "cerere-stergere-date-personale" => """# Cerere de stergere a datelor personale (dreptul de a fi uitat - Art. 17 GDPR)

## Cand se foloseste

Pentru a solicita unei companii sau institutii sa stearga datele tale personale, atunci cand, de exemplu, nu mai sunt necesare scopului pentru care au fost colectate, ti-ai retras consimtamantul si nu exista alt temei legal pentru prelucrare, sau te opui prelucrarii si nu exista motive legitime care sa prevaleze. Dreptul la stergere nu este absolut: operatorul poate refuza in anumite cazuri (de exemplu obligatii legale de arhivare, exercitarea unor drepturi in instanta).

## Model

Catre: [DENUMIRE OPERATOR DE DATE], [ADRESA/EMAIL RESPONSABIL PROTECTIA DATELOR, DACA ESTE CUNOSCUT]

Subsemnatul/Subsemnata [NUME COMPLET], domiciliat(a) in [ADRESA], avand adresa de email [EMAIL] / numarul de client [NUMAR CLIENT/CONT, daca este relevant],

in temeiul art. 17 din Regulamentul (UE) 2016/679 (GDPR), solicit stergerea datelor mele cu caracter personal pe care le detineti, pentru urmatorul/urmatoarele motiv(e):

- [ALEGE MOTIVUL - DE EXEMPLU: DATELE NU MAI SUNT NECESARE SCOPULUI INITIAL; IMI RETRAG CONSIMTAMANTUL PENTRU PRELUCRARE; MA OPUN PRELUCRARII IN SCOP DE MARKETING DIRECT; DATELE AU FOST PRELUCRATE ILEGAL].

Va rog sa confirmati stergerea datelor si sa imi comunicati, daca este cazul, motivele pentru care anumite date nu pot fi sterse imediat (de exemplu obligatii legale de arhivare).

Va rog sa raspundeti in termenul legal de o luna de la primirea prezentei cereri, la adresa de email [EMAIL] / la adresa postala [ADRESA].

Data: [DATA]

Semnatura: ____________________

## Checklist

- [ ] Ai indicat un motiv concret pentru cererea de stergere, conform unuia dintre cazurile prevazute de GDPR.
- [ ] Esti constient(a) ca dreptul la stergere poate fi limitat de obligatii legale ale operatorului (de exemplu arhivare fiscala/contabila).
- [ ] Ai mentionat o adresa de contact clara pentru raspuns.
- [ ] Daca cererea este respinsa nejustificat, poti depune o plangere la Autoritatea Nationala de Supraveghere a Prelucrarii Datelor cu Caracter Personal (ANSPDCP).
"""
)

"""
    lista_documente() -> Vector{String}

Returneaza lista numelor tuturor documentelor disponibile in aceasta categorie.
"""
function lista_documente()
    return collect(keys(TEMPLATES))
end

"""
    obtine_template(nume::String) -> String

Returneaza continutul brut al template-ului cu numele dat.
Arunca `KeyError` daca documentul nu exista.
"""
function obtine_template(nume::String)
    if !haskey(TEMPLATES, nume)
        available = join(sort(collect(keys(TEMPLATES))), "\n  - ")
        error("Document \"$nume\" inexistent.\nDisponibile:\n  - $available")
    end
    return TEMPLATES[nume]
end

"""
    genereaza_document(nume::String, campuri::Dict{String,String}) -> String

Genereaza un document completat prin inlocuirea campurilor `[CAMP]` cu valorile din dictionar.

# Exemplu
```julia
doc = genereaza_document("cerere-acces-date-personale", Dict(
    "DATA" => "20.06.2026",
    "LOCALITATE" => "Piatra Neamt"
))
```
"""
function genereaza_document(nume::String, campuri::Dict{String,String})
    template = obtine_template(nume)
    result = template
    for (camp, valoare) in campuri
        result = replace(result, "[$camp]" => valoare)
    end
    return result
end

end # module