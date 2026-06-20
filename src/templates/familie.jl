"""
    Familie

Modul pentru categoria: familie
Contine 7 template-uri de documente juridice romanesti.
"""
module Familie

export lista_documente, obtine_template, genereaza_document

"""Dictionar cu toate template-urile din aceasta categorie."""
const TEMPLATES = Dict{String, String}(
    "acord-folosire-adresa-corespondenta" => """# Acord folosire adresa de corespondenta

Subsemnatul/Subsemnata [NUME TITULAR], CNP [CNP], titular al folosintei asupra adresei [ADRESA], imi exprim acordul ca [NUME BENEFICIAR], CNP/CUI [CNP/CUI], sa foloseasca aceasta adresa ca adresa de corespondenta pentru [SCOP], in perioada [PERIOADA].

Acest acord nu transfera drept de proprietate, inchiriere sau folosinta exclusiva.

Data: [DATA]

Semnatura titular: ____________________

Semnatura beneficiar: ____________________

""",
    "acord-parental-calatorie" => """# Acord parental pentru calatorie minor

## Atentie

Pentru iesirea minorului din tara pot fi necesare conditii speciale si forma autentica notariala. Verifica cerintele autoritatilor inainte de folosire.

Subsemnatul/Subsemnata [NUME PARINTE], CNP [CNP], parinte al minorului [NUME MINOR], CNP [CNP], imi exprim acordul ca minorul sa calatoreasca in [DESTINATIE], in perioada [PERIOADA], insotit de [INSOTITOR].

Scopul calatoriei: [SCOP].

Data: [DATA]

Semnatura: ____________________

""",
    "declaratie-gazduire" => """# Declaratie de gazduire

Subsemnatul/Subsemnata [NUME GAZDUITOR], CNP [CNP], domiciliat(a) in [ADRESA], declar ca il/o gazduiesc pe [NUME PERSOANA GAZDUITA], CNP [CNP], la adresa [ADRESA], in perioada [PERIOADA].

Declaratia este data pentru [SCOP].

Data: [DATA]

Semnatura: ____________________

## Checklist

- [ ] Adresa este completa.
- [ ] Perioada este mentionata.
- [ ] Este verificata forma ceruta de institutia solicitanta.

""",
    "declaratie-proprie-raspundere" => """# Declaratie pe proprie raspundere

Subsemnatul/Subsemnata [NUME], CNP [CNP], domiciliat(a) in [ADRESA], identificat(a) cu [ACT IDENTITATE], declar pe propria raspundere, cunoscand consecintele legale ale declaratiilor neadevarate, ca:

[TEXTUL DECLARATIEI]

Prezenta declaratie este data pentru a servi la [SCOP].

Data: [DATA]

Semnatura: ____________________

## Checklist

- [ ] Declaratia este adevarata si verificabila.
- [ ] Scopul este mentionat clar.
- [ ] Nu sunt incluse date inutile.
- [ ] Este verificata forma ceruta de institutia care o solicita.

""",
    "declaratie-venituri" => """# Declaratie venituri

Subsemnatul/Subsemnata [NUME], CNP [CNP], domiciliat(a) in [ADRESA], declar pe propria raspundere ca in perioada [PERIOADA] am realizat urmatoarele venituri:

| Sursa venit | Suma | Perioada | Observatii |
| --- | --- | --- | --- |
| [SURSA] | [SUMA] | [PERIOADA] | [OBSERVATII] |

Prezenta declaratie este necesara pentru [SCOP].

Data: [DATA]

Semnatura: ____________________

""",
    "imputernicire-ridicare-documente" => """# Imputernicire ridicare documente

Subsemnatul/Subsemnata [NUME], CNP [CNP], domiciliat(a) in [ADRESA], imputernicesc pe [NUME IMPUTERNICIT], CNP [CNP], sa ridice in numele meu urmatoarele documente:

- [DOCUMENT 1]
- [DOCUMENT 2]

Documentele vor fi ridicate de la [INSTITUTIE/ENTITATE].

Prezenta imputernicire este valabila pana la data de [DATA].

Data: [DATA]

Semnatura: ____________________

## Atentie

Unele institutii pot solicita procura notariala sau formular propriu.

""",
    "procura-simpla" => """# Procura simpla

## Atentie

Multe procuri necesita forma autentica notariala, mai ales pentru vanzari, reprezentare in fata unor institutii, operatiuni bancare sau acte importante. Acest model este doar un punct de pornire pentru situatii simple si trebuie verificat.

## Model

Subsemnatul/Subsemnata [NUME MANDANT], CNP [CNP], domiciliat(a) in [ADRESA], identificat(a) cu [ACT IDENTITATE], imputernicesc pe [NUME MANDATAR], CNP [CNP], domiciliat(a) in [ADRESA], identificat(a) cu [ACT IDENTITATE], sa ma reprezinte pentru urmatoarea operatiune:

[DESCRIERE CLARA A IMPUTERNICIRII]

Mandatarul poate semna documentele necesare exclusiv pentru scopul mentionat mai sus.

Prezenta procura este valabila pana la data de [DATA] si poate fi revocata in scris.

Data: [DATA]

Semnatura mandant: ____________________

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
doc = genereaza_document("acord-folosire-adresa-corespondenta", Dict(
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