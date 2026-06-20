"""
    Afaceri

Modul pentru categoria: afaceri
Contine 12 template-uri de documente juridice romanesti.
"""
module Afaceri

export lista_documente, obtine_template, genereaza_document

"""Dictionar cu toate template-urile din aceasta categorie."""
const TEMPLATES = Dict{String, String}(
    "acord-confidentialitate-nda-simplu" => """# Acord de confidentialitate simplu

## Cand se foloseste

Pentru discutii de afaceri, colaborari, oferte sau proiecte in care se dezvaluie informatii sensibile.

## Model

Partile:

Dezvaluitor: [NUME/DENUMIRE], CNP/CUI [CNP/CUI], [ADRESA].

Primitor: [NUME/DENUMIRE], CNP/CUI [CNP/CUI], [ADRESA].

Primitorul se obliga sa pastreze confidentiale informatiile primite in legatura cu [SCOP], inclusiv documente, date comerciale, tehnice, financiare, parole, liste de clienti si planuri de proiect.

Obligatia nu se aplica informatiilor care:

- erau publice fara culpa primitorului;
- erau deja cunoscute legal;
- sunt cerute de o autoritate competenta;
- sunt aprobate in scris pentru divulgare.

Durata obligatiei de confidentialitate este [PERIOADA].

In caz de incalcare, partea prejudiciata poate solicita repararea prejudiciului conform legii.

Semnaturi:

Dezvaluitor: ____________________

Primitor: ____________________

## Checklist

- [ ] Scopul discutiei este clar.
- [ ] Durata confidentialitatii este rezonabila.
- [ ] Sunt definite exceptiile.
- [ ] Exista semnaturi si data.

""",
    "acord-reziliere-contract" => """# Acord de reziliere contract

Incheiat astazi, [DATA], intre [PARTEA 1] si [PARTEA 2], parti ale contractului nr. [NUMAR] din [DATA].

Partile convin incetarea contractului incepand cu data de [DATA INCETARE].

Pana la data incetarii, partile confirma urmatoarele obligatii ramase:

- [OBLIGATIE 1]
- [OBLIGATIE 2]

Dupa indeplinirea obligatiilor mentionate, partile declara ca nu mai au pretentii reciproce, cu exceptia celor indicate expres aici: [EXCEPTII].

Partea 1: ____________________

Partea 2: ____________________

""",
    "contract-cesiune-drepturi-autor" => """# Contract de cesiune drepturi de autor

## Atentie

Drepturile de autor pot avea reguli speciale. Pentru proiecte importante, cere verificare juridica.

Autor/Cedent: [NUME], CNP/CUI [CNP/CUI].

Beneficiar/Cesionar: [NUME/DENUMIRE], CNP/CUI [CNP/CUI].

Autorul cesioneaza catre beneficiar drepturile patrimoniale asupra operei [DESCRIERE OPERA], pentru urmatoarele utilizari: [UTILIZARI].

Teritoriul: [TERITORIU].

Durata: [DURATA].

Remuneratia: [SUMA] [MONEDA], platibila [MODALITATE].

Drepturile morale raman ale autorului, conform legii.

Semnaturi:

Autor: ____________________

Beneficiar: ____________________

""",
    "contract-colaborare" => """# Contract de colaborare

Incheiat astazi, [DATA], intre [PARTENER 1] si [PARTENER 2].

## Obiect

Partile colaboreaza pentru [DESCRIERE PROIECT/ACTIVITATE], fiecare avand urmatoarele responsabilitati:

- [PARTENER 1]: [RESPONSABILITATI]
- [PARTENER 2]: [RESPONSABILITATI]

## Durata

Colaborarea se desfasoara in perioada [PERIOADA].

## Remuneratie

Plata / impartirea veniturilor se face astfel: [DETALII].

## Confidentialitate si imagine

Partile nu vor divulga informatii confidentiale si nu vor folosi numele sau imaginea celeilalte parti fara acord scris.

## Incetare

Contractul poate inceta prin acordul partilor sau notificare cu [NUMAR] zile inainte.

Semnaturi:

[PARTENER 1]: ____________________

[PARTENER 2]: ____________________

""",
    "contract-consultanta" => """# Contract de consultanta

Prestator/Consultant: [NUME/DENUMIRE], CNP/CUI [CNP/CUI].

Beneficiar: [NUME/DENUMIRE], CNP/CUI [CNP/CUI].

Consultantul va presta servicii de consultanta in domeniul [DOMENIU], constand in [DESCRIERE].

Onorariul este [SUMA] [MONEDA], platibil [MODALITATE].

Consultanta se bazeaza pe informatiile furnizate de beneficiar. Consultantul nu garanteaza un rezultat comercial, fiscal sau juridic daca acest lucru nu este prevazut expres.

Durata contractului: [PERIOADA].

Semnaturi:

Consultant: ____________________

Beneficiar: ____________________

## Checklist

- [ ] Domeniul consultantei este clar.
- [ ] Sunt stabilite livrabilele.
- [ ] Este exclusa confuzia dintre consultanta si rezultat garantat.

""",
    "contract-mentenanta" => """# Contract de mentenanta

Incheiat intre [PRESTATOR] si [BENEFICIAR].

## Obiect

Prestatorul asigura mentenanta pentru [SISTEM/ECHIPAMENT/SERVICIU], conform nivelului de serviciu agreat.

## Servicii incluse

- [SERVICIU 1]
- [SERVICIU 2]
- [SERVICIU 3]

## Timp de raspuns

Prestatorul raspunde solicitarilor in termen de [TERMEN], in zile lucratoare, intre orele [INTERVAL].

## Pret

Abonamentul lunar este [SUMA] [MONEDA], platibil pana la data de [ZI].

## Excluderi

Nu sunt incluse: [EXCLUDERI].

Semnaturi:

Prestator: ____________________

Beneficiar: ____________________

""",
    "contract-prestari-servicii" => """# Contract de prestari servicii

## Cand se foloseste

Pentru servicii intre profesionisti sau intre profesionist si client. Pentru servicii reglementate, fiscalitate speciala sau sume mari, cere verificare profesionala.

## Model

Incheiat astazi, [DATA], intre:

Prestator: [NUME/DENUMIRE], CNP/CUI [CNP/CUI], cu sediul/domiciliul in [ADRESA], reprezentat de [REPREZENTANT].

Beneficiar: [NUME/DENUMIRE], CNP/CUI [CNP/CUI], cu sediul/domiciliul in [ADRESA], reprezentat de [REPREZENTANT].

### 1. Obiect

Prestatorul va furniza urmatoarele servicii: [DESCRIERE SERVICII].

### 2. Termene si livrabile

Serviciile se presteaza in perioada [PERIOADA]. Livrabilele sunt: [LIVRABILE].

### 3. Pret si plata

Pretul este [SUMA] [MONEDA], la care se adauga TVA daca este cazul. Plata se face in termen de [NUMAR] zile de la [FACTURA/RECEPTIE].

### 4. Receptie

Beneficiarul verifica livrabilele in termen de [NUMAR] zile. Lipsa unei obiectii scrise in termen poate fi considerata acceptare, daca partile convin astfel.

### 5. Confidentialitate

Partile pastreaza confidentiale informatiile marcate sau rezonabil considerate confidentiale, pe durata contractului si [PERIOADA] dupa incetare.

### 6. Proprietate intelectuala

Drepturile asupra livrabilelor se transfera conform [CONDITII], dupa plata integrala, cu exceptia instrumentelor, sabloanelor si cunostintelor preexistente ale prestatorului.

### 7. Incetare

Contractul poate inceta prin acord, la termen sau prin notificare cu [NUMAR] zile inainte.

Semnaturi:

Prestator: ____________________

Beneficiar: ____________________

## Checklist

- [ ] Serviciile sunt descrise concret.
- [ ] Exista livrabile si criterii de receptie.
- [ ] Plata si TVA sunt clarificate.
- [ ] Drepturile de proprietate intelectuala sunt explicite.
- [ ] Exista clauza de confidentialitate, daca este necesar.

""",
    "notificare-intarziere-plata" => """# Notificare intarziere plata

Catre: [DEBITOR]

Subscrisa/Subsemnatul [CREDITOR], va notific faptul ca suma de [SUMA] [MONEDA], aferenta facturii/contractului [REFERINTA], este scadenta din data de [DATA SCADENTA] si nu a fost achitata pana la data prezentei.

Va solicitam achitarea sumei pana la data de [DATA LIMITA], in contul [IBAN].

In lipsa platii, ne rezervam dreptul de a folosi caile legale disponibile.

Data: [DATA]

Semnatura: ____________________

""",
    "oferta-comerciala" => """# Oferta comerciala

Catre: [CLIENT]

Emitent: [FURNIZOR/PRESTATOR]

Data: [DATA]

## Obiectul ofertei

Va propunem furnizarea urmatoarelor produse/servicii: [DESCRIERE].

## Pret

| Produs/Serviciu | Cantitate | Pret unitar | Total |
| --- | --- | --- | --- |
| [ITEM] | [CANTITATE] | [PRET] | [TOTAL] |

Valabilitatea ofertei: [NUMAR] zile.

Conditii de plata: [CONDITII].

Termen de livrare/prestare: [TERMEN].

Semnatura/Stampila, daca este cazul: ____________________

""",
    "proces-verbal-predare-documente" => """# Proces-verbal predare documente

Incheiat astazi, [DATA], intre [PREDATOR] si [PRIMITOR].

## Documente predate

| Nr. | Document | Original/Copie | Observatii |
| --- | --- | --- | --- |
| 1 | [DOCUMENT] | [ORIGINAL/COPIE] | [OBSERVATII] |

Primitorul confirma primirea documentelor mentionate.

Predator: ____________________

Primitor: ____________________

""",
    "proces-verbal-receptie-servicii" => """# Proces-verbal de receptie servicii

Incheiat astazi, [DATA], intre [PRESTATOR] si [BENEFICIAR], in baza contractului nr. [NUMAR] din [DATA].

## Servicii receptionate

| Serviciu/Livrabil | Status | Observatii |
| --- | --- | --- |
| [LIVRABIL] | [ACCEPTAT/RESPINS] | [OBSERVATII] |

Beneficiarul confirma receptia serviciilor mentionate mai sus, cu urmatoarele observatii: [OBSERVATII].

Prestator: ____________________

Beneficiar: ____________________

""",
    "somatie-plata-amiabila" => """# Somatie de plata amiabila

Catre: [DEBITOR]

Subscrisa/Subsemnatul [CREDITOR], cu sediul/domiciliul in [ADRESA], va solicitam plata sumei de [SUMA] [MONEDA], reprezentand [DESCRIERE CREANTA], conform [CONTRACT/FACTURA/ALT DOCUMENT].

Termen de plata: [DATA].

Modalitate plata: [IBAN/ALT MOD].

In cazul neplatii, putem transmite cauza catre recuperare amiabila, mediere, avocat sau instanta competenta, dupa caz.

Data: [DATA]

Semnatura: ____________________

## Checklist

- [ ] Creanta este certa si documentata.
- [ ] Exista factura/contract/dovada.
- [ ] Termenul este rezonabil.

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
doc = genereaza_document("acord-confidentialitate-nda-simplu", Dict(
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