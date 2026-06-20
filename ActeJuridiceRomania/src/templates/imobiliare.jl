"""
    Imobiliare

Modul pentru categoria: imobiliare
Contine 4 template-uri de documente juridice romanesti.
"""
module Imobiliare

export lista_documente, obtine_template, genereaza_document

"""Dictionar cu toate template-urile din aceasta categorie."""
const TEMPLATES = Dict{String, String}(
    "acord-arvuna-imobil" => """# Acord privind arvuna la vanzarea unui imobil

## Cand se foloseste

Pentru a documenta separat suma platita cu titlu de arvuna (garantie) in cadrul unei negocieri de vanzare a unui imobil, atunci cand partile vor sa clarifice expres regimul juridic al sumei (arvuna confirmatorie sau arvuna penalizatoare) inainte de a semna un antecontract complet. Arvuna are, de regula, un regim diferit de simplul avans: in caz de neexecutare din culpa uneia dintre parti, consecintele pot fi mai severe (pierderea sumei sau restituirea dublului, dupa caz), de aceea termenii trebuie sa fie expliciti.

## Model

Incheiat astazi, [DATA], in [LOCALITATE].

### 1. Partile

Proprietar (viitor vanzator): [NUME], CNP [CNP], domiciliat in [ADRESA].

Potential cumparator: [NUME], CNP [CNP], domiciliat in [ADRESA].

### 2. Imobilul vizat

Imobilul situat in [ADRESA COMPLETA], identificat prin numarul cadastral/carte funciara [NUMAR CF/CADASTRAL], pentru care partile negociaza o vanzare la pretul orientativ de [SUMA] [MONEDA].

### 3. Suma de arvuna

Potentialul cumparator plateste proprietarului, la data semnarii prezentului acord, suma de [SUMA ARVUNA] [MONEDA], cu titlu de arvuna, confirmata prin [CHITANTA/ORDIN DE PLATA NR.].

### 4. Natura arvunei

Partile convin in mod expres ca suma mentionata are natura de [ARVUNA CONFIRMATORIE / ARVUNA PENALIZATOARE - ALEGE VARIANTA]:

- Daca este arvuna confirmatorie: la finalizarea vanzarii, suma se considera avans din pret; daca vanzarea nu se realizeaza din motive neimputabile partilor, arvuna se restituie integral.
- Daca este arvuna penalizatoare: daca potentialul cumparator renunta, pierde arvuna; daca proprietarul renunta, restituie dublul arvunei primite.

### 5. Termenul pentru semnarea antecontractului/contractului

Partile se obliga sa formalizeze intelegerea printr-un antecontract complet sau direct prin contract de vanzare notarial, in termen de [TERMEN], dupa verificarea documentatiei imobilului.

Semnaturi:

Proprietar: ____________________

Potential cumparator: ____________________

## Checklist

- [ ] Este precizat clar tipul arvunei (confirmatorie sau penalizatoare), pentru ca efectele juridice difera semnificativ.
- [ ] Suma si modalitatea de plata sunt documentate (chitanta, ordin de plata).
- [ ] Imobilul este suficient identificat, chiar la acest stadiu preliminar.
- [ ] Ai stabilit un termen clar pentru pasul urmator (antecontract sau contract notarial).
- [ ] Ai luat in calcul consultarea unui notar sau avocat inainte de a plati sume mari cu titlu de arvuna.
""",
    "antecontract-vanzare-cumparare-imobil" => """# Antecontract (promisiune bilaterala) de vanzare-cumparare imobil

## Cand se foloseste

Pentru a stabili angajamentul ferm al partilor de a vinde, respectiv de a cumpara un imobil, inainte de semnarea actului final la notar. Util cand cumparatorul are nevoie de timp pentru credit/finantare sau cand vanzatorul are nevoie de timp pentru a elibera imobilul ori a finaliza documentatia (carte funciara, certificate, intabulare). Transferul efectiv al proprietatii imobilelor se face doar prin act autentic notarial sau hotarare judecatoreasca, conform legii; acest antecontract NU transfera proprietatea.

## Model

Incheiat astazi, [DATA], in [LOCALITATE].

### 1. Partile

Promitent-vanzator: [NUME], CNP [CNP], domiciliat in [ADRESA], identificat cu [CI/PASAPORT], casatorit/necasatorit, [REGIM MATRIMONIAL daca este relevant].

Promitent-cumparator: [NUME], CNP [CNP], domiciliat in [ADRESA], identificat cu [CI/PASAPORT].

### 2. Obiectul promisiunii

Promitentul-vanzator se obliga sa vanda, iar promitentul-cumparator se obliga sa cumpere imobilul situat in [ADRESA COMPLETA A IMOBILULUI], compus din [DESCRIERE - SUPRAFATA, CAMERE, ANEXE], identificat prin numarul cadastral/carte funciara [NUMAR CF/CADASTRAL], inscris in cartea funciara a [LOCALITATE/UAT].

### 3. Pretul si avansul

Pretul total convenit este de [SUMA] [MONEDA]. La semnarea prezentului antecontract, promitentul-cumparator plateste un avans de [SUMA AVANS] [MONEDA], suma confirmata prin [CHITANTA/ORDIN DE PLATA NR.]. Diferenta de pret, in suma de [SUMA RESTANTA] [MONEDA], se va plati la data autentificarii contractului de vanzare la notar, prin [MODALITATE - NUMERAR/TRANSFER/CREDIT BANCAR].

### 4. Termenul pentru autentificarea notariala

Partile se obliga sa se prezinte la notarul public pentru autentificarea contractului de vanzare-cumparare cel mai tarziu la data de [DATA LIMITA], cu posibilitatea prelungirii prin acordul scris al ambelor parti.

### 5. Starea juridica a imobilului

Promitentul-vanzator declara ca imobilul este liber de sarcini, ipoteci, sechestre sau litigii, cu exceptia: [MENTIONEAZA SARCINILE EXISTENTE, DACA EXISTA, ALTFEL \"NU EXISTA SARCINI\"]. Promitentul-vanzator se obliga sa obtina toate certificatele si documentele necesare (certificat fiscal, extras de carte funciara actualizat, certificat energetic, daca este cazul) pentru autentificare.

### 6. Predarea imobilului

Predarea posesiei imobilului se va face la data de [DATA], printr-un proces-verbal separat de predare-primire.

### 7. Clauza de arvuna / neexecutare

Daca promitentul-cumparator refuza nejustificat sa finalizeze vanzarea, acesta pierde avansul platit. Daca promitentul-vanzator refuza nejustificat sa finalizeze vanzarea, acesta restituie promitentului-cumparator avansul, [DUBLAT/CU PENALITATI DE..., DACA SE CONVINE ACEST LUCRU].

### 8. Alte clauze

[ADAUGA CLAUZE SPECIFICE - DE EXEMPLU PRIVIND CREDITUL BANCAR, EXPERTIZE, CONDITII SUSPENSIVE].

Semnaturi:

Promitent-vanzator: ____________________

Promitent-cumparator: ____________________

## Checklist

- [ ] Imobilul este identificat exact (adresa, numar cadastral/carte funciara).
- [ ] Pretul, avansul si modalitatea de plata a restului sunt clare.
- [ ] Termenul pentru autentificarea notariala este stabilit si realist.
- [ ] Ai cerut un extras de carte funciara actualizat pentru a verifica sarcinile/ipotecile existente.
- [ ] Consecintele neexecutarii (pierderea/restituirea avansului) sunt clar definite.
- [ ] Daca exista credit bancar implicat, antecontractul este conditionat corespunzator de aprobarea creditului.
- [ ] Esti constient(a) ca proprietatea se transfera doar prin act autentic notarial, nu prin acest antecontract.
""",
    "notificare-neexecutare-antecontract-imobil" => """# Notificare privind neexecutarea unui antecontract de vanzare-cumparare imobil

## Cand se foloseste

Pentru a notifica formal cealalta parte a unui antecontract de vanzare-cumparare imobil ca nu a respectat un termen sau o obligatie asumata (de exemplu nu s-a prezentat la notar la termenul stabilit), inainte de a lua masuri suplimentare (cerere de executare, actiune in instanta sau retragere din promisiune). O notificare scrisa, transmisa intr-un mod care poate fi dovedit (scrisoare recomandata, email cu confirmare), este de regula un pas necesar inainte de orice actiune ulterioara.

## Model

Catre: [NUME DESTINATAR], domiciliat in [ADRESA]

De la: [NUME EXPEDITOR], domiciliat in [ADRESA]

Subsemnatul/Subsemnata [NUME EXPEDITOR], parte la antecontractul de vanzare-cumparare incheiat la data de [DATA ANTECONTRACT] cu privire la imobilul situat in [ADRESA IMOBIL], va notific prin prezenta urmatoarele:

Conform antecontractului mentionat, partile s-au obligat ca, cel mai tarziu la data de [DATA TERMEN], sa se prezinte la notarul public pentru autentificarea contractului de vanzare-cumparare / sa execute obligatia de [DESCRIE OBLIGATIA NEEXECUTATA].

Constat ca, la data prezentei notificari, aceasta obligatie nu a fost executata.

Va pun in vedere sa va conformati obligatiilor asumate in termen de [NUMAR] zile de la primirea prezentei notificari, respectiv sa [DESCRIE CE SE SOLICITA - PREZENTARE LA NOTAR, RESTITUIRE AVANS, ALTELE].

In caz contrar, imi rezerv dreptul de a [DESCRIE CONSECINTA - SOLICITA REZOLUTIUNEA ANTECONTRACTULUI, EXECUTAREA IN INSTANTA, RESTITUIREA SUMELOR PLATITE, DAUNE].

Data: [DATA]

Semnatura: ____________________

## Checklist

- [ ] Sunt mentionate exact obligatia neexecutata si termenul initial convenit.
- [ ] Este stabilit un termen rezonabil de remediere inainte de a lua alte masuri.
- [ ] Notificarea este trimisa intr-un mod care poate fi dovedit (recomandata cu confirmare de primire, email cu confirmare de citire).
- [ ] Ai pastrat o copie a notificarii si a dovezii de transmitere.
- [ ] Ai verificat clauzele antecontractului privind consecintele neexecutarii (arvuna, penalitati), pentru a le mentiona corect.
""",
    "promisiune-unilaterala-vanzare-imobil" => """# Promisiune unilaterala (optiune) de vanzare imobil

## Cand se foloseste

Pentru situatia in care doar proprietarul se obliga sa vanda un imobil unei persoane determinate, la un pret stabilit, intr-un termen fixat, fara ca beneficiarul optiunii sa se oblige inca sa cumpere. Beneficiarul plateste de regula o suma pentru a \"rezerva\" acest drept de optiune; daca nu cumpara in termen, suma poate fi retinuta de promitent, conform celor convenite.

## Model

Incheiat astazi, [DATA], in [LOCALITATE].

### 1. Partile

Promitent (proprietar): [NUME], CNP [CNP], domiciliat in [ADRESA], identificat cu [CI/PASAPORT].

Beneficiarul optiunii: [NUME], CNP [CNP], domiciliat in [ADRESA], identificat cu [CI/PASAPORT].

### 2. Obiectul promisiunii

Promitentul se obliga in mod ferm sa vanda beneficiarului, daca acesta isi exercita dreptul de optiune in termenul stabilit, imobilul situat in [ADRESA COMPLETA], identificat prin numarul cadastral/carte funciara [NUMAR CF/CADASTRAL].

### 3. Pretul

Pretul la care se va vinde imobilul, daca optiunea este exercitata, este de [SUMA] [MONEDA], pret care ramane fix pe durata termenului de optiune.

### 4. Termenul de optiune

Beneficiarul poate exercita dreptul de optiune (cumparare) in termen de [PERIOADA - DE EXEMPLU 60 DE ZILE] de la data prezentului acord, transmitand promitentului o notificare scrisa in acest sens.

### 5. Suma platita pentru optiune

Beneficiarul plateste promitentului, la semnare, suma de [SUMA] [MONEDA] cu titlu de pret al optiunii / avans din pretul final. Daca optiunea nu este exercitata in termen, aceasta suma [SE RETINE DE PROMITENT / SE RESTITUIE, conform celor convenite].

### 6. Efectele exercitarii optiunii

Daca beneficiarul exercita optiunea in termen, partile se obliga sa se prezinte la notar pentru autentificarea contractului de vanzare-cumparare in termen de [NUMAR] zile de la notificarea exercitarii optiunii.

### 7. Neexercitarea optiunii

Daca beneficiarul nu exercita optiunea in termenul stabilit, promisiunea isi pierde efectele si promitentul este liber sa vanda imobilul oricarei alte persoane.

Semnaturi:

Promitent: ____________________

Beneficiarul optiunii: ____________________

## Checklist

- [ ] Imobilul este identificat exact si pretul este fixat clar.
- [ ] Termenul de optiune este precis (data de inceput si de sfarsit).
- [ ] Sunt clare consecintele neexercitarii optiunii asupra sumei platite.
- [ ] Modalitatea de notificare a exercitarii optiunii (scris, recomandata, email) este stabilita.
- [ ] Ai verificat situatia juridica a imobilului (sarcini, ipoteci) inainte de semnare.
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
doc = genereaza_document("acord-arvuna-imobil", Dict(
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