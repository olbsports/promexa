#!/bin/bash

# Pages SERVICES
for service in "broderie-entreprise:🎨:Broderie Entreprise:Broderie HD professionnelle sur textile" "serigraphie-textile:🖨️:Sérigraphie Textile:Sérigraphie haute qualité pour grandes quantités" "impression-numerique:🖨️:Impression Numérique:Impression numérique textile haute définition" "transfert-textile:🔄:Transfert Textile:Transfert textile flex et flock" "marquage-laser:⚡:Marquage Laser:Marquage laser précis et durable"; do
    IFS=':' read -r file icon title desc <<< "$service"
    
    cat > "/home/user/promexa/services/$file.html" << HTMLEOF
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$title | PROMEXA - Prix les Plus Bas d'Europe -5%</title>
    <meta name="description" content="$desc Prix les plus bas d'Europe garantis -5%.">
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
                $desc<br>
                <strong style="color: var(--accent);">Prix les plus bas d'Europe garantis -5%</strong>
            </p>
            <div style="margin-top: 2rem;">
                <a href="../contact.html" class="btn-primary-large">Demander un Devis Gratuit</a>
            </div>
        </div>
    </section>

    <section class="guarantee-section-mega">
        <div class="container-guarantee">
            <div class="guarantee-content-mega">
                <div class="guarantee-mega-badge">🏆 GARANTIE -5%</div>
                <h2 class="guarantee-mega-title">PRIX LES PLUS BAS D'EUROPE<br><span style="color: #00D9B8; font-size: 4.5rem;">GARANTIS -5%</span></h2>
                <div class="guarantee-mega-highlight">
                    <a href="../contact.html" class="btn-guarantee-mega"><span>🏆 Demander un Devis</span></a>
                </div>
            </div>
        </div>
    </section>

    <footer class="footer-new">
        <div class="footer-bottom">
            <div class="container-footer">
                <div class="footer-bottom-content">
                    <div class="footer-copyright">© 2024 PROMEXA</div>
                </div>
            </div>
        </div>
    </footer>
    <script src="../js/main.js"></script>
</body>
</html>
HTMLEOF
done

# Pages ENTREPRISE
cat > "/home/user/promexa/qui-sommes-nous.html" << 'HTMLEOF'
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>À Propos | PROMEXA - Prix les Plus Bas d'Europe Garantis -5%</title>
    <link rel="stylesheet" href="css/style-modern.css">
</head>
<body>
    <header class="header-new">
        <div class="header-top">
            <div class="container-header">
                <div class="header-top-content">
                    <div class="header-info">
                        <span class="header-guarantee-badge">🏆 PRIX LES PLUS BAS D'EUROPE GARANTIS -5%</span>
                        <span>📧 contact@promexa.eu</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="header-main">
            <div class="container-header">
                <nav class="main-nav">
                    <a href="index.html" class="logo-new">
                        <span class="logo-icon">◆</span>
                        <span class="logo-text">PROMEXA</span>
                    </a>
                    <ul class="nav-menu-new">
                        <li class="nav-item-new"><a href="index.html" class="nav-link-new">Accueil</a></li>
                        <li class="nav-item-new"><a href="contact.html" class="nav-link-new nav-cta-btn">Devis Gratuit</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </header>

    <section class="page-hero">
        <div class="container-section" style="padding: 8rem 2rem 4rem;">
            <h1 style="font-size: 4rem; color: var(--dark); margin: 2rem 0;">
                À Propos de PROMEXA<br>
                <span style="color: var(--primary);">Votre Partenaire Textile Européen</span>
            </h1>
            <p style="font-size: 1.5rem; color: var(--gray-700); max-width: 900px;">
                Leader européen du textile professionnel et promotionnel depuis 2010.<br>
                <strong style="color: var(--accent);">Prix les plus bas d'Europe garantis -5% | 2000+ clients satisfaits</strong>
            </p>
        </div>
    </section>

    <footer class="footer-new">
        <div class="footer-bottom">
            <div class="container-footer">
                <div class="footer-bottom-content">
                    <div class="footer-copyright">© 2024 PROMEXA</div>
                </div>
            </div>
        </div>
    </footer>
    <script src="js/main.js"></script>
</body>
</html>
HTMLEOF

# Copier pour autres pages entreprise
for page in "realisations:Réalisations:Nos Projets Clients" "blog:Blog:Actualités Textile" "contact:Contact:Demandez un Devis" "catalogue:Catalogues:Nos Catalogues PDF"; do
    IFS=':' read -r file title subtitle <<< "$page"
    sed "s/À Propos de PROMEXA/$title PROMEXA/g; s/Votre Partenaire Textile Européen/$subtitle/g" /home/user/promexa/qui-sommes-nous.html > /home/user/promexa/$file.html
done

echo "✅ Pages SERVICES et ENTREPRISE créées !"
