"""
    ImprumuturiSiGarantii

Modul pentru categoria: imprumuturi-si-garantii
Contine 3 template-uri de documente juridice romanesti.
"""
module ImprumuturiSiGarantii

export lista_documente, obtine_template, genereaza_document

"""Dictionar cu toate template-urile din aceasta categorie."""
const TEMPLATES = Dict{String, String}(
    "contract-de-fidejusiune-garantie-personala" => """# Contract de fidejusiune (garantie personala)

## Cand se foloseste

Pentru ca o a treia persoana (fidejusor/garant) sa garanteze personal plata unei datorii a debitorului principal fata de creditor, in cazul in care debitorul nu plateste. Util in contracte de imprumut, chirie sau alte obligatii de plata, atunci cand creditorul solicita o garantie suplimentara. Fidejusorul raspunde cu propriul patrimoniu, in conditiile stabilite in contract.

## Model

Incheiat astazi, [DATA], in [LOCALITATE].

### 1. Partile

Creditor: [NUME], CNP/CUI [CNP/CUI], domiciliat/cu sediul in [ADRESA].

Debitor principal: [NUME], CNP [CNP], domiciliat in [ADRESA].

Fidejusor (garant): [NUME], CNP [CNP], domiciliat in [ADRESA], identificat cu [CI/PASAPORT].

### 2. Obligatia garantata

Fidejusorul garanteaza executarea obligatiei de plata asumate de debitorul principal fata de creditor, in baza [CONTRACTULUI DE REFERINTA - DE EXEMPLU CONTRACT DE IMPRUMUT/CHIRIE DIN DATA..., NUMAR DE REFERINTA], constand in suma de [SUMA] [MONEDA], cu scadenta la [DATA/CONDITII].

### 3. Intinderea garantiei

Fidejusorul se obliga sa plateasca creditorului, in cazul in care debitorul principal nu isi executa obligatia la termen, suma datorata de debitor, in limita de maximum [SUMA MAXIMA GARANTATA] [MONEDA], inclusiv, daca se convine, penalitatile si dobanzile aferente.

### 4. Durata garantiei

Prezenta garantie este valabila pe perioada [DATA INCEPUT] - [DATA SFARSIT] / pana la stingerea integrala a obligatiei garantate.

### 5. Notificarea fidejusorului

Creditorul se obliga sa notifice fidejusorul in cazul neexecutarii obligatiei de catre debitorul principal, in termen de [NUMAR] zile de la scadenta neonorata, inainte de a solicita plata de la fidejusor.

### 6. Regresul fidejusorului

Daca fidejusorul plateste in locul debitorului principal, acesta are drept de regres impotriva debitorului pentru recuperarea integrala a sumelor platite.

### 7. Alte clauze

[ADAUGA CLAUZE SPECIFICE, DACA EXISTA].

Semnaturi:

Creditor: ____________________

Debitor principal: ____________________

Fidejusor: ____________________

## Checklist

- [ ] Obligatia garantata este identificata precis (contract, suma, scadenta).
- [ ] Este stabilita o limita maxima a garantiei (fidejusorul nu ar trebui sa garanteze nelimitat, fara o cifra clara).
- [ ] Durata garantiei este precizata.
- [ ] Este clar mecanismul de notificare a fidejusorului inainte de a i se cere plata.
- [ ] Fidejusorul intelege ca raspunde cu propriul patrimoniu si are drept de regres impotriva debitorului.
- [ ] Pentru garantii cu sume mari, considera autentificarea notariala.
""",
    "contract-imprumut-bani-intre-persoane-fizice" => """# Contract de imprumut de bani intre persoane fizice

## Cand se foloseste

Pentru a documenta un imprumut de bani intre doua persoane fizice (de exemplu rude, prieteni), cu sau fara dobanda, stabilind clar suma, termenul de restituire si consecintele intarzierii. Un contract scris, chiar simplu, este esential pentru a putea dovedi imprumutul si pentru a putea cere in instanta restituirea, daca este necesar.

## Model

Incheiat astazi, [DATA], in [LOCALITATE].

### 1. Partile

Imprumutator: [NUME], CNP [CNP], domiciliat in [ADRESA], identificat cu [CI/PASAPORT].

Imprumutat: [NUME], CNP [CNP], domiciliat in [ADRESA], identificat cu [CI/PASAPORT].

### 2. Obiectul contractului

Imprumutatorul imprumuta imprumutatului suma de [SUMA] [MONEDA], pe care imprumutatul o primeste si se obliga sa o restituie in conditiile prezentului contract.

### 3. Predarea sumei

Suma se preda la data semnarii prezentului contract, prin [TRANSFER BANCAR/NUMERAR], fapt confirmat de ambele parti prin semnarea prezentului document / prin chitanta separata.

### 4. Dobanda

Imprumutul este [CU TITLU GRATUIT, FARA DOBANDA / CU DOBANDA DE [PROCENT]% PE AN], calculata [MODALITATE DE CALCUL], platibila [LUNAR/LA SCADENTA, ALATURI DE SUMA IMPRUMUTATA].

### 5. Termenul de restituire

Imprumutatul se obliga sa restituie suma integral cel mai tarziu la data de [DATA SCADENTA] / in [NUMAR] rate lunare de [SUMA RATA] [MONEDA], cu scadenta in ziua [ZI] a fiecarei luni, prin [MODALITATE DE PLATA].

### 6. Intarzierea la plata

In cazul intarzierii platii, imprumutatul datoreaza penalitati de [PROCENT]% pentru fiecare zi de intarziere / dobanda legala penalizatoare, conform legii, calculata de la data scadentei si pana la data platii efective.

### 7. Rambursarea anticipata

Imprumutatul poate restitui suma imprumutata, integral sau partial, inainte de termen, fara penalitati suplimentare, daca partile nu convin altfel.

### 8. Garantii (daca este cazul)

[DESCRIE EVENTUALE GARANTII - GIRANT, BUN ADUS IN GARANTIE, ALTELE, SAU MENTIONEAZA \"NU SE CONSTITUIE GARANTII\"].

### 9. Litigii

Eventualele neintelegeri se vor solutiona pe cale amiabila; in caz contrar, partile se vor adresa instantelor competente.

Semnaturi:

Imprumutator: ____________________

Imprumutat: ____________________

## Checklist

- [ ] Suma imprumutata si moneda sunt clar mentionate, in cifre si, ideal, in litere.
- [ ] Este clar daca exista dobanda si cum se calculeaza.
- [ ] Termenul de restituire (data fixa sau rate) este precis.
- [ ] Consecintele intarzierii la plata sunt stabilite.
- [ ] Modalitatea de predare a sumei poate fi dovedita (extras bancar, chitanta).
- [ ] Pentru sume mari, ai luat in calcul autentificarea notariala, care permite si obtinerea unui titlu executoriu mai simplu.
""",
    "recunoastere-de-datorie" => """# Recunoastere de datorie

## Cand se foloseste

Pentru a documenta, ulterior, o datorie deja existenta intre doua persoane (de exemplu un imprumut acordat verbal, o suma neplatita pentru un bun sau serviciu), atunci cand nu a existat un contract scris la momentul respectiv. Recunoasterea de datorie semnata de debitor poate ajuta la dovedirea datoriei si poate sta la baza unei cereri de plata sau a unei actiuni in instanta.

## Model

Subsemnatul/Subsemnata [NUME DEBITOR], CNP [CNP], domiciliat(a) in [ADRESA], identificat(a) cu [CI/PASAPORT SERIE NUMAR],

declar prin prezenta ca datorez lui [NUME CREDITOR], CNP [CNP], domiciliat in [ADRESA], suma de [SUMA] [MONEDA], reprezentand [DESCRIE ORIGINEA DATORIEI - DE EXEMPLU IMPRUMUT ACORDAT LA DATA DE..., CONTRAVALOARE BUNURI/SERVICII NEPLATITE, ALTELE].

Recunosc aceasta datorie ca fiind certa, lichida si exigibila/care va deveni exigibila la data de [DATA SCADENTA].

Ma oblig sa restitui suma mentionata mai sus astfel: [DESCRIE MODALITATEA - INTEGRAL LA DATA DE..., IN RATE DE...].

Sunt de acord ca, in cazul neplatii la termenul mentionat, creditorul poate folosi prezenta recunoastere ca dovada a datoriei in orice demers, inclusiv in instanta.

Data: [DATA]

Semnatura debitor: ____________________

## Checklist

- [ ] Suma si originea datoriei sunt descrise clar si concret.
- [ ] Termenul de plata (data sau rate) este precizat.
- [ ] Documentul este semnat de debitor, in original.
- [ ] Pastrezi si dovezi suplimentare ale datoriei (mesaje, transferuri, facturi), daca exista.
- [ ] Pentru sume mari, considera autentificarea notariala a recunoasterii de datorie pentru o forta probatorie mai puternica.
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
doc = genereaza_document("contract-de-fidejusiune-garantie-personala", Dict(
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