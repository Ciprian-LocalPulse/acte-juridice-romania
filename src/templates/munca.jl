"""
    Munca

Modul pentru categoria: munca
Contine 11 template-uri de documente juridice romanesti.
"""
module Munca

export lista_documente, obtine_template, genereaza_document

"""Dictionar cu toate template-urile din aceasta categorie."""
const TEMPLATES = Dict{String, String}(
    "cerere-adeverinta-salariat" => """# Cerere adeverinta salariat

Catre: [DENUMIRE ANGAJATOR]

Subsemnatul/Subsemnata [NUME], CNP [CNP], angajat(a) in functia de [FUNCTIE], va rog sa imi eliberati o adeverinta care sa ateste calitatea de salariat si, dupa caz, veniturile realizate, necesara pentru [SCOP].

Solicit ca adeverinta sa fie eliberata pana la data de [DATA], in format [FIZIC/ELECTRONIC].

Data: [DATA]

Semnatura: ____________________

""",
    "cerere-concediu-fara-plata" => """# Cerere concediu fara plata

Catre: [DENUMIRE ANGAJATOR]

Subsemnatul/Subsemnata [NUME], angajat(a) in functia de [FUNCTIE], solicit acordarea concediului fara plata in perioada [DATA INCEPUT] - [DATA SFARSIT], pentru [MOTIV].

Inteleg ca aprobarea se face conform legii, contractului si regulilor interne aplicabile.

Data: [DATA]

Semnatura: ____________________

""",
    "cerere-concediu-odihna" => """# Cerere concediu de odihna

Catre: [DENUMIRE ANGAJATOR]

Subsemnatul/Subsemnata [NUME], angajat(a) in functia de [FUNCTIE], in cadrul [DEPARTAMENT], va rog sa aprobati efectuarea concediului de odihna in perioada [DATA INCEPUT] - [DATA SFARSIT], reprezentand [NUMAR] zile lucratoare.

Date de contact pe perioada concediului, daca este necesar: [TELEFON/EMAIL].

Data: [DATA]

Semnatura salariat: ____________________

Aprobat,

Reprezentant angajator: ____________________

## Checklist

- [ ] Perioada corespunde planificarii interne.
- [ ] Numarul de zile este corect.
- [ ] Cererea este depusa prin canalul intern agreat.

""",
    "cerere-eliberare-copie-contract-munca" => """# Cerere eliberare copie contract individual de munca

Catre: [DENUMIRE ANGAJATOR]

Subsemnatul/Subsemnata [NUME], CNP [CNP], angajat(a) / fost(a) angajat(a) in functia de [FUNCTIE], solicit eliberarea unei copii a contractului individual de munca si a actelor aditionale aferente.

Solicit transmiterea documentelor prin [EMAIL/RIDICARE PERSONALA], pana la data de [DATA].

Data: [DATA]

Semnatura: ____________________

""",
    "cerere-incetare-contract-munca-acord" => """# Cerere incetare contract individual de munca prin acord

Catre: [DENUMIRE ANGAJATOR]

Subsemnatul/Subsemnata [NUME], angajat(a) in functia de [FUNCTIE], solicit incetarea contractului individual de munca nr. [NUMAR] din [DATA], prin acordul partilor, incepand cu data de [DATA INCETARE].

Va rog sa imi comunicati raspunsul in scris.

Data: [DATA]

Semnatura salariat: ____________________

## Atentie

Incetarea prin acord necesita acordul ambelor parti. Daca angajatorul nu accepta, verifica procedura aplicabila pentru demisie sau alte forme de incetare.

""",
    "cerere-program-flexibil" => """# Cerere program flexibil

Catre: [DENUMIRE ANGAJATOR]

Subsemnatul/Subsemnata [NUME], angajat(a) in functia de [FUNCTIE], solicit aprobarea unui program flexibil in perioada [PERIOADA], dupa urmatorul interval propus: [INTERVAL].

Motivul solicitarii: [MOTIV].

Ma oblig sa respect obiectivele, termenele si procedurile interne aplicabile.

Data: [DATA]

Semnatura: ____________________

""",
    "cerere-telemunca" => """# Cerere desfasurare activitate in regim de telemunca

Catre: [DENUMIRE ANGAJATOR]

Subsemnatul/Subsemnata [NUME], angajat(a) in functia de [FUNCTIE], solicit aprobarea desfasurarii activitatii in regim de telemunca pentru perioada [PERIOADA], din locatia [ADRESA/LOCALITATE].

Motivul solicitarii: [MOTIV].

Declar ca pot asigura conditiile necesare pentru desfasurarea activitatii si respectarea politicilor interne.

Data: [DATA]

Semnatura: ____________________

## Checklist

- [ ] Exista acordul angajatorului.
- [ ] Sunt clare zilele si locatia.
- [ ] Sunt respectate politicile de securitate a datelor.

""",
    "demisie-cu-preaviz" => """# Demisie cu preaviz

Catre: [DENUMIRE ANGAJATOR]

Subsemnatul/Subsemnata [NUME], angajat(a) in functia de [FUNCTIE], va aduc la cunostinta demisia mea din functia detinuta, cu respectarea termenului de preaviz aplicabil.

Solicit ca ultima zi de lucru sa fie [DATA], daca termenul de preaviz se calculeaza conform contractului individual de munca si regulamentelor aplicabile.

Data: [DATA]

Semnatura: ____________________

## Checklist

- [ ] Termenul de preaviz este verificat in contract.
- [ ] Cererea are numar de inregistrare sau dovada transmiterii.
- [ ] Predarea echipamentelor este planificata.

""",
    "demisie-fara-preaviz" => """# Demisie fara preaviz

## Atentie

Foloseste acest model doar dupa ce verifici daca exista temei legal sau contractual pentru incetare fara preaviz. In caz de conflict, cere ajutor specializat.

Catre: [DENUMIRE ANGAJATOR]

Subsemnatul/Subsemnata [NUME], angajat(a) in functia de [FUNCTIE], va notific incetarea contractului individual de munca nr. [NUMAR] din [DATA], prin demisie fara preaviz, incepand cu data de [DATA].

Motivul invocat: [MOTIV].

Va rog sa efectuati formalitatile de incetare si sa imi comunicati documentele aferente.

Data: [DATA]

Semnatura: ____________________

""",
    "foaie-pontaj-simpla" => """# Foaie de pontaj simpla

Luna: [LUNA]

Angajat: [NUME]

Functie: [FUNCTIE]

| Data | Ora inceput | Ora sfarsit | Pauza | Ore lucrate | Observatii |
| --- | --- | --- | --- | --- | --- |
| [DATA] | [ORA] | [ORA] | [DURATA] | [ORE] | [OBSERVATII] |

Total ore: [TOTAL]

Angajat: ____________________

Responsabil: ____________________

""",
    "sesizare-itm" => """# Sesizare catre ITM

## Atentie

Verifica intai canalul oficial al inspectoratului teritorial de munca relevant. Nu include date personale ale altor persoane fara motiv.

Catre: Inspectoratul Teritorial de Munca [JUDET]

Subsemnatul/Subsemnata [NUME], domiciliat(a) in [ADRESA], e-mail [EMAIL], telefon [TELEFON], formulez prezenta sesizare privind angajatorul [DENUMIRE], CUI [CUI], cu sediul in [ADRESA].

Descrierea situatiei:

[DESCRIERE FAPTE, DATE, PERSOANE IMPLICATE, DOCUMENTE]

Solicit verificarea situatiei si comunicarea raspunsului la [EMAIL/ADRESA].

Anexez:

- [DOCUMENT 1]
- [DOCUMENT 2]

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
doc = genereaza_document("cerere-adeverinta-salariat", Dict(
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