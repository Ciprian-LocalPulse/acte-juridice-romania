"""
    Administrativ

Modul pentru categoria: administrativ
Contine 11 template-uri de documente juridice romanesti.
"""
module Administrativ

export lista_documente, obtine_template, genereaza_document

"""Dictionar cu toate template-urile din aceasta categorie."""
const TEMPLATES = Dict{String, String}(
    "cerere-audienta" => """# Cerere audienta

Catre: [DENUMIRE INSTITUTIE]

Subsemnatul/Subsemnata [NUME], domiciliat(a) in [ADRESA], e-mail [EMAIL], telefon [TELEFON], solicit acordarea unei audiente privind:

[DESCRIERE PROBLEMA]

Preferinta interval: [ZI/ORA], daca este posibil.

Data: [DATA]

Semnatura: ____________________

""",
    "cerere-certificat-fiscal" => """# Cerere eliberare certificat fiscal

Catre: [INSTITUTIE/ORGAN FISCAL]

Subsemnatul/Subsemnata [NUME] / Societatea [DENUMIRE], CNP/CUI [CNP/CUI], cu domiciliul/sediul in [ADRESA], solicit eliberarea certificatului fiscal necesar pentru [SCOP].

Solicit eliberarea documentului in format [FIZIC/ELECTRONIC].

Anexez:

- [DOCUMENT 1]
- [DOCUMENT 2]

Data: [DATA]

Semnatura: ____________________

## Atentie

Verifica daca institutia are formular propriu sau depunere online.

""",
    "cerere-esalonare-plata" => """# Cerere esalonare plata

Catre: [CREDITOR/INSTITUTIE]

Subsemnatul/Subsemnata [NUME] / Societatea [DENUMIRE], CNP/CUI [CNP/CUI], solicit esalonarea platii sumei de [SUMA] [MONEDA], reprezentand [TIP DATORIE].

Propun urmatorul grafic de plata:

| Rata | Data plata | Suma |
| --- | --- | --- |
| 1 | [DATA] | [SUMA] |

Motivul solicitarii: [MOTIV].

Data: [DATA]

Semnatura: ____________________

""",
    "cerere-generica-anaf" => """# Cerere generica ANAF

## Atentie

Pentru multe situatii ANAF exista formulare standard sau depunere prin SPV. Verifica formularul oficial inainte sa folosesti aceasta cerere.

Catre: [UNITATE ANAF]

Subsemnatul/Subsemnata [NUME] / Societatea [DENUMIRE], CNP/CUI [CNP/CUI], cu domiciliul/sediul in [ADRESA], reprezentat(a) de [REPREZENTANT], solicit:

[DESCRIERE SOLICITARE]

Anexez:

- [DOCUMENT 1]
- [DOCUMENT 2]

Va rog sa imi comunicati raspunsul la [ADRESA/EMAIL/SPV], in conditiile legii.

Data: [DATA]

Semnatura: ____________________

""",
    "cerere-informatii-publice-legea-544" => """# Cerere informatii publice - Legea 544/2001

Catre: [DENUMIRE INSTITUTIE]

Subsemnatul/Subsemnata [NUME], cu domiciliul in [ADRESA], e-mail [EMAIL], solicit comunicarea urmatoarelor informatii de interes public:

[LISTA INFORMATII SOLICITATE]

Solicit transmiterea raspunsului in format [ELECTRONIC/FIZIC], la [EMAIL/ADRESA].

Data: [DATA]

Semnatura: ____________________

## Checklist

- [ ] Solicitarea priveste informatii de interes public.
- [ ] Cererea este trimisa catre institutia competenta.
- [ ] Pastrezi dovada trimiterii.

""",
    "cerere-onrc-informatii" => """# Cerere informatii ONRC

Catre: Oficiul National al Registrului Comertului / Oficiul Registrului Comertului de pe langa Tribunalul [JUDET]

Subsemnatul/Subsemnata [NUME] / Societatea [DENUMIRE], CNP/CUI [CNP/CUI], solicit informatii / certificat constatator / copie document privind [DENUMIRE FIRMA], CUI [CUI], numar de ordine in registrul comertului [NR].

Scopul solicitarii: [SCOP].

Data: [DATA]

Semnatura: ____________________

## Atentie

Verifica serviciile disponibile online si taxele aplicabile pe site-ul ONRC.

""",
    "cerere-radiere-date" => """# Cerere radiere sau stergere date

Catre: [INSTITUTIE/OPERATOR]

Subsemnatul/Subsemnata [NUME], CNP [CNP], solicit radierea / stergerea urmatoarelor date: [DATE], prelucrate in legatura cu [SCOP].

Motivul solicitarii: [MOTIV].

Solicit confirmarea solutionarii cererii la [EMAIL/ADRESA].

Data: [DATA]

Semnatura: ____________________

## Checklist

- [ ] Identifici clar datele vizate.
- [ ] Atasezi dovada identitatii doar daca este necesar.
- [ ] Nu trimiti mai multe date decat trebuie.

""",
    "cerere-schimbare-date" => """# Cerere modificare date personale sau societate

Catre: [INSTITUTIE]

Subsemnatul/Subsemnata [NUME] / Societatea [DENUMIRE], CNP/CUI [CNP/CUI], solicit actualizarea urmatoarelor date:

- date vechi: [DATE VECHI]
- date noi: [DATE NOI]

Motivul modificarii: [MOTIV].

Anexez documentele justificative:

- [DOCUMENT]

Data: [DATA]

Semnatura: ____________________

""",
    "contestatie-amenda" => """# Contestatie amenda - model orientativ

## Atentie

Contestarea proceselor-verbale de contraventie are termene si reguli procedurale. Verifica termenul aplicabil si instanta competenta.

Catre: [INSTANTA/INSTITUTIE COMPETENTA]

Subsemnatul/Subsemnata [NUME], CNP [CNP], domiciliat(a) in [ADRESA], formulez contestatie impotriva procesului-verbal seria [SERIE] nr. [NUMAR], intocmit la data de [DATA] de [ORGAN CONSTATATOR].

Solicit anularea / modificarea procesului-verbal pentru urmatoarele motive:

[MOTIVE]

Anexez:

- copie proces-verbal;
- dovezi;
- copie act identitate;
- alte documente.

Data: [DATA]

Semnatura: ____________________

""",
    "petitie-institutie-publica" => """# Petitie catre institutie publica

Catre: [DENUMIRE INSTITUTIE]

Subsemnatul/Subsemnata [NUME], domiciliat(a) in [ADRESA], e-mail [EMAIL], telefon [TELEFON], formulez prezenta petitie privind:

[DESCRIERE PROBLEMA]

Solicit:

[SOLICITARE CLARA]

Anexez urmatoarele documente:

- [DOCUMENT]

Va rog sa imi comunicati raspunsul la adresa [ADRESA/EMAIL].

Data: [DATA]

Semnatura: ____________________

""",
    "reclamatie-administrativa-legea-544" => """# Reclamatie administrativa - Legea 544/2001

Catre: [CONDUCATORUL INSTITUTIEI]

Subsemnatul/Subsemnata [NUME], am solicitat prin cererea nr. [NUMAR] din [DATA] urmatoarele informatii de interes public: [DESCRIERE].

Pana la data prezentei, raspunsul primit este [INCOMPLET/REFUZ/NU A FOST COMUNICAT].

Solicit reanalizarea cererii si comunicarea informatiilor solicitate, in conditiile legii.

Data: [DATA]

Semnatura: ____________________

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
doc = genereaza_document("cerere-audienta", Dict(
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