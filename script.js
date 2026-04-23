const paysData = [
    { nom: "Allemagne", code: "ALLEMAGNE",  emoji: "🇩🇪" },
    { nom: "Autriche",  code: "AUTRICHE",   emoji: "🇦🇹" },
    { nom: "Belgique",  code: "BELGIQUE",   emoji: "🇧🇪" },
    { nom: "Danemark",  code: "DANEMARK",   emoji: "🇩🇰" },
    { nom: "Espagne",   code: "ESPAGNE",    emoji: "🇪🇸" },
    { nom: "Finlande",  code: "FINLANDE",   emoji: "🇫🇮" },
    { nom: "France",    code: "FRANCE",     emoji: "🇫🇷" },
    { nom: "Grèce",     code: "GRECE",      emoji: "🇬🇷" },
    { nom: "Hongrie",   code: "HONGRIE",    emoji: "🇭🇺" },
    { nom: "Italie",    code: "ITALIE",     emoji: "🇮🇹" },
    { nom: "Luxembourg",code: "LUXEMBOURG", emoji: "🇱🇺" },
    { nom: "Norvège",   code: "NORVEGE",    emoji: "🇳🇴" },
    { nom: "Pays-Bas",  code: "PAYS-BAS",   emoji: "🇳🇱" },
    { nom: "Pologne",   code: "POLOGNE",    emoji: "🇵🇱" },
    { nom: "Portugal",  code: "PORTUGAL",   emoji: "🇵🇹" },
    { nom: "Suède",     code: "SUEDE",      emoji: "🇸🇪" },
    { nom: "Suisse",    code: "SUISSE",     emoji: "🇨🇭" },
    { nom: "Tchéquie",  code: "TCHEQUIE",   emoji: "🇨🇿" },
];

const grille = document.getElementById('grid-pays');

paysData.forEach(p => {
    const carte = document.createElement('a');
    carte.className = 'carte-pays';
    carte.href = `pays/${p.code}.html`;

    carte.innerHTML = `
        <div class="drapeau">${p.emoji}</div>
        <div class="nom-pays">${p.nom}</div>
        <div style="margin-top:10px; font-size:0.8rem; color:#888;">Explorer le guide</div>
    `;

    grille.appendChild(carte);
});