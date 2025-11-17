/**
 * Script d'injection dynamique du header et footer
 * Charge les fichiers includes/header.html et includes/footer.html dans toutes les pages
 */

(function() {
    'use strict';

    // Fonction pour détecter la profondeur du chemin actuel
    function getBasePath() {
        const path = window.location.pathname;
        const depth = (path.match(/\//g) || []).length - 1;
        
        if (depth === 0) return '.';
        if (depth === 1) return '..';
        if (depth === 2) return '../..';
        return '../..';
    }

    // Fonction pour charger le header
    async function loadHeader() {
        const headerPlaceholder = document.getElementById('header-placeholder');
        if (!headerPlaceholder) {
            console.warn('Header placeholder not found');
            return;
        }

        try {
            const basePath = getBasePath();
            const response = await fetch(`${basePath}/includes/header.html`);
            if (!response.ok) throw new Error('Header not found');
            
            const html = await response.text();
            headerPlaceholder.innerHTML = html;
            
            // Réinitialiser le menu mobile après injection
            initMobileMenu();
        } catch (error) {
            console.error('Error loading header:', error);
        }
    }

    // Fonction pour charger le footer
    async function loadFooter() {
        const footerPlaceholder = document.getElementById('footer-placeholder');
        if (!footerPlaceholder) {
            console.warn('Footer placeholder not found');
            return;
        }

        try {
            const basePath = getBasePath();
            const response = await fetch(`${basePath}/includes/footer.html`);
            if (!response.ok) throw new Error('Footer not found');
            
            const html = await response.text();
            footerPlaceholder.innerHTML = html;
        } catch (error) {
            console.error('Error loading footer:', error);
        }
    }

    // Fonction pour initialiser le menu mobile après injection
    function initMobileMenu() {
        const mobileToggle = document.querySelector('.mobile-menu-toggle');
        const navMenu = document.querySelector('.nav-menu-new');
        
        if (mobileToggle && navMenu) {
            mobileToggle.addEventListener('click', function() {
                navMenu.classList.toggle('active');
                this.classList.toggle('active');
            });
        }

        // Gérer les mega menus
        const megaMenuItems = document.querySelectorAll('.has-megamenu');
        megaMenuItems.forEach(item => {
            const link = item.querySelector('.nav-link-new');
            const megamenu = item.querySelector('.megamenu');
            
            if (link && megamenu) {
                link.addEventListener('click', function(e) {
                    e.preventDefault();
                    item.classList.toggle('active');
                    
                    // Fermer les autres menus
                    megaMenuItems.forEach(otherItem => {
                        if (otherItem !== item) {
                            otherItem.classList.remove('active');
                        }
                    });
                });
            }
        });

        // Fermer les menus en cliquant à l'extérieur
        document.addEventListener('click', function(e) {
            if (!e.target.closest('.has-megamenu') && !e.target.closest('.mobile-menu-toggle')) {
                megaMenuItems.forEach(item => item.classList.remove('active'));
            }
        });
    }

    // Fonction pour corriger les chemins relatifs dans le header/footer
    function fixRelativePaths() {
        const basePath = getBasePath();
        
        // Corriger tous les liens href qui commencent par /
        document.querySelectorAll('a[href^="/"]').forEach(link => {
            const href = link.getAttribute('href');
            if (href.startsWith('/')) {
                link.setAttribute('href', basePath + href);
            }
        });

        // Corriger les liens des mega menus
        document.querySelectorAll('.megamenu a[href^="/"]').forEach(link => {
            const href = link.getAttribute('href');
            if (href.startsWith('/')) {
                link.setAttribute('href', basePath + href);
            }
        });
    }

    // Charger header et footer au chargement de la page
    document.addEventListener('DOMContentLoaded', async function() {
        await Promise.all([
            loadHeader(),
            loadFooter()
        ]);
        
        // Corriger les chemins après injection
        setTimeout(fixRelativePaths, 100);
        
        // Ajouter la classe "loaded" au body pour les animations
        document.body.classList.add('loaded');
    });

    // Gérer le scroll pour le header sticky
    let lastScroll = 0;
    window.addEventListener('scroll', function() {
        const header = document.querySelector('.header-new');
        if (!header) return;
        
        const currentScroll = window.pageYOffset;
        
        if (currentScroll > 100) {
            header.classList.add('scrolled');
        } else {
            header.classList.remove('scrolled');
        }
        
        lastScroll = currentScroll;
    });

})();
