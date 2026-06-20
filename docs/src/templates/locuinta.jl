"""
    Locuinta

Modul pentru categoria: locuinta
Contine 10 template-uri de documente juridice romanesti.
"""
module Locuinta

export lista_documente, obtine_template, genereaza_document

"""Dictionar cu toate template-urile din aceasta categorie."""
const TEMPLATES = Dict{String, String}(
    "acord-plata-utilitati" => """# Acord privind plata utilitatilor

Incheiat astazi, [DATA], intre [NUME PROPRIETAR] si [NUME CHIRIAS], cu privire la imobilul situat in [ADRESA].

Partile convin urmatoarele:

- chiriasul suporta utilitatile aferente perioadei [PERIOADA];
- plata se face pana la data de [ZI] a fiecarei luni;
- dovada platii se transmite prin [EMAIL/WHATSAPP/ALT CANAL];
- regularizarile se suporta de partea care a folosit efectiv imobilul in perioada aferenta consumului.

Indexuri initiale:

- electricitate: [INDEX];
- gaze: [INDEX];
- apa: [INDEX].

Proprietar: ____________________

Chirias: ____________________

""",
    "act-aditional-prelungire-inchiriere" => """# Act aditional prelungire contract inchiriere

Incheiat astazi, [DATA], intre [NUME PROPRIETAR] si [NUME CHIRIAS], parti ale contractului de inchiriere nr. [NUMAR] din [DATA].

Partile convin prelungirea duratei contractului pana la data de [DATA NOUA].

Chiria ramane [SUMA] [MONEDA] pe luna / se modifica la [SUMA] [MONEDA] pe luna, incepand cu data de [DATA].

Celelalte clauze ale contractului raman neschimbate.

Proprietar: ____________________

Chirias: ____________________

## Checklist

- [ ] Contractul initial este identificat clar.
- [ ] Noua durata este precisa.
- [ ] Chiria si garantia sunt confirmate.

""",
    "cerere-restituire-garantie-inchiriere" => """# Cerere restituire garantie inchiriere

Catre: [NUME PROPRIETAR]

Subsemnatul/Subsemnata [NUME CHIRIAS], fost chirias al imobilului situat in [ADRESA], solicit restituirea garantiei in valoare de [SUMA] [MONEDA], achitata la data de [DATA], conform contractului de inchiriere nr. [NUMAR].

Imobilul a fost predat la data de [DATA PREDARE], conform procesului-verbal anexat.

Va rog sa efectuati plata in contul [IBAN] sau prin [MOD PLATA], pana la data de [DATA].

Anexez:

- copie contract;
- dovada achitarii garantiei;
- proces-verbal de predare-primire;
- dovada platii utilitatilor, daca exista.

Data: [DATA]

Semnatura: ____________________

""",
    "contract-comodat-locuinta" => """# Contract de comodat locuinta

## Cand se foloseste

Pentru transmiterea folosintei gratuite a unei locuinte sau camere. Nu se foloseste cand exista chirie sau alta plata mascata.

## Model

Incheiat astazi, [DATA], in [LOCALITATE].

Comodant: [NUME], CNP [CNP], domiciliat in [ADRESA].

Comodatar: [NUME], CNP [CNP], domiciliat in [ADRESA].

Comodantul da spre folosinta gratuita comodatarului imobilul situat in [ADRESA COMPLETA], pentru scopul [SCOP], pe perioada [PERIOADA].

Comodatarul se obliga sa foloseasca imobilul cu diligenta, sa suporte cheltuielile de folosinta curenta, sa nu transmita folosinta catre terti fara acord scris si sa restituie imobilul la termen.

La predare se incheie proces-verbal cu starea imobilului, indexuri, chei si bunuri.

Litigiile se solutioneaza pe cale amiabila, iar in lipsa acordului de instanta competenta.

Semnaturi:

Comodant: ____________________

Comodatar: ____________________

## Checklist

- [ ] Este clar ca folosinta este gratuita.
- [ ] Sunt trecute perioada si scopul.
- [ ] Exista proces-verbal de predare.
- [ ] Sunt verificate actele de proprietate sau dreptul de folosinta.

""",
    "contract-inchiriere-locuinta" => """# Contract de inchiriere locuinta

## Cand se foloseste

Pentru inchirierea unei locuinte intre proprietar si chirias. Verifica obligatiile fiscale si forma necesara la data semnarii.

## Model

Incheiat astazi, [DATA], in [LOCALITATE].

### 1. Partile

Proprietar: [NUME PROPRIETAR], CNP [CNP], domiciliat in [ADRESA], identificat cu [CI/PASAPORT].

Chirias: [NUME CHIRIAS], CNP [CNP], domiciliat in [ADRESA], identificat cu [CI/PASAPORT].

### 2. Obiectul contractului

Proprietarul inchiriaza chiriasului locuinta situata in [ADRESA COMPLETA], compusa din [DESCRIERE], impreuna cu dreptul de folosinta asupra [ANEXE/DEPENDINTE].

### 3. Durata

Contractul se incheie pe perioada [DATA INCEPUT] - [DATA SFARSIT]. Prelungirea se poate face prin act aditional semnat de parti.

### 4. Chiria si garantia

Chiria este de [SUMA] [MONEDA] pe luna si se plateste pana la data de [ZI] a fiecarei luni prin [TRANSFER/CASH].

Garantia este de [SUMA] [MONEDA] si acopera eventuale datorii, daune sau obligatii neindeplinite, conform procesului-verbal de predare-primire.

### 5. Cheltuieli

Chiriasul suporta utilitatile si cheltuielile de intretinere aferente perioadei de folosinta, daca partile nu convin altfel in scris.

### 6. Obligatiile proprietarului

Proprietarul preda locuinta in stare corespunzatoare folosintei, asigura linistita folosinta si remediaza problemele care tin de structura sau instalatii, daca nu au fost cauzate de chirias.

### 7. Obligatiile chiriasului

Chiriasul foloseste locuinta cu prudenta, plateste chiria si utilitatile la termen, nu subinchiriaza fara acord scris si restituie locuinta la incetarea contractului.

### 8. Incetarea contractului

Contractul inceteaza la termen, prin acordul partilor sau prin notificare scrisa cu [NUMAR] zile inainte, in conditiile agreate de parti.

### 9. Anexe

- Proces-verbal de predare-primire;
- Copii acte identitate;
- Inventar bunuri;
- Fotografii la predare, daca exista.

Semnaturi:

Proprietar: ____________________

Chirias: ____________________

## Checklist

- [ ] Adresa este completa.
- [ ] Sumele si termenele sunt clare.
- [ ] Exista inventar si poze la predare.
- [ ] Este verificata obligatia de inregistrare fiscala.
- [ ] Clauzele de incetare sunt clare.

""",
    "inventar-bunuri-locuinta" => """# Inventar bunuri locuinta

Anexa la contractul nr. [NUMAR] din [DATA], pentru imobilul situat in [ADRESA].

| Nr. | Bun | Cantitate | Stare | Observatii |
| --- | --- | --- | --- | --- |
| 1 | [BUN] | [CANTITATE] | [STARE] | [OBSERVATII] |

Partile confirma ca bunurile de mai sus au fost predate la data de [DATA].

Proprietar: ____________________

Chirias/Primitor: ____________________

## Recomandare

Adauga fotografii datate si pastreaza dovada transmiterii lor catre cealalta parte.

""",
    "notificare-majorare-chirie" => """# Notificare majorare chirie

Catre: [NUME CHIRIAS]

Subsemnatul/Subsemnata [NUME PROPRIETAR], in calitate de proprietar/locator, va notific propunerea de modificare a chiriei pentru imobilul situat in [ADRESA], de la [SUMA VECHE] [MONEDA] la [SUMA NOUA] [MONEDA], incepand cu data de [DATA].

Modificarea se face conform [CLAUZA CONTRACTUALA/ACORDUL PARTILOR].

Va rog sa imi comunicati acordul sau observatiile dumneavoastra pana la data de [DATA].

Data: [DATA]

Semnatura: ____________________

## Atentie

Daca majorarea nu este prevazuta in contract, este recomandat acordul scris al ambelor parti prin act aditional.

""",
    "notificare-reziliere-inchiriere-chirias" => """# Notificare reziliere inchiriere - chirias

Catre: [NUME PROPRIETAR]

Subsemnatul/Subsemnata [NUME CHIRIAS], in calitate de chirias, va notific intentia de incetare a contractului de inchiriere nr. [NUMAR] din [DATA], pentru imobilul situat in [ADRESA], incepand cu data de [DATA INCETARE].

Voi preda imobilul la data de [DATA PREDARE], impreuna cu cheile si bunurile primite, prin proces-verbal.

Va rog sa stabilim modalitatea de verificare a imobilului si restituire a garantiei.

Data: [DATA]

Semnatura: ____________________

## Checklist

- [ ] Termenul de preaviz respecta contractul.
- [ ] Exista dovada transmiterii notificarii.
- [ ] Utilitatile sunt pregatite pentru regularizare.

""",
    "notificare-reziliere-inchiriere-proprietar" => """# Notificare reziliere inchiriere - proprietar

## Cand se foloseste

Pentru notificarea chiriasului privind incetarea contractului de inchiriere, conform contractului si legii aplicabile.

Catre: [NUME CHIRIAS]

Subsemnatul/Subsemnata [NUME PROPRIETAR], in calitate de proprietar/locator, va notific incetarea contractului de inchiriere nr. [NUMAR] din [DATA], privind imobilul situat in [ADRESA], incepand cu data de [DATA INCETARE].

Motivul notificarii: [MOTIV].

Va rog sa predati imobilul pana la data mentionata, impreuna cu cheile, accesoriile si bunurile primite, prin proces-verbal de predare-primire.

Data: [DATA]

Semnatura: ____________________

## Checklist

- [ ] Termenul de notificare respecta contractul.
- [ ] Motivul este formulat clar.
- [ ] Exista dovada comunicarii.
- [ ] Este pregatit procesul-verbal de predare.

""",
    "proces-verbal-predare-primire" => """# Proces-verbal de predare-primire locuinta

Incheiat astazi, [DATA], intre [NUME PREDATOR] si [NUME PRIMITOR], pentru locuinta situata in [ADRESA].

## Stare generala

Locuinta se preda in urmatoarea stare: [DESCRIERE].

## Indexuri

- Energie electrica: [INDEX]
- Gaze: [INDEX]
- Apa rece: [INDEX]
- Apa calda: [INDEX]
- Alte contoare: [INDEX]

## Chei si accesorii

- [NUMAR] chei acces;
- [NUMAR] chei cutie postala;
- [ALTE ACCESORII].

## Bunuri predate

| Bun | Stare | Observatii |
| --- | --- | --- |
| [BUN] | [STARE] | [OBSERVATII] |

Predator: ____________________

Primitor: ____________________

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
doc = genereaza_document("acord-plata-utilitati", Dict(
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