"""
    VanzareCumparare

Modul pentru categoria: vanzare-cumparare
Contine 7 template-uri de documente juridice romanesti.
"""
module VanzareCumparare

export lista_documente, obtine_template, genereaza_document

"""Dictionar cu toate template-urile din aceasta categorie."""
const TEMPLATES = Dict{String, String}(
    "acord-restituire-avans" => """# Acord restituire avans

Incheiat astazi, [DATA], intre [PRIMITOR AVANS] si [PLATITOR AVANS].

Partile confirma ca la data de [DATA PLATA] a fost achitat avansul in suma de [SUMA] [MONEDA], pentru [SCOP].

Partile convin restituirea avansului pana la data de [DATA], prin [MOD PLATA].

Dupa restituire, partile declara ca nu mai au pretentii reciproce legate de acest avans, cu exceptia: [EXCEPTII].

Semnaturi:

Primitor avans: ____________________

Platitor avans: ____________________

""",
    "chitanta-simpla" => """# Chitanta simpla

Subsemnatul/Subsemnata [NUME PRIMITOR], CNP [CNP], declar ca am primit de la [NUME PLATITOR], CNP [CNP], suma de [SUMA] [MONEDA], reprezentand [SCOP PLATA].

Plata a fost efectuata la data de [DATA], prin [CASH/TRANSFER/ALT MOD].

Data: [DATA]

Semnatura primitor: ____________________

## Atentie

Pentru plati intre profesionisti, plati mari sau situatii fiscale, verifica regulile aplicabile privind plafoanele, factura, chitanta fiscala si documentele contabile.

""",
    "contract-vanzare-cumparare-bun-mobil" => """# Contract de vanzare-cumparare bun mobil

## Cand se foloseste

Pentru bunuri mobile simple. Pentru autoturisme, imobile, bunuri in leasing, bunuri cu regim special sau sume importante, verifica formularul si procedura aplicabile.

## Model

Incheiat astazi, [DATA], intre:

Vanzator: [NUME], CNP/CUI [CNP/CUI], domiciliu/sediu [ADRESA].

Cumparator: [NUME], CNP/CUI [CNP/CUI], domiciliu/sediu [ADRESA].

Vanzatorul vinde, iar cumparatorul cumpara urmatorul bun: [DESCRIERE BUN], serie/numar identificare [SERIE], stare [STARE].

Pretul este [SUMA] [MONEDA] si se plateste prin [MOD PLATA] la data de [DATA].

Bunul se preda la data de [DATA], impreuna cu urmatoarele accesorii/documente: [LISTA].

Vanzatorul declara ca bunul ii apartine si ca, dupa cunostinta sa, nu este grevat de sarcini, litigii sau drepturi ale tertilor, cu exceptia celor mentionate aici: [EXCEPTII].

Semnaturi:

Vanzator: ____________________

Cumparator: ____________________

## Checklist

- [ ] Bunul este identificat clar.
- [ ] Pretul si plata sunt dovedibile.
- [ ] Exista proces-verbal de predare, daca este util.
- [ ] Sunt verificate eventuale restrictii speciale pentru bun.

""",
    "declaratie-predare-suma" => """# Declaratie predare suma de bani

Subsemnatul/Subsemnata [NUME PREDATOR], CNP [CNP], declar ca am predat catre [NUME PRIMITOR], CNP [CNP], suma de [SUMA] [MONEDA], reprezentand [SCOP].

Predarea sumei a avut loc la data de [DATA], prin [CASH/TRANSFER/ALT MOD].

Prezenta declaratie este semnata in doua exemplare.

Predator: ____________________

Primitor: ____________________

## Atentie

Pentru sume mari sau tranzactii comerciale, verifica plafoanele, obligatiile fiscale si documentele contabile necesare.

""",
    "notificare-rezolutiune-contract" => """# Notificare rezolutiune contract

## Atentie

Rezolutiunea poate avea consecinte juridice importante. Verifica contractul si cere ajutor juridic daca exista conflict.

Catre: [PARTEA NOTIFICATA]

Subsemnatul/Subsemnata [NUME], in calitate de [CALITATE], va notific rezolutiunea contractului nr. [NUMAR] din [DATA], avand ca obiect [OBIECT], pentru urmatorul motiv:

[MOTIV]

Solicit restituirea prestatiilor / predarea bunului / plata sumelor datorate pana la data de [DATA], conform contractului si legii aplicabile.

Data: [DATA]

Semnatura: ____________________

""",
    "proces-verbal-predare-bun-mobil" => """# Proces-verbal predare-primire bun mobil

Incheiat astazi, [DATA], intre [VANZATOR/PREDATOR] si [CUMPARATOR/PRIMITOR].

Bun predat: [DESCRIERE BUN]

Serie/identificator: [SERIE]

Stare la predare: [STARE]

Accesorii/documente predate:

- [ACCESORIU/DOCUMENT]

Predator: ____________________

Primitor: ____________________

""",
    "promisiune-vanzare-cumparare-bun-mobil" => """# Promisiune vanzare-cumparare bun mobil

Promitent vanzator: [NUME], CNP/CUI [CNP/CUI].

Promitent cumparator: [NUME], CNP/CUI [CNP/CUI].

Partile convin ca pana la data de [DATA] vor incheia contractul de vanzare-cumparare pentru bunul [DESCRIERE], la pretul de [SUMA] [MONEDA].

Avansul achitat este [SUMA] [MONEDA], prin [MOD PLATA].

Daca vanzarea nu se incheie din culpa [PARTII], partile convin: [CONSECINTE].

Data: [DATA]

Vanzator: ____________________

Cumparator: ____________________

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
doc = genereaza_document("acord-restituire-avans", Dict(
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