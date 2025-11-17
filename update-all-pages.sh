#!/bin/bash

# Script pour remplacer tous les headers/footers statiques par injection dynamique

echo "🚀 Mise à jour de toutes les pages avec injection dynamique..."

# Fonction pour mettre à jour une page
update_page() {
    local file=$1
    local depth=$2  # Profondeur pour les chemins relatifs (../ ou ../../)
    
    if [ ! -f "$file" ]; then
        return
    fi
    
    echo "   Mise à jour: $file"
    
    # Créer un fichier temporaire
    temp_file="${file}.tmp"
    
    # Déterminer le chemin relatif pour les scripts
    local script_path=""
    if [ "$depth" = "0" ]; then
        script_path="js/"
    elif [ "$depth" = "1" ]; then
        script_path="../js/"
    elif [ "$depth" = "2" ]; then
        script_path="../../js/"
    fi
    
    # Utiliser Python pour faire le remplacement proprement
    python3 << PYTHON_EOF
import re

with open('$file', 'r', encoding='utf-8') as f:
    content = f.read()

# Remplacer le header par le placeholder
# Pattern: de <header jusqu'à </header> (non greedy)
content = re.sub(
    r'<header[^>]*>.*?</header>',
    '<!-- HEADER INJECTÉ DYNAMIQUEMENT -->\n    <div id="header-placeholder"></div>',
    content,
    flags=re.DOTALL
)

# Remplacer le footer par le placeholder
# Pattern: de <footer jusqu'à </footer> (non greedy)
content = re.sub(
    r'<footer[^>]*>.*?</footer>',
    '<!-- FOOTER INJECTÉ DYNAMIQUEMENT -->\n    <div id="footer-placeholder"></div>',
    content,
    flags=re.DOTALL
)

# S'assurer que les scripts sont présents avant </body>
# D'abord, supprimer les anciens scripts s'ils existent
content = re.sub(r'<script src="[^"]*js/main\.js"></script>\s*', '', content)
content = re.sub(r'<script src="[^"]*js/inject-header-footer\.js"></script>\s*', '', content)

# Ajouter les nouveaux scripts avant </body>
if '</body>' in content:
    scripts = '''
    <!-- SCRIPTS -->
    <script src="${script_path}main.js"></script>
    <script src="${script_path}inject-header-footer.js"></script>
</body>'''
    content = content.replace('</body>', scripts)

with open('$file', 'w', encoding='utf-8') as f:
    f.write(content)
PYTHON_EOF
}

# Mettre à jour index.html (profondeur 0)
if [ -f "index.html" ]; then
    update_page "index.html" 0
fi

# Mettre à jour les pages à la racine
for file in *.html; do
    if [ "$file" != "index.html" ] && [ "$file" != "_TEMPLATE.html" ]; then
        update_page "$file" 0
    fi
done

# Mettre à jour les pages produits (profondeur 1)
if [ -d "produits" ]; then
    for file in produits/*.html; do
        update_page "$file" 1
    done
fi

# Mettre à jour les pages secteurs (profondeur 1)
if [ -d "secteurs" ]; then
    for file in secteurs/*.html; do
        update_page "$file" 1
    done
fi

# Mettre à jour les pages marques (profondeur 1)
if [ -d "marques" ]; then
    for file in marques/*.html; do
        update_page "$file" 1
    done
fi

# Mettre à jour les pages services (profondeur 1)
if [ -d "services" ]; then
    for file in services/*.html; do
        update_page "$file" 1
    done
fi

echo ""
echo "✅ Mise à jour terminée !"
echo "📊 Toutes les pages utilisent maintenant l'injection dynamique"
