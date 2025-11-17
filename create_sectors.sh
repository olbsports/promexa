#!/bin/bash

# Fonction pour créer une page secteur
create_sector_page() {
    local filename="$1"
    local icon="$2"
    local title="$3"
    local description="$4"
    
    cat > "/home/user/promexa/secteurs/$filename" << HTMLEOF
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$title | PROMEXA - Prix les Plus Bas d'Europe Garantis -5%</title>
    <meta name="description" content="$description Prix les plus bas d'Europe garantis -5%. Solutions textile sur-mesure.">
    <link rel="stylesheet" href="../css/style-modern.css">
</head>
<body>
    <header class="header-new">
        <div class="header-top">
            <div class="container-header">
                <div class="header-top-content">
                    <div class="header-info">
                        <span class="header-guarantee-badge">🏆 PRIX LES PLUS BAS D'EUROPE GARANTIS -5%</span>
                        <span>📧 contact@promexa.eu</span>
                        <span>⏱️ Devis sous 24h</span>
                    </div>
                    <div class="header-actions">
                        <a href="../catalogue.html" class="header-link">📚 Catalogues</a>
                        <a href="../contact.html" class="header-link">💬 Contact</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="header-main">
            <div class="container-header">
                <nav class="main-nav">
                    <a href="../index.html" class="logo-new">
                        <span class="logo-icon">◆</span>
                        <span class="logo-text">PROMEXA</span>
                        <span class="logo-tagline">Textile Pro</span>
                    </a>
                    <ul class="nav-menu-new">
                        <li class="nav-item-new"><a href="../index.html" class="nav-link-new">Accueil</a></li>
                        <li class="nav-item-new"><a href="../contact.html" class="nav-link-new nav-cta-btn">Devis Gratuit</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </header>

    <section class="page-hero">
        <div class="container-section" style="padding: 8rem 2rem 4rem;">
            <h1 style="font-size: 4rem; color: var(--dark); margin: 2rem 0;">
                $icon $title<br>
                <span style="color: var(--primary);">Solutions Textile Professionnelles</span>
            </h1>
            <p style="font-size: 1.5rem; color: var(--gray-700); max-width: 900px;">
                $description<br>
                <strong style="color: var(--accent);">Prix les plus bas d'Europe garantis -5% | Solutions sur-mesure pour votre secteur</strong>
            </p>
            <div style="margin-top: 2rem;">
                <a href="../contact.html" class="btn-primary-large">Demander un Devis Gratuit</a>
            </div>
        </div>
    </section>

    <section class="guarantee-section-mega">
        <div class="container-guarantee">
            <div class="guarantee-content-mega">
                <div class="guarantee-mega-badge">🏆 GARANTIE OFFICIELLE PROMEXA</div>
                <h2 class="guarantee-mega-title">
                    PRIX LES PLUS BAS D'EUROPE<br>
                    <span style="color: #00D9B8; font-size: 4.5rem;">GARANTIS -5%</span>
                </h2>
                <div class="guarantee-mega-box">
                    <div class="guarantee-mega-item">
                        <div class="guarantee-mega-icon">💰</div>
                        <h3>Trouvez Moins Cher ?</h3>
                        <p>Envoyez-nous votre devis concurrent</p>
                    </div>
                    <div class="guarantee-mega-arrow">→</div>
                    <div class="guarantee-mega-item">
                        <div class="guarantee-mega-icon">✅</div>
                        <h3>Nous Alignons à -5%</h3>
                        <p>Automatiquement sans négociation</p>
                    </div>
                    <div class="guarantee-mega-arrow">→</div>
                    <div class="guarantee-mega-item">
                        <div class="guarantee-mega-icon">🎯</div>
                        <h3>Ou Remboursé !</h3>
                        <p>Satisfaction 100% garantie</p>
                    </div>
                </div>
                <div class="guarantee-mega-highlight">
                    <p style="font-size: 1.5rem; margin-bottom: 2rem;">
                        <strong>Réseau direct avec 50+ fabricants européens</strong><br>
                        Volumes importants • Pas d'intermédiaires • Économies répercutées à 100% !
                    </p>
                    <a href="../contact.html" class="btn-guarantee-mega">
                        <span>🏆 Envoyer Mon Devis Concurrent</span>
                        <small>Réponse en 2h maximum</small>
                    </a>
                </div>
            </div>
        </div>
    </section>

    <footer class="footer-new">
        <div class="footer-bottom">
            <div class="container-footer">
                <div class="footer-bottom-content">
                    <div class="footer-copyright">© 2024 PROMEXA. Tous droits réservés.</div>
                </div>
            </div>
        </div>
    </footer>
    <script src="../js/main.js"></script>
</body>
</html>
HTMLEOF
}

# Créer toutes les pages SECTEURS
create_sector_page "artisanat.html" "🔨" "Artisanat & Métiers" "Vêtements de travail techniques pour artisans. Résistants, confortables, adaptés à chaque métier."
create_sector_page "industrie.html" "⚙️" "Industrie & Production" "Workwear industriel résistant. Protection et confort pour vos équipes de production."
create_sector_page "btp.html" "🏗️" "BTP & Construction" "Tenues de chantier conformes aux normes. Haute visibilité, protection maximale."
create_sector_page "automobile.html" "🚗" "Automobile" "Tenues techniques pour garages et concessions. Résistantes aux taches et huiles."
create_sector_page "hotellerie-restauration.html" "🍽️" "Hôtellerie & Restauration" "Uniformes élégants pour hôtels et restaurants. Collection Karlowsky premium."
create_sector_page "food-beverages.html" "☕" "Food & Beverages" "Tenues pour cafés, boulangeries, food trucks. Style et praticité."
create_sector_page "retail-commerce.html" "🛍️" "Retail & Commerce" "Uniformes pour magasins et boutiques. Image professionnelle garantie."
create_sector_page "services.html" "💼" "Services Professionnels" "Tenues corporate et uniformes de service. Élégance et professionnalisme."
create_sector_page "nettoyage.html" "🧹" "Nettoyage & Entretien" "Tenues pratiques et résistantes pour services de nettoyage."
create_sector_page "pharmacie.html" "💊" "Pharmacie & Laboratoires" "Blouses et tenues pour pharmacies et laboratoires. Normes sanitaires respectées."
create_sector_page "education.html" "📚" "Éducation & Formation" "Textile pour centres de formation et établissements éducatifs."
create_sector_page "ecoles-universites.html" "🎓" "Écoles & Universités" "Textile personnalisé pour écoles, universités, campus."
create_sector_page "creches.html" "👶" "Crèches & Petite Enfance" "Textile adapté pour professionnels de la petite enfance."
create_sector_page "evenements-entreprise.html" "🎯" "Événements Entreprise" "Textile événementiel personnalisé. Séminaires, salons, conventions."
create_sector_page "festivals.html" "🎪" "Festivals & Concerts" "Équipements pour festivals : équipes, bénévoles, merchandising."
create_sector_page "clubs-sportifs.html" "⚽" "Clubs Sportifs" "Équipements sportifs personnalisés pour clubs et associations."
create_sector_page "loisirs.html" "🎮" "Loisirs & Associations" "Textile pour associations, clubs de loisirs, hobby."
create_sector_page "team-building.html" "🤝" "Team Building" "Textile personnalisé pour activités team building et cohésion d'équipe."
create_sector_page "villes-communes.html" "🏙️" "Villes & Communes" "Équipements pour services municipaux, agents territoriaux."
create_sector_page "administrations.html" "🏛️" "Administrations Publiques" "Uniformes pour administrations et services publics."
create_sector_page "securite.html" "👮" "Sécurité & Gardiennage" "Tenues de sécurité professionnelles. Haute visibilité et protection."
create_sector_page "pompiers.html" "🚒" "Pompiers & Secours" "Équipements pour pompiers et services de secours."
create_sector_page "environnement.html" "🌱" "Environnement & Espaces Verts" "Tenues pour agents d'espaces verts et environnement."

echo "✅ Pages SECTEURS créées avec succès !"
