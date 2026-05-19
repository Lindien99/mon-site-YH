const paysData = [
    { nom: "Allemagne",  code: "ALLEMAGNE",  iso: "de" },
    { nom: "Autriche",   code: "AUTRICHE",   iso: "at" },
    { nom: "Belgique",   code: "BELGIQUE",   iso: "be" },
    { nom: "Croatie",    code: "CROATIE",    iso: "hr" },
    { nom: "Danemark",   code: "DANEMARK",   iso: "dk" },
    { nom: "Espagne",    code: "ESPAGNE",    iso: "es" },
    { nom: "Finlande",   code: "FINLANDE",   iso: "fi" },
    { nom: "France",     code: "FRANCE",     iso: "fr" },
    { nom: "Grèce",      code: "GRECE",      iso: "gr" },
    { nom: "Hongrie",    code: "HONGRIE",    iso: "hu" },
    { nom: "Italie",     code: "ITALIE",     iso: "it" },
    { nom: "Luxembourg", code: "LUXEMBOURG", iso: "lu" },
    { nom: "Norvège",    code: "NORVEGE",    iso: "no" },
    { nom: "Pays-Bas",   code: "PAYS-BAS",   iso: "nl" },
    { nom: "Pologne",    code: "POLOGNE",    iso: "pl" },
    { nom: "Portugal",   code: "PORTUGAL",   iso: "pt" },
    { nom: "Roumanie",   code: "ROUMANIE",   iso: "ro" },
    { nom: "Suède",      code: "SUEDE",      iso: "se" },
    { nom: "Suisse",     code: "SUISSE",     iso: "ch" },
    { nom: "Tchéquie",   code: "TCHEQUIE",   iso: "cz" },
];

const grille = document.getElementById('grid-pays');

paysData.forEach(p => {
    const carte = document.createElement('a');
    carte.className = 'carte-pays';
    carte.href = `pays/${p.code}.html`;

    carte.innerHTML = `
        <div class="drapeau"><img src="https://flagcdn.com/w80/${p.iso}.png" alt="Drapeau ${p.nom}" width="80" height="53"></div>
        <div class="nom-pays">${p.nom}</div>
        <div style="margin-top:10px; font-size:0.8rem; color:#888;">Explorer le guide</div>
    `;

    grille.appendChild(carte);
});
