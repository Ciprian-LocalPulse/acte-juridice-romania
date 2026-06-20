"""
    Auto

Modul pentru categoria: auto
Contine 4 template-uri de documente juridice romanesti.
"""
module Auto

export lista_documente, obtine_template, genereaza_document

"""Dictionar cu toate template-urile din aceasta categorie."""
const TEMPLATES = Dict{String, String}(
    "contract-comodat-auto" => """# Contract de comodat (imprumut de folosinta) autovehicul

## Cand se foloseste

Pentru a imprumuta temporar si gratuit un autovehicul unei alte persoane (de exemplu unui membru de familie sau prieten), fara a transfera proprietatea. Util si pentru a clarifica responsabilitatile in caz de accident, amenzi sau daune in perioada folosirii vehiculului de catre comodatar.

## Model

Incheiat astazi, [DATA], in [LOCALITATE].

### 1. Partile

Comodant (proprietar): [NUME], CNP [CNP], domiciliat in [ADRESA], identificat cu [CI/PASAPORT].

Comodatar (imprumutat): [NUME], CNP [CNP], domiciliat in [ADRESA], identificat cu [CI/PASAPORT].

### 2. Obiectul contractului

Comodantul imprumuta comodatarului, cu titlu gratuit, autovehiculul marca [MARCA/MODEL], numar de inmatriculare [NUMAR INMATRICULARE], serie sasiu [SERIE SASIU], pentru a fi folosit in scopul de [SCOPUL FOLOSIRII].

### 3. Durata

Comodatul se incheie pe perioada [DATA INCEPUT] - [DATA SFARSIT] / pe durata nedeterminata, cu posibilitatea de a fi incetat oricand de comodant, cu un preaviz de [NUMAR] zile.

### 4. Obligatiile comodatarului

Comodatarul se obliga sa:

- Foloseasca vehiculul cu prudenta si diligenta unui bun proprietar;
- Suporte costurile de combustibil si intretinere curenta pe durata folosirii;
- Restituie vehiculul la termenul stabilit, in starea in care l-a primit, in afara de uzura normala;
- Anunte imediat comodantul in caz de accident, defectiune majora sau implicare in evenimente rutiere.

### 5. Asigurare si raspundere

Comodatarul raspunde pentru amenzile de circulatie primite in perioada folosirii vehiculului si pentru eventualele daune cauzate prin culpa sa. Partile verifica impreuna valabilitatea asigurarii RCA si, daca este cazul, extind sau adapteaza polita pentru a include conducerea de catre comodatar.

### 6. Incetarea contractului

Contractul inceteaza la termen, prin restituirea vehiculului, prin acordul partilor sau prin denuntare unilaterala de catre comodant cu respectarea preavizului mentionat.

Semnaturi:

Comodant: ____________________

Comodatar: ____________________

## Checklist

- [ ] Datele vehiculului (marca, numar inmatriculare, serie sasiu) sunt corecte si complete.
- [ ] Durata folosirii este clara (perioada determinata sau conditii de incetare).
- [ ] S-a verificat valabilitatea asigurarii RCA pentru conducerea de catre comodatar.
- [ ] Sunt clare responsabilitatile in caz de amenda, accident sau dauna.
- [ ] Ai considerat si o imputernicire separata, daca comodatarul trebuie sa prezinte documente la control sau in caz de accident.
""",
    "contract-vanzare-cumparare-auto" => """# Contract de vanzare-cumparare autovehicul

## Cand se foloseste

Pentru vanzarea/cumpararea unui autovehicul intre persoane fizice sau persoane fizice si firme. Contractul trebuie sa identifice exact vehiculul (serie sasiu, numar de inmatriculare, carte de identitate a vehiculului) si sa fie folosit pentru radierea/inmatricularea la SPCRPCIV/serviciul public competent. In multe cazuri se recomanda forma scrisa cu data certa sau autentificare notariala, mai ales pentru sume mari.

## Model

Incheiat astazi, [DATA], in [LOCALITATE].

### 1. Partile

Vanzator: [NUME VANZATOR], CNP/CUI [CNP/CUI], domiciliat/cu sediul in [ADRESA], identificat cu [CI/PASAPORT].

Cumparator: [NUME CUMPARATOR], CNP/CUI [CNP/CUI], domiciliat/cu sediul in [ADRESA], identificat cu [CI/PASAPORT].

### 2. Obiectul contractului

Vanzatorul vinde, iar cumparatorul cumpara autovehiculul cu urmatoarele caracteristici:

- Marca si model: [MARCA / MODEL];
- Numar de inmatriculare: [NUMAR INMATRICULARE];
- Serie sasiu (VIN): [SERIE SASIU];
- An fabricatie: [AN FABRICATIE];
- Culoare: [CULOARE];
- Numar kilometri la predare: [KM];
- Carte de identitate a vehiculului seria/numarul: [SERIE/NUMAR CIV].

### 3. Pretul si modalitatea de plata

Pretul vanzarii este de [SUMA] [MONEDA] si se plateste prin [TRANSFER BANCAR/CASH/ALTA MODALITATE], integral la data semnarii / in urmatoarele transe: [DETALII TRANSE, daca este cazul].

### 4. Starea vehiculului si declaratii ale vanzatorului

Vanzatorul declara ca:

- Autovehiculul nu este grevat de sarcini, gajuri, sechestru sau alte interdictii de circulatie ori instrainare;
- Nu a fost implicat in evenimente rutiere nedeclarate, in limita cunostintelor sale, sau, daca a fost: [DESCRIERE EVENIMENTE];
- Vehiculul are inspectia tehnica periodica (ITP) valabila pana la [DATA] si asigurare RCA valabila pana la [DATA].

### 5. Predarea vehiculului

Predarea se face la data de [DATA], in [LOCATIE], odata cu predarea cartii de identitate a vehiculului, a cheilor (numar de seturi: [NUMAR]) si a documentelor relevante. Partile vor incheia, daca este necesar, un proces-verbal de predare-primire separat.

### 6. Obligatii privind inmatricularea/radierea

Cumparatorul se obliga sa solicite transcrierea dreptului de proprietate si, dupa caz, reinmatricularea vehiculului pe numele sau in termenul legal de la data prezentului contract. Vanzatorul se obliga sa coopereze pentru radierea temporara, daca este necesara.

### 7. Garantii

In limita prevederilor legale aplicabile vanzarii intre persoane fizice/intre persoana fizica si profesionist, vanzatorul raspunde pentru viciile ascunse ale vehiculului, in masura in care acestea existau la momentul vanzarii si nu au fost aduse la cunostinta cumparatorului.

### 8. Litigii

Eventualele neintelegeri se vor solutiona pe cale amiabila; in caz contrar, partile se vor adresa instantelor competente.

Semnaturi:

Vanzator: ____________________

Cumparator: ____________________

## Checklist

- [ ] Seria de sasiu (VIN), numarul de inmatriculare si datele din cartea de identitate a vehiculului corespund.
- [ ] Pretul si modalitatea de plata sunt clare; pentru sume mari, considera plata prin transfer bancar trasabil.
- [ ] Ai verificat daca vehiculul are sarcini, amanet sau interdictii (de exemplu printr-o verificare la RNPM sau alte registre relevante).
- [ ] Sunt mentionate ITP si RCA valabile la data vanzarii.
- [ ] S-a stabilit clar cine se ocupa de transcrierea dreptului de proprietate si in ce termen.
- [ ] Ai pastrat o copie semnata de ambele parti, plus copii ale actelor de identitate.
""",
    "imputernicire-auto" => """# Imputernicire pentru autovehicul

## Cand se foloseste

Pentru a imputernici o alta persoana sa conduca, sa prezinte la control sau, in functie de continutul concret, sa efectueze formalitati administrative legate de un autovehicul (de exemplu ITP, ridicare certificat de inmatriculare duplicat sau alte demersuri la institutiile competente). Pentru imputernicirea de a instraina (vinde) vehiculul in numele proprietarului, este recomandata forma notariala (procura speciala).

## Model

Subsemnatul/Subsemnata [NUME PROPRIETAR], CNP [CNP], domiciliat(a) in [ADRESA], identificat(a) cu [CI/PASAPORT SERIE NUMAR], in calitate de proprietar al autovehiculului marca [MARCA/MODEL], numar de inmatriculare [NUMAR INMATRICULARE], serie sasiu [SERIE SASIU],

imputernicesc prin prezenta pe [NUME IMPUTERNICIT], CNP [CNP], domiciliat in [ADRESA], identificat cu [CI/PASAPORT SERIE NUMAR],

sa conduca autovehiculul mentionat mai sus si sa efectueze, in numele meu, urmatoarele:

- [DESCRIERE ATRIBUTII - DE EXEMPLU: PREZENTARE LA ITP, RIDICARE DOCUMENTE, ALTE DEMERSURI ADMINISTRATIVE].

Prezenta imputernicire este valabila pe perioada [DATA INCEPUT] - [DATA SFARSIT] / pana la revocare.

Data: [DATA]

Semnatura proprietar: ____________________

## Checklist

- [ ] Datele vehiculului corespund cu documentele oficiale (carte de identitate a vehiculului, certificat de inmatriculare).
- [ ] Atributiile imputernicitului sunt descrise clar si limitat la ce este necesar.
- [ ] Pentru instrainarea (vanzarea) vehiculului in numele proprietarului, ai luat in calcul o procura notariala speciala, nu acest document simplu.
- [ ] Este mentionata perioada de valabilitate a imputernicirii.
- [ ] Ai verificat daca institutia/organul de control accepta forma simpla sau solicita autentificare notariala.
""",
    "proces-verbal-predare-primire-auto" => """# Proces-verbal de predare-primire autovehicul

## Cand se foloseste

Pentru a consemna starea unui autovehicul, kilometrajul si documentele/accesoriile predate, la momentul vanzarii, comodatului sau oricarei alte situatii in care vehiculul trece din posesia unei persoane in posesia alteia. Reduce riscul disputelor ulterioare privind starea vehiculului la predare.

## Model

Incheiat astazi, [DATA], in [LOCALITATE], intre:

### 1. Partile

Predator: [NUME], CNP [CNP], identificat cu [CI/PASAPORT].

Primitor: [NUME], CNP [CNP], identificat cu [CI/PASAPORT].

### 2. Vehiculul predat

Marca/model: [MARCA/MODEL]; numar inmatriculare: [NUMAR INMATRICULARE]; serie sasiu: [SERIE SASIU]; kilometraj la predare: [KM].

### 3. Starea vehiculului la predare

Stare generala (caroserie, interior, anvelope): [DESCRIERE].

Defecte/avarii constatate la predare: [DESCRIERE DEFECTE, DACA EXISTA, ALTFEL \"NU SE CONSTATA DEFECTE VIZIBILE\"].

### 4. Documente si accesorii predate

- Carte de identitate a vehiculului - seria/numarul [SERIE/NUMAR];
- Certificat de inmatriculare;
- Numar chei predate: [NUMAR];
- Alte accesorii: [DE EXEMPLU SET ROTI DE IARNA, TRUSA AUTO, ALTELE].

### 5. Combustibil (daca este relevant)

Nivel combustibil la predare: [NIVEL/FRACTIE REZERVOR].

### 6. Declaratie finala

Partile declara ca au verificat impreuna vehiculul, ca cele de mai sus corespund realitatii la momentul predarii si nu au alte obiectii de formulat in acest moment.

Semnaturi:

Predator: ____________________

Primitor: ____________________

## Checklist

- [ ] Kilometrajul si starea vehiculului sunt notate cat mai exact, ideal cu poze atasate.
- [ ] Toate documentele si cheile predate sunt enumerate.
- [ ] Eventualele defecte existente sunt mentionate explicit, pentru a evita confuzii ulterioare.
- [ ] Ambele parti au semnat si au cate o copie a procesului-verbal.
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
doc = genereaza_document("contract-comodat-auto", Dict(
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