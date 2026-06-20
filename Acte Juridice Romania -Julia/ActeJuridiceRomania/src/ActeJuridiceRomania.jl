"""
    ActeJuridiceRomania

Biblioteca gratuita de modele pentru documente juridice si acte uzuale din Romania.
Contine 89 de template-uri organizate in 14 categorii.

# Utilizare rapida

```julia
using ActeJuridiceRomania

# Listeaza toate categoriile disponibile
categorii = lista_categorii()

# Listeaza documentele dintr-o categorie
docs = lista_documente("locuinta")

# Obtine un template brut
template = obtine_template("locuinta", "contract-inchiriere-locuinta")

# Genereaza un document completat
doc = genereaza_document("locuinta", "contract-inchiriere-locuinta", Dict(
    "DATA"            => "20.06.2026",
    "LOCALITATE"      => "Piatra Neamt",
    "NUME PROPRIETAR" => "Popescu Ion",
    "CNP"             => "1234567890123",
    "ADRESA"          => "Str. Libertatii nr. 1",
    "CI/PASAPORT"     => "CI seria NT 123456",
    "NUME CHIRIAS"    => "Ionescu Maria",
    "ADRESA COMPLETA" => "Str. Independentei nr. 5, Piatra Neamt",
    "DESCRIERE"       => "2 camere, baie, bucatarie",
    "ANEXE/DEPENDINTE"=> "boxa la subsol",
    "DATA INCEPUT"    => "01.07.2026",
    "DATA SFARSIT"    => "30.06.2027",
    "SUMA"            => "400",
    "MONEDA"          => "EUR",
    "ZI"              => "5",
    "TRANSFER/CASH"   => "transfer bancar",
    "NUMAR"           => "30"
))

# Salveaza documentul generat intr-un fisier
salveaza_document("locuinta", "contract-inchiriere-locuinta", Dict(...), "output.md")
```

# Categorii disponibile

- `administrativ`          — 11 documente (ANAF, petitii, Legea 544, ONRC, certificate, contestatii)
- `afaceri`                — 12 documente (servicii, NDA, colaborare, mentenanta, cesiune, oferte)
- `asociatie_proprietari`  —  2 documente (cereri si contestatii cheltuieli comune)
- `auto`                   —  4 documente (vanzare, comodat, imputernicire, predare-primire)
- `consumatori`            —  6 documente (reclamatii, retur, garantie, comanda online)
- `familie`                —  7 documente (procuri, declaratii, gazduire, acord parental)
- `firme_pfa`              —  4 documente (decizie asociat, hotarare AGA, comodat sediu, PFA)
- `gdpr_protectia_datelor` —  3 documente (acces, stergere, opozitie prelucrare date)
- `imobiliare`             —  4 documente (antecontract, promisiune, arvuna, notificare)
- `imprumuturi_si_garantii`—  3 documente (imprumut, recunoastere datorie, fidejusiune)
- `locuinta`               — 10 documente (inchiriere, comodat, notificari, garantie, inventar)
- `munca`                  — 11 documente (concedii, demisie, telemunca, adeverinte, sesizari)
- `succesiuni`             —  5 documente (testament, acceptare/renuntare, partaj, notar)
- `vanzare_cumparare`      —  7 documente (bun mobil, predare, chitanta, avans, rezolutiune)

# Avertisment juridic

Documentele din aceasta biblioteca sunt modele educationale si puncte de pornire.
**Nu constituie consultanta juridica, fiscala sau notariala** si nu inlocuiesc
verificarea cu un avocat, notar, consultant fiscal sau institutie competenta.
Legislatia se poate schimba; verifica mereu sursele oficiale inainte de folosire.
"""
module ActeJuridiceRomania

using Dates

# Include toate modulele de categorii
include("templates/administrativ.jl")
include("templates/afaceri.jl")
include("templates/asociatie_proprietari.jl")
include("templates/auto.jl")
include("templates/consumatori.jl")
include("templates/familie.jl")
include("templates/firme_pfa.jl")
include("templates/gdpr_protectia_datelor.jl")
include("templates/imobiliare.jl")
include("templates/imprumuturi_si_garantii.jl")
include("templates/locuinta.jl")
include("templates/munca.jl")
include("templates/succesiuni.jl")
include("templates/vanzare_cumparare.jl")

export lista_categorii, lista_documente, obtine_template, genereaza_document,
       salveaza_document, cauta_documente, campuri_necesare

"""Dictionar intern care mapeaza categorii la modulele lor."""
const _CATEGORII = Dict{String, Module}(
    "administrativ"           => Administrativ,
    "afaceri"                 => Afaceri,
    "asociatie_proprietari"   => AsociatieProprietari,
    "auto"                    => Auto,
    "consumatori"             => Consumatori,
    "familie"                 => Familie,
    "firme_pfa"               => FirmePfa,
    "gdpr_protectia_datelor"  => GdprProtectiaDatelor,
    "imobiliare"              => Imobiliare,
    "imprumuturi_si_garantii" => ImprumuturiSiGarantii,
    "locuinta"                => Locuinta,
    "munca"                   => Munca,
    "succesiuni"              => Succesiuni,
    "vanzare_cumparare"       => VanzareCumparare,
)

"""
    lista_categorii() -> Vector{String}

Returneaza lista tuturor categoriilor de documente disponibile.

# Exemplu
```julia
julia> lista_categorii()
14-element Vector{String}: ["administrativ", "afaceri", ...]
```
"""
function lista_categorii()
    return sort(collect(keys(_CATEGORII)))
end

"""
    lista_documente(categorie::String) -> Vector{String}

Returneaza lista documentelor disponibile in categoria specificata.

# Exemplu
```julia
julia> lista_documente("locuinta")
10-element Vector{String}: ["contract-inchiriere-locuinta", ...]
```
"""
function lista_documente(categorie::String)
    _verifica_categorie(categorie)
    return sort(_CATEGORII[categorie].lista_documente())
end

"""
    obtine_template(categorie::String, document::String) -> String

Returneaza continutul brut (Markdown) al unui template de document.
Campurile editabile sunt marcate cu `[CAMP]`.

# Exemplu
```julia
julia> t = obtine_template("munca", "demisie-cu-preaviz")
julia> println(t)
```
"""
function obtine_template(categorie::String, document::String)
    _verifica_categorie(categorie)
    return _CATEGORII[categorie].obtine_template(document)
end

"""
    genereaza_document(categorie::String, document::String, campuri::Dict{String,String}) -> String

Genereaza un document completat prin inlocuirea campurilor `[CAMP]` cu valorile furnizate.
Campurile nelegate raman ca `[CAMP]` in documentul final.

# Argumente
- `categorie`: numele categoriei (ex: `"locuinta"`, `"munca"`)
- `document`: numele documentului (ex: `"contract-inchiriere-locuinta"`)
- `campuri`: dictionar `camp => valoare` pentru substituire

# Exemplu
```julia
doc = genereaza_document("munca", "demisie-cu-preaviz", Dict(
    "DATA"          => "20.06.2026",
    "NUME ANGAJAT"  => "Popescu Ion",
    "FUNCTIA"       => "Programator",
    "ANGAJATOR"     => "SC Exemplu SRL",
    "DATA DEMISIE"  => "20.07.2026"
))
println(doc)
```
"""
function genereaza_document(categorie::String, document::String, campuri::Dict{String,String})
    _verifica_categorie(categorie)
    return _CATEGORII[categorie].genereaza_document(document, campuri)
end

"""
    salveaza_document(categorie, document, campuri, cale_fisier; format=:md)

Genereaza si salveaza un document intr-un fisier.

# Argumente
- `format`: `:md` (Markdown, implicit) sau `:txt` (text simplu)

# Exemplu
```julia
salveaza_document("familie", "procura-simpla",
    Dict("DATA" => "20.06.2026", "LOCALITATE" => "Piatra Neamt"),
    "procura_mea.md"
)
```
"""
function salveaza_document(categorie::String, document::String,
                            campuri::Dict{String,String}, cale_fisier::String;
                            format::Symbol=:md)
    continut = genereaza_document(categorie, document, campuri)
    if format == :txt
        # Elimina marcajele Markdown simple
        continut = replace(continut, r"^#{1,6} " => "")
        continut = replace(continut, r"\*\*(.*?)\*\*" => s"\1")
        continut = replace(continut, r"\*(.*?)\*" => s"\1")
    end
    open(cale_fisier, "w") do io
        write(io, continut)
    end
    println("Document salvat: $cale_fisier")
    return cale_fisier
end

"""
    cauta_documente(cuvant_cheie::String) -> Vector{Tuple{String,String}}

Cauta documente dupa cuvant cheie in toate categoriile.
Returneaza o lista de perechi `(categorie, document)`.

# Exemplu
```julia
julia> cauta_documente("demisie")
2-element Vector{...}: [("munca", "demisie-cu-preaviz"), ("munca", "demisie-fara-preaviz")]
```
"""
function cauta_documente(cuvant_cheie::String)
    rezultate = Tuple{String,String}[]
    kw = lowercase(cuvant_cheie)
    for cat in lista_categorii()
        for doc in lista_documente(cat)
            if occursin(kw, lowercase(doc)) || occursin(kw, lowercase(obtine_template(cat, doc)))
                push!(rezultate, (cat, doc))
            end
        end
    end
    return rezultate
end

"""
    campuri_necesare(categorie::String, document::String) -> Vector{String}

Extrage lista campurilor `[CAMP]` necesare dintr-un template.

# Exemplu
```julia
julia> campuri_necesare("locuinta", "contract-inchiriere-locuinta")
["DATA", "LOCALITATE", "NUME PROPRIETAR", ...]
```
"""
function campuri_necesare(categorie::String, document::String)
    template = obtine_template(categorie, document)
    matches = eachmatch(r"\[([A-ZĂÂÎȘȚ][A-ZĂÂÎȘȚ0-9 /-]*)\]", template)
    campuri = unique([m.captures[1] for m in matches])
    return sort(campuri)
end

# --- Functii interne ---

function _verifica_categorie(categorie::String)
    if !haskey(_CATEGORII, categorie)
        available = join(sort(collect(keys(_CATEGORII))), "\n  - ")
        error("Categoria \"$categorie\" nu exista.\nCategorii disponibile:\n  - $available")
    end
end

end # module ActeJuridiceRomania
