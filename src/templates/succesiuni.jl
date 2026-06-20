"""
    Succesiuni

Modul pentru categoria: succesiuni
Contine 5 template-uri de documente juridice romanesti.
"""
module Succesiuni

export lista_documente, obtine_template, genereaza_document

"""Dictionar cu toate template-urile din aceasta categorie."""
const TEMPLATES = Dict{String, String}(
    "acord-iesire-din-indiviziune" => """# Acord de iesire din indiviziune (partaj voluntar) intre mostenitori

## Cand se foloseste

Pentru impartirea bunurilor ramase in coproprietate (indiviziune) intre mostenitori, prin buna invoiala, fara proces in instanta. Daca masa succesorala include imobile, partajul voluntar trebuie incheiat, de regula, prin act notarial pentru a fi valabil si pentru a permite intabularea in cartea funciara. Acest model este un punct de pornire pentru negociere, nu un act notarial final.

## Model

Incheiat astazi, [DATA], intre:

### 1. Partile

[COPROPRIETAR 1 - NUME], CNP [CNP], domiciliat in [ADRESA];

[COPROPRIETAR 2 - NUME], CNP [CNP], domiciliat in [ADRESA];

[ADAUGA RANDURI PENTRU FIECARE COPROPRIETAR]

denumiti in continuare \"Partile\", in calitate de mostenitori ai defunctului/defunctei [NUME DEFUNCT], decedat(a) la data de [DATA DECESULUI], aflati in indiviziune asupra bunurilor descrise mai jos.

### 2. Bunurile aflate in indiviziune

Partile recunosc ca se afla in indiviziune asupra urmatoarelor bunuri:

- [BUN 1 - DESCRIERE COMPLETA SI VALOARE ESTIMATA];
- [BUN 2 - DESCRIERE COMPLETA SI VALOARE ESTIMATA];
- [ADAUGA TOATE BUNURILE RELEVANTE].

### 3. Modul de impartire

Partile convin de comun acord urmatorul mod de impartire a bunurilor mentionate:

- [COPROPRIETAR 1] primeste in exclusivitate: [BUNURI ATRIBUITE];
- [COPROPRIETAR 2] primeste in exclusivitate: [BUNURI ATRIBUITE];
- [ADAUGA PENTRU FIECARE PARTE].

### 4. Sulte si compensatii

Pentru echilibrarea valorilor atribuite, [COPROPRIETAR X] va plati catre [COPROPRIETAR Y] suma de [SUMA] [MONEDA], cu titlu de sulta, in termen de [TERMEN], prin [MODALITATE DE PLATA].

### 5. Efectele partajului

Partile declara ca, dupa executarea prezentului acord, nu mai au niciun fel de pretentii unele fata de celelalte cu privire la bunurile mentionate, sub rezerva formalizarii partajului prin act notarial, in cazul imobilelor.

### 6. Mentiuni finale

Prezentul acord constituie un cadru de negociere intre parti si nu produce, prin el insusi, transfer de proprietate asupra imobilelor. Transferul efectiv al imobilelor se va realiza prin act de partaj notarial sau hotarare judecatoreasca, conform legii.

Semnaturi:

[COPROPRIETAR 1]: ____________________

[COPROPRIETAR 2]: ____________________

## Checklist

- [ ] Toti coproprietarii/mostenitorii sunt mentionati si au semnat.
- [ ] Bunurile sunt descrise suficient de precis (pentru imobile: adresa, numar cadastral/carte funciara, daca exista).
- [ ] Valorile atribuite fiecarei parti sunt cat mai echilibrate sau exista sulte clar calculate.
- [ ] Stii ca, pentru imobile, e necesar un act de partaj notarial sau o hotarare judecatoreasca pentru intabulare.
- [ ] Ai verificat eventualele datorii ale defunctului care ar putea afecta masa partajabila.
""",
    "cerere-dezbatere-succesiune-notar" => """# Cerere de dezbatere a succesiunii la notar

## Cand se foloseste

Pentru a initia procedura succesorala notariala in fata unui notar public, de regula cel din circumscriptia ultimului domiciliu al defunctului. Notarul verifica registrul succesiunilor (PIVET) si poate stabili competenta in mod diferit; aceasta cerere este un punct de plecare, notarul iti va indica exact ce documente sunt necesare in cazul tau.

## Model

Catre: Biroul Notarului Public [NUME NOTAR/BIROU NOTARIAL]

Subsemnatul/Subsemnata [NUME COMPLET], CNP [CNP], domiciliat(a) in [ADRESA], identificat(a) cu [CI/PASAPORT SERIE NUMAR], in calitate de [GRAD DE RUDENIE/CALITATE] al/a defunctului/defunctei [NUME DEFUNCT], decedat(a) la data de [DATA DECESULUI] in [LOCUL DECESULUI], cu ultimul domiciliu in [ULTIMUL DOMICILIU AL DEFUNCTULUI],

solicit deschiderea procedurii succesorale notariale si dezbaterea succesiunii ramase de pe urma defunctului/defunctei mentionat(a) mai sus.

Anexez prezentei cereri:

- Certificat de deces (copie/original conform cerintei notarului);
- Acte de stare civila care dovedesc rudenia/calitatea (certificat nastere, certificat casatorie, daca este cazul);
- Acte de identitate ale solicitantului;
- [ALTE DOCUMENTE - extras CF, talon auto, extrase de cont, daca sunt disponibile].

Mentionez ca am cunostinta despre existenta urmatorilor alti posibili mostenitori: [NUME, daca exista, altfel \"nu am cunostinta de alti mostenitori\"].

Va rog sa imi comunicati documentele suplimentare necesare si termenul stabilit pentru dezbaterea succesiunii.

Data: [DATA]

Semnatura: ____________________

## Checklist

- [ ] Ai identificat notarul competent (de regula, cel din raza ultimului domiciliu al defunctului).
- [ ] Ai certificatul de deces si actele de stare civila care dovedesc rudenia.
- [ ] Ai o lista, chiar provizorie, a bunurilor cunoscute ale defunctului.
- [ ] Ai mentionat toti mostenitorii cunoscuti, pentru a evita complicatii ulterioare.
- [ ] Esti constient(a) de termenul de 1 an pentru optiunea succesorala (acceptare/renuntare).
""",
    "declaratie-acceptare-succesiune" => """# Declaratie de acceptare a succesiunii

## Cand se foloseste

Pentru a declara, expres si in scris, acceptarea calitatii de mostenitor al unei persoane decedate. Acceptarea poate fi expresa (printr-un act precum acesta) sau tacita (prin fapte care arata intentia de a accepta, precum folosirea bunurilor). Declaratia formala se da de regula la notarul care instrumenteaza dosarul succesoral sau, daca este cazul, la instanta. Termenul de optiune succesorala este de 1 an de la data decesului, daca legea nu prevede altfel.

## Model

Subsemnatul/Subsemnata [NUME COMPLET], CNP [CNP], domiciliat(a) in [ADRESA], identificat(a) cu [CI/PASAPORT SERIE NUMAR], in calitate de [GRAD DE RUDENIE - SOT/COPIL/PARINTE/ALTA RUDA] al/a defunctului/defunctei [NUME DEFUNCT], decedat(a) la data de [DATA DECESULUI] in [LOCUL DECESULUI], cu ultimul domiciliu in [ULTIMUL DOMICILIU AL DEFUNCTULUI],

declar prin prezenta ca accept succesiunea lasata de defunctul/defuncta mentionat(a) mai sus, in conditiile si in limitele prevazute de lege.

Declar de asemenea ca:

- Am cunostinta de existenta urmatorilor alti posibili mostenitori: [NUME SI CALITATE, daca exista, altfel \"nu am cunostinta de alti mostenitori\"];
- Masa succesorala cunoscuta cuprinde: [DESCRIERE SUMARA BUNURI - IMOBILE, CONTURI, AUTO, ALTELE];
- Inteleg ca raspund pentru datoriile succesiunii in limita activului primit, daca am acceptat succesiunea sub beneficiu de inventar, sau integral, daca am acceptat-o pur si simplu, conform regulilor aplicabile.

Data: [DATA]

Semnatura: ____________________

## Checklist

- [ ] Ai verificat termenul de 1 an de la deces pentru exercitarea optiunii succesorale.
- [ ] Sunt mentionati corect ceilalti mostenitori cunoscuti, pentru a evita contestatii ulterioare.
- [ ] Te-ai informat despre eventualele datorii ale defunctului inainte de acceptare (acceptarea poate atrage raspunderea pentru datorii).
- [ ] Stii ca declaratia formala se da, de regula, in fata unui notar public, ca parte a dosarului succesoral.
- [ ] Ai actele de stare civila relevante (certificat de deces, certificat de nastere/casatorie) pregatite pentru notar.
""",
    "declaratie-renuntare-succesiune" => """# Declaratie de renuntare la succesiune

## Cand se foloseste

Pentru a renunta, expres si in scris, la calitatea de mostenitor al unei persoane decedate, de regula atunci cand datoriile succesiunii sunt mai mari decat activul sau din alte motive personale. Renuntarea este un act grav, ireversibil in majoritatea situatiilor, si trebuie facuta in termenul legal de optiune succesorala (1 an de la data decesului, daca legea nu prevede altfel). Renuntarea se declara, de regula, la notarul public.

## Model

Subsemnatul/Subsemnata [NUME COMPLET], CNP [CNP], domiciliat(a) in [ADRESA], identificat(a) cu [CI/PASAPORT SERIE NUMAR], in calitate de [GRAD DE RUDENIE] al/a defunctului/defunctei [NUME DEFUNCT], decedat(a) la data de [DATA DECESULUI] in [LOCUL DECESULUI],

declar prin prezenta ca renunt in mod expres, total si necondiționat la succesiunea lasata de defunctul/defuncta mentionat(a) mai sus.

Declar ca am inteles ca, prin aceasta renuntare:

- Voi fi considerat(a) ca nu am avut niciodata calitatea de mostenitor in aceasta succesiune;
- Cota mea succesorala va profita celorlalti mostenitori, conform regulilor legale de devolutiune;
- Renuntarea este, de regula, irevocabila dupa exprimare, cu exceptiile prevazute de lege.

Data: [DATA]

Semnatura: ____________________

## Checklist

- [ ] Ai verificat termenul de 1 an de la deces pentru exercitarea optiunii succesorale.
- [ ] Ai luat in calcul caracterul ireversibil al renuntarii in majoritatea cazurilor.
- [ ] Ai evaluat activul si pasivul succesiunii inainte de a decide renuntarea (poti cere notarului un inventar).
- [ ] Stii catre cine se redistribuie cota ta dupa renuntare.
- [ ] Declaratia se da, de regula, in fata unui notar public; verifica procedura locala.
""",
    "testament-olograf" => """# Testament olograf

## Cand se foloseste

Pentru a dispune de bunuri pentru cazul decesului. Testamentul olograf trebuie scris integral de mana, datat si semnat de testator, fara ajutorul altei persoane si fara editare pe calculator. Nu inlocuieste sfatul unui notar, mai ales daca exista mostenitori rezervatari (copii, sot supravietuitor, parinti in unele cazuri) care au dreptul la o cota minima protejata prin lege, indiferent de continutul testamentului.

## Model

Eu, subsemnatul/subsemnata [NUME COMPLET], CNP [CNP], nascut(a) la data de [DATA NASTERII] in [LOCUL NASTERII], domiciliat(a) in [ADRESA COMPLETA], fiind in deplinatatea facultatilor mintale si actionand de buna voie, fara nicio constrangere, redactez prezentul testament olograf, prin care dispun urmatoarele pentru cazul decesului meu:

### 1. Revocarea testamentelor anterioare

Revoc expres orice testament sau dispozitie testamentara intocmita de mine anterior datei prezentului testament.

### 2. Legate si dispozitii

Las urmatoarele bunuri persoanelor de mai jos:

- [BUN 1 - DESCRIERE COMPLETA] catre [NUME BENEFICIAR 1], [GRAD DE RUDENIE/CALITATE];
- [BUN 2 - DESCRIERE COMPLETA] catre [NUME BENEFICIAR 2], [GRAD DE RUDENIE/CALITATE];
- Restul bunurilor mele, mobile si imobile, prezente si viitoare, catre [NUME BENEFICIAR/BENEFICIARI].

### 3. Executor testamentar (optional)

Numesc in calitate de executor testamentar pe [NUME], avand atributia de a asigura executarea intocmai a prezentelor dispozitii.

### 4. Mentiune privind mostenitorii rezervatari

Sunt constient(a) de existenta dispozitiilor legale privind rezerva succesorala si am intocmit prezentul testament cu respectarea acestora, in limita cunostintelor mele.

Intocmit in intregime de mana mea, astazi, [DATA COMPLETA - ZI, LUNA, AN], in [LOCALITATE].

Semnatura: ____________________

## Checklist

- [ ] Tot textul este scris de mana, integral, de testator (nu pe calculator, nu dictat altei persoane).
- [ ] Data este completa si reala (zi, luna, an).
- [ ] Semnatura este olografa, la final.
- [ ] Sunt identificati clar beneficiarii (nume complet, grad de rudenie).
- [ ] Bunurile sunt descrise suficient de precis pentru a fi identificabile.
- [ ] Ai luat in calcul rezerva succesorala a mostenitorilor rezervatari, daca exista.
- [ ] Ai discutat cu un notar despre depunerea testamentului in Registrul National Notarial de Evidenta a Liberalitatilor (RNNEL), pentru siguranta si opozabilitate.
- [ ] Pastrezi originalul intr-un loc sigur si ai informat o persoana de incredere despre existenta lui.
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
doc = genereaza_document("acord-iesire-din-indiviziune", Dict(
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