#!/bin/bash

# Fonction pour créer une page produit
create_product_page() {
    local filename="$1"
    local icon="$2"
    local title="$3"
    local description="$4"
    
    cat > "/home/user/promexa/produits/$filename" << HTMLEOF
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$title | PROMEXA - Prix les Plus Bas d'Europe Garantis -5%</title>
    <meta name="description" content="$description Prix les plus bas d'Europe garantis -5%. Devis gratuit sous 24h.">
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
                <span style="color: var(--primary);">Prix les Plus Bas Garantis -5%</span>
            </h1>
            <p style="font-size: 1.5rem; color: var(--gray-700); max-width: 900px;">
                $description<br>
                <strong style="color: var(--accent);">Prix les plus bas d'Europe garantis -5% | Devis gratuit sous 24h</strong>
            </p>
            <div style="margin-top: 2rem;">
                <a href="../contact.html" class="btn-primary-large">Demander un Devis Gratuit Maintenant</a>
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
                <div class="guarantee-mega-highlight">
                    <p style="font-size: 1.5rem; margin-bottom: 2rem;">
                        <strong>Trouvez moins cher ailleurs ?</strong> Envoyez-nous votre devis !<br>
                        Nous nous alignons à -5% automatiquement. C'est notre engagement.
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

# Créer toutes les pages PRODUITS
create_product_page "vestes-travail.html" "🧥" "Vestes de Travail" "Vestes de travail professionnelles résistantes. Normes EN, multi-poches, confort optimal."
create_product_page "pantalons-travail.html" "👖" "Pantalons de Travail" "Pantalons de travail renforcés. Multi-poches, genouillères, stretch confort."
create_product_page "gilets-securite.html" "🦺" "Gilets de Sécurité" "Gilets haute visibilité conformes EN ISO 20471. Sécurité maximale pour tous les métiers."
create_product_page "chaussures-securite.html" "👟" "Chaussures de Sécurité" "Chaussures de sécurité S1, S2, S3. Protection et confort garantis."
create_product_page "vetements-haute-visibilite.html" "⚠️" "Vêtements Haute Visibilité" "Tenues complètes haute visibilité. Conformes normes EN ISO 20471."
create_product_page "vetements-protection.html" "🛡️" "Vêtements de Protection" "EPI et vêtements de protection. Toutes normes de sécurité respectées."
create_product_page "t-shirts-personnalises.html" "👕" "T-Shirts Personnalisés" "T-shirts personnalisables premium. Coton, bio, techniques. Broderie HD et sérigraphie."
create_product_page "polos-entreprise.html" "👔" "Polos Entreprise" "Polos professionnels personnalisés. Qualité premium, broderie HD."
create_product_page "sweats-personnalises.html" "🧥" "Sweats Personnalisés" "Sweats et hoodies personnalisables. Collection complète, toutes tailles."
create_product_page "chemises-personnalisees.html" "👔" "Chemises Personnalisées" "Chemises entreprise personnalisables. Broderie logo, qualité professionnelle."
create_product_page "textile-bio.html" "🌱" "Textile Bio & Organic" "Textile 100% coton bio certifié. Éco-responsable et durable."
create_product_page "textile-sport.html" "⚽" "Textile Sport" "Équipements sportifs techniques. Personnalisables pour clubs et équipes."
create_product_page "vestes-softshell.html" "🧥" "Vestes Softshell" "Softshells techniques respirantes. Coupe-vent, déperlantes, confort optimal."
create_product_page "vestes-polaire.html" "🧥" "Vestes Polaire" "Polaires chaudes et légères. Personnalisables, parfaites pour l'hiver."
create_product_page "vestes-hiver.html" "❄️" "Vestes d'Hiver" "Vestes d'hiver chaudes et imperméables. Protection maximale contre le froid."
create_product_page "vestes-pluie.html" "🌧️" "Vestes de Pluie" "Vestes imperméables et coupe-vent. Protection optimale contre la pluie."
create_product_page "gilets-sans-manches.html" "🦺" "Gilets Sans Manches" "Gilets sans manches personnalisables. Pratiques et confortables."
create_product_page "textile-upf.html" "☀️" "Protection UV (UPF)" "Textiles avec protection UV UPF 50+. Parfaits pour l'extérieur."
create_product_page "casquettes-personnalisees.html" "🧢" "Casquettes Personnalisées" "Casquettes et caps personnalisables. Collection Atlantis, broderie HD."
create_product_page "bonnets-personnalises.html" "🎿" "Bonnets Personnalisés" "Bonnets et beanies personnalisables. Chauds et confortables."
create_product_page "sacs-personnalises.html" "👜" "Sacs Personnalisés" "Sacs personnalisables : tote bags, cabas, sacs shopping."
create_product_page "sacs-dos.html" "🎒" "Sacs à Dos" "Sacs à dos personnalisables. Pratiques pour entreprises et événements."
create_product_page "gants-echarpes.html" "🧤" "Gants & Écharpes" "Gants et écharpes personnalisables. Accessoires hiver pour vos équipes."
create_product_page "accessoires-sport.html" "⚽" "Accessoires Sport" "Accessoires sportifs personnalisables. Parfaits pour clubs et équipes."
create_product_page "vestes-cuisine.html" "👨‍🍳" "Vestes de Cuisine" "Vestes de cuisine professionnelles. Collection Karlowsky, confort et style."
create_product_page "tabliers-cuisine.html" "👨‍🍳" "Tabliers de Cuisine" "Tabliers professionnels pour cuisine. Résistants et pratiques."
create_product_page "pantalons-cuisine.html" "👖" "Pantalons de Cuisine" "Pantalons de cuisine professionnels. Confort et résistance garantis."
create_product_page "uniformes-service.html" "👔" "Uniformes de Service" "Uniformes complets pour personnel de service. Élégants et professionnels."
create_product_page "uniformes-hotel.html" "🏨" "Uniformes Hôteliers" "Uniformes pour hôtellerie : réception, conciergerie, service."
create_product_page "chaussures-cuisine.html" "👟" "Chaussures de Cuisine" "Chaussures antidérapantes pour cuisine. Sécurité et confort."

echo "✅ Pages PRODUITS créées avec succès !"
