"""
    AsociatieProprietari

Modul pentru categoria: asociatie-proprietari
Contine 2 template-uri de documente juridice romanesti.
"""
module AsociatieProprietari

export lista_documente, obtine_template, genereaza_document

"""Dictionar cu toate template-urile din aceasta categorie."""
const TEMPLATES = Dict{String, String}(
    "cerere-catre-asociatia-de-proprietari" => """# Cerere catre asociatia de proprietari

## Cand se foloseste

Pentru a adresa o solicitare administratorului sau presedintelui asociatiei de proprietari (de exemplu cerere de informatii privind cheltuielile comune, solicitare de reparatie a unei parti comune, cerere de eliberare a unei adeverinte). Adapteaza obiectul cererii in functie de situatia concreta.

## Model

Catre: Asociatia de Proprietari [DENUMIRE/NUMAR ASOCIATIE], [ADRESA IMOBILULUI]

Subsemnatul/Subsemnata [NUME COMPLET], proprietar/chirias al apartamentului numarul [NUMAR APARTAMENT], situat in imobilul mentionat mai sus, identificat cu [CI/PASAPORT SERIE NUMAR],

solicit prin prezenta:

[DESCRIE SOLICITAREA - DE EXEMPLU: COMUNICAREA SITUATIEI DETALIATE A COTELOR DE INTRETINERE PENTRU LUNILE...; REMEDIEREA URMATOAREI PROBLEME LA PARTILE COMUNE...; ELIBERAREA UNEI ADEVERINTE PRIVIND PLATA COTELOR DE INTRETINERE].

[DACA ESTE CAZUL, ADAUGA DETALII SUPLIMENTARE - DESCRIEREA PROBLEMEI, PERIOADA VIZATA, DOCUMENTE ANEXATE].

Va rog sa imi comunicati raspunsul/solutia in termen de [NUMAR] zile, la adresa [ADRESA/EMAIL].

Data: [DATA]

Semnatura: ____________________

## Checklist

- [ ] Ai identificat corect asociatia de proprietari si numarul apartamentului/spatiului vizat.
- [ ] Solicitarea este descrisa clar si concret, cu detalii suficiente pentru a fi solutionata.
- [ ] Ai mentionat un termen rezonabil pentru raspuns.
- [ ] Pastrezi o copie a cererii si dovada depunerii (numar de inregistrare, email trimis).
""",
    "contestatie-cheltuieli-comune" => """# Contestatie privind cheltuielile comune (cota de intretinere)

## Cand se foloseste

Pentru a contesta, in scris, modul de calcul sau valoarea cotei de intretinere/cheltuielilor comune stabilite de asociatia de proprietari pentru apartamentul/spatiul detinut, atunci cand exista suspiciuni de eroare de calcul, facturare gresita sau aplicare incorecta a criteriilor de repartizare (suprafata, numar de persoane, cote indivize).

## Model

Catre: Asociatia de Proprietari [DENUMIRE/NUMAR ASOCIATIE], [ADRESA IMOBILULUI]

Subsemnatul/Subsemnada [NUME COMPLET], proprietar al apartamentului numarul [NUMAR APARTAMENT], situat in imobilul mentionat mai sus,

formulez prin prezenta o contestatie privind cota de intretinere/cheltuielile comune stabilite pentru luna/lunile [PERIOADA], in suma de [SUMA] [MONEDA], pentru urmatoarele motive:

[DESCRIE MOTIVELE - DE EXEMPLU: CRITERIUL DE REPARTIZARE NU CORESPUNDE NUMARULUI REAL DE PERSOANE/SUPRAFETEI; A FOST FACTURATA O CHELTUIALA CARE NU IMI ESTE APLICABILA; EXISTA O EROARE DE CALCUL CONSTATATA PRIN COMPARATIE CU LISTELE ANTERIOARE].

Solicit:

- Reverificarea calculului cotei de intretinere pentru perioada mentionata;
- Comunicarea modului de calcul si a documentelor justificative (facturi, citiri contoare, liste de plata);
- Corectarea sumei, daca se confirma eroarea semnalata.

Anexez prezentei: [LISTA DOCUMENTE - COPII LISTE DE PLATA, FACTURI, ALTE DOVEZI].

Va rog sa imi comunicati raspunsul in termen de [NUMAR] zile, la adresa [ADRESA/EMAIL].

Data: [DATA]

Semnatura: ____________________

## Checklist

- [ ] Sunt mentionate perioada si suma exacta contestata.
- [ ] Motivele contestatiei sunt descrise concret, cu referire la criteriile de repartizare aplicabile.
- [ ] Ai anexat dovezi relevante (liste de plata anterioare, facturi, citiri de contoare).
- [ ] Ai cerut explicit documentele justificative pentru calculul cotei.
- [ ] Daca raspunsul asociatiei nu este satisfacator, retine ca poti continua demersul la institutiile/instantele competente, conform legislatiei privind asociatiile de proprietari.
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
doc = genereaza_document("cerere-catre-asociatia-de-proprietari", Dict(
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