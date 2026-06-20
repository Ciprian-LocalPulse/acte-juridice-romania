"""
    Consumatori

Modul pentru categoria: consumatori
Contine 6 template-uri de documente juridice romanesti.
"""
module Consumatori

export lista_documente, obtine_template, genereaza_document

"""Dictionar cu toate template-urile din aceasta categorie."""
const TEMPLATES = Dict{String, String}(
    "cerere-anulare-comanda-online" => """# Cerere anulare comanda online

Catre: [MAGAZIN ONLINE]

Subsemnatul/Subsemnata [NUME], solicit anularea comenzii nr. [NUMAR], plasata la data de [DATA], pentru urmatoarele produse/servicii:

- [PRODUS/SERVICIU]

Daca plata a fost efectuata, solicit rambursarea sumei de [SUMA] [MONEDA] prin [MOD RAMBURSARE].

Data: [DATA]

Semnatura: ____________________

""",
    "cerere-garantie-produs" => """# Cerere garantie produs

Catre: [VANZATOR/SERVICE]

Subsemnatul/Subsemnata [NUME], solicit solutionarea in garantie pentru produsul [PRODUS], seria [SERIE], achizitionat la data de [DATA], conform facturii/bonului nr. [NUMAR].

Defect reclamat:

[DESCRIERE DEFECT]

Solicit repararea, inlocuirea sau alta solutie legala aplicabila.

Anexez:

- dovada achizitiei;
- certificat garantie;
- fotografii/video, daca exista.

Data: [DATA]

Semnatura: ____________________

""",
    "cerere-retur-produs" => """# Cerere retur produs

Catre: [MAGAZIN/OPERATOR ECONOMIC]

Subsemnatul/Subsemnata [NUME], am achizitionat produsul [PRODUS], comanda/factura nr. [NUMAR], la data de [DATA].

Solicit returul produsului si rambursarea sumei de [SUMA] [MONEDA], prin [MOD RAMBURSARE].

Motivul returului, daca este necesar: [MOTIV].

Anexez dovada achizitiei si fotografii, daca este cazul.

Data: [DATA]

Semnatura: ____________________

""",
    "notificare-neexecutare-serviciu" => """# Notificare neexecutare serviciu

Catre: [PRESTATOR]

Subsemnatul/Subsemnata [NUME], am contractat serviciul [SERVICIU], conform contractului/comenzii nr. [NUMAR] din [DATA].

Pana la data prezentei, serviciul nu a fost executat / a fost executat necorespunzator, astfel:

[DESCRIERE]

Solicit remedierea situatiei pana la data de [DATA] sau restituirea sumei achitate, dupa caz.

Data: [DATA]

Semnatura: ____________________

""",
    "proces-verbal-predare-produs-service" => """# Proces-verbal predare produs in service

Incheiat astazi, [DATA], intre [CLIENT] si [SERVICE/VANZATOR].

Produs predat: [PRODUS]

Serie/IMEI: [SERIE]

Stare la predare: [DESCRIERE]

Accesorii predate: [ACCESORII]

Defect reclamat: [DESCRIERE]

Client: ____________________

Reprezentant service: ____________________

""",
    "reclamatie-anpc" => """# Reclamatie ANPC - model orientativ

## Atentie

Verifica platforma oficiala ANPC si incearca, de regula, solutionarea directa cu operatorul economic inainte de reclamatie.

Catre: Autoritatea Nationala pentru Protectia Consumatorilor

Subsemnatul/Subsemnata [NUME], domiciliat(a) in [ADRESA], e-mail [EMAIL], telefon [TELEFON], formulez reclamatie impotriva operatorului economic [DENUMIRE], CUI [CUI], cu sediul/punctul de lucru in [ADRESA].

Descrierea situatiei:

[DESCRIERE]

Solicit:

[SOLICITARE]

Anexez:

- dovada achizitiei;
- corespondenta cu operatorul;
- fotografii;
- alte documente.

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
doc = genereaza_document("cerere-anulare-comanda-online", Dict(
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