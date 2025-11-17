// ==========================================
// PROMEXA - Main JavaScript
// Complete Redesign 2025
// ==========================================

(function() {
    'use strict';

    // ==========================================
    // MOBILE MENU
    // ==========================================

    function initMobileMenu() {
        const mobileToggle = document.querySelector('.mobile-menu-toggle');
        const navMenu = document.querySelector('.nav-menu-new');

        if (!mobileToggle || !navMenu) return;

        mobileToggle.addEventListener('click', function(e) {
            e.stopPropagation();
            const isActive = navMenu.classList.toggle('active');
            mobileToggle.classList.toggle('active');
            document.body.style.overflow = isActive ? 'hidden' : '';

            // Animate hamburger
            const spans = this.querySelectorAll('span');
            if (isActive) {
                spans[0].style.transform = 'rotate(45deg) translateY(7px)';
                spans[1].style.opacity = '0';
                spans[2].style.transform = 'rotate(-45deg) translateY(-7px)';
            } else {
                spans[0].style.transform = '';
                spans[1].style.opacity = '';
                spans[2].style.transform = '';
            }
        });

        // Close menu when clicking outside
        document.addEventListener('click', function(e) {
            if (!e.target.closest('.main-nav') && navMenu.classList.contains('active')) {
                navMenu.classList.remove('active');
                mobileToggle.classList.remove('active');
                document.body.style.overflow = '';

                const spans = mobileToggle.querySelectorAll('span');
                spans[0].style.transform = '';
                spans[1].style.opacity = '';
                spans[2].style.transform = '';
            }
        });

        // Close on ESC key
        document.addEventListener('keydown', function(e) {
            if (e.key === 'Escape' && navMenu.classList.contains('active')) {
                navMenu.classList.remove('active');
                mobileToggle.classList.remove('active');
                document.body.style.overflow = '';

                const spans = mobileToggle.querySelectorAll('span');
                spans[0].style.transform = '';
                spans[1].style.opacity = '';
                spans[2].style.transform = '';
            }
        });

        // Handle mega menu items on mobile
        const megaItems = document.querySelectorAll('.nav-item-new.has-mega');
        megaItems.forEach(item => {
            const link = item.querySelector('.nav-link-new');
            if (link && window.innerWidth <= 768) {
                link.addEventListener('click', function(e) {
                    e.preventDefault();
                    const megaMenu = item.querySelector('.mega-menu-full');
                    if (megaMenu) {
                        megaMenu.style.position = 'static';
                        megaMenu.style.opacity = '1';
                        megaMenu.style.visibility = 'visible';
                        megaMenu.style.transform = 'translateY(0)';
                    }
                });
            }
        });
    }

    // ==========================================
    // HEADER SCROLL EFFECT
    // ==========================================

    function initHeaderScroll() {
        const header = document.querySelector('.header-new');
        if (!header) return;

        let lastScroll = 0;

        window.addEventListener('scroll', debounce(function() {
            const currentScroll = window.pageYOffset;

            if (currentScroll > 100) {
                header.style.boxShadow = '0 4px 20px rgba(0,0,0,0.1)';
            } else {
                header.style.boxShadow = '0 1px 2px 0 rgba(0, 0, 0, 0.05)';
            }

            lastScroll = currentScroll;
        }, 10));
    }

    // ==========================================
    // SMOOTH SCROLLING
    // ==========================================

    function initSmoothScroll() {
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function(e) {
                const href = this.getAttribute('href');
                if (href && href !== '#') {
                    const target = document.querySelector(href);
                    if (target) {
                        e.preventDefault();
                        const headerHeight = document.querySelector('.header-new')?.offsetHeight || 120;
                        const targetPosition = target.offsetTop - headerHeight;

                        window.scrollTo({
                            top: targetPosition,
                            behavior: 'smooth'
                        });
                    }
                }
            });
        });
    }

    // ==========================================
    // BACK TO TOP BUTTON
    // ==========================================

    function initBackToTop() {
        const backToTop = document.querySelector('.back-to-top-new, #backToTop');
        if (!backToTop) return;

        window.addEventListener('scroll', debounce(function() {
            if (window.pageYOffset > 500) {
                backToTop.classList.add('visible');
            } else {
                backToTop.classList.remove('visible');
            }
        }, 100));

        backToTop.addEventListener('click', function() {
            window.scrollTo({
                top: 0,
                behavior: 'smooth'
            });
        });
    }

    // ==========================================
    // FORM HANDLING
    // ==========================================

    function initForms() {
        const forms = document.querySelectorAll('form');

        forms.forEach(form => {
            form.addEventListener('submit', function(e) {
                e.preventDefault();

                const requiredFields = form.querySelectorAll('[required]');
                let isValid = true;

                requiredFields.forEach(field => {
                    if (!field.value.trim()) {
                        isValid = false;
                        field.style.borderColor = '#EF4444';
                        field.style.outline = '2px solid #EF4444';
                    } else {
                        field.style.borderColor = '';
                        field.style.outline = '';
                    }
                });

                if (isValid) {
                    const submitBtn = form.querySelector('button[type="submit"]');
                    const originalText = submitBtn ? submitBtn.textContent : '';

                    if (submitBtn) {
                        submitBtn.textContent = 'Envoi en cours...';
                        submitBtn.disabled = true;
                    }

                    // Simulate API call
                    setTimeout(() => {
                        showNotification('Merci ! Nous vous répondrons sous 24h à l\'adresse email fournie.', 'success');
                        form.reset();
                        if (submitBtn) {
                            submitBtn.textContent = originalText;
                            submitBtn.disabled = false;
                        }
                    }, 1500);
                } else {
                    showNotification('Veuillez remplir tous les champs obligatoires (*)', 'error');
                }
            });
        });
    }

    // ==========================================
    // NOTIFICATION SYSTEM
    // ==========================================

    function showNotification(message, type = 'info') {
        const notification = document.createElement('div');
        notification.className = `notification notification-${type}`;
        notification.style.cssText = `
            position: fixed;
            top: 140px;
            right: 20px;
            background: ${type === 'success' ? '#10B981' : type === 'error' ? '#EF4444' : '#0066FF'};
            color: white;
            padding: 16px 24px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
            z-index: 10000;
            max-width: 400px;
            font-size: 14px;
            animation: slideInRight 0.3s ease-out;
        `;
        notification.textContent = message;

        document.body.appendChild(notification);

        setTimeout(() => {
            notification.style.animation = 'slideOutRight 0.3s ease-out';
            setTimeout(() => notification.remove(), 300);
        }, 4000);
    }

    // ==========================================
    // SCROLL ANIMATIONS
    // ==========================================

    function initScrollAnimations() {
        if (!('IntersectionObserver' in window)) return;

        const observerOptions = {
            threshold: 0.1,
            rootMargin: '0px 0px -50px 0px'
        };

        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.style.opacity = '1';
                    entry.target.style.transform = 'translateY(0)';
                    observer.unobserve(entry.target);
                }
            });
        }, observerOptions);

        // Observe elements
        const animatedElements = document.querySelectorAll(
            '.product-card-large, .product-card-medium, .sector-card, ' +
            '.brand-card-feature, .testimonial-card-new, .process-step, .stat-card-new'
        );

        animatedElements.forEach((el, index) => {
            el.style.opacity = '0';
            el.style.transform = 'translateY(30px)';
            el.style.transition = 'opacity 0.6s ease-out, transform 0.6s ease-out';
            el.style.transitionDelay = `${index * 0.05}s`;
            observer.observe(el);
        });
    }

    // ==========================================
    // LAZY LOADING IMAGES
    // ==========================================

    function initLazyLoading() {
        if (!('IntersectionObserver' in window)) return;

        const imageObserver = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    const img = entry.target;
                    if (img.dataset.src) {
                        img.src = img.dataset.src;
                        img.classList.remove('lazy');
                        imageObserver.unobserve(img);
                    }
                }
            });
        });

        const lazyImages = document.querySelectorAll('img.lazy, img[data-src]');
        lazyImages.forEach(img => imageObserver.observe(img));
    }

    // ==========================================
    // ANALYTICS TRACKING
    // ==========================================

    function trackEvent(category, action, label) {
        // Console log for development
        console.log('📊 Event:', category, action, label);

        // Google Analytics (if available)
        if (typeof gtag !== 'undefined') {
            gtag('event', action, {
                'event_category': category,
                'event_label': label
            });
        }

        // Matomo (if available)
        if (typeof _paq !== 'undefined') {
            _paq.push(['trackEvent', category, action, label]);
        }
    }

    // ==========================================
    // INTERACTION TRACKING
    // ==========================================

    function initTracking() {
        // Track CTA clicks
        document.querySelectorAll('.btn-hero-primary, .btn-primary-large, .btn-cta-primary').forEach(btn => {
            btn.addEventListener('click', function() {
                trackEvent('CTA', 'click', this.textContent.trim());
            });
        });

        // Track email clicks
        document.querySelectorAll('a[href^="mailto:"]').forEach(link => {
            link.addEventListener('click', function() {
                trackEvent('Contact', 'email_click', this.getAttribute('href'));
            });
        });

        // Track catalogue downloads
        document.querySelectorAll('a[href$=".pdf"]').forEach(link => {
            link.addEventListener('click', function() {
                trackEvent('Download', 'catalogue', this.textContent.trim());
            });
        });

        // Track sector card clicks
        document.querySelectorAll('.sector-card').forEach(card => {
            card.addEventListener('click', function() {
                trackEvent('Navigation', 'sector_click', this.querySelector('h3')?.textContent);
            });
        });
    }

    // ==========================================
    // UTILITY FUNCTIONS
    // ==========================================

    function debounce(func, wait) {
        let timeout;
        return function executedFunction(...args) {
            const later = () => {
                clearTimeout(timeout);
                func(...args);
            };
            clearTimeout(timeout);
            timeout = setTimeout(later, wait);
        };
    }

    function throttle(func, limit) {
        let inThrottle;
        return function(...args) {
            if (!inThrottle) {
                func.apply(this, args);
                inThrottle = true;
                setTimeout(() => inThrottle = false, limit);
            }
        };
    }

    // ==========================================
    // ACCESSIBILITY
    // ==========================================

    function initAccessibility() {
        // Add skip to main content link
        const skipLink = document.createElement('a');
        skipLink.href = '#main-content';
        skipLink.className = 'skip-to-content';
        skipLink.textContent = 'Aller au contenu principal';
        skipLink.style.cssText = `
            position: absolute;
            top: -40px;
            left: 0;
            background: #0066FF;
            color: white;
            padding: 8px 16px;
            z-index: 10001;
            border-radius: 0 0 8px 0;
            font-weight: 600;
        `;
        skipLink.addEventListener('focus', function() {
            this.style.top = '0';
        });
        skipLink.addEventListener('blur', function() {
            this.style.top = '-40px';
        });
        document.body.insertBefore(skipLink, document.body.firstChild);

        // Add main content ID if not exists
        const hero = document.querySelector('.hero-new');
        if (hero && !document.getElementById('main-content')) {
            hero.id = 'main-content';
            hero.setAttribute('tabindex', '-1');
        }
    }

    // ==========================================
    // PERFORMANCE MONITORING
    // ==========================================

    function logPerformance() {
        if ('performance' in window && 'PerformanceObserver' in window) {
            // Log page load time
            window.addEventListener('load', () => {
                const perfData = window.performance.timing;
                const pageLoadTime = perfData.loadEventEnd - perfData.navigationStart;
                console.log('⚡ Page Load Time:', pageLoadTime + 'ms');
            });
        }
    }

    // ==========================================
    // CSS ANIMATIONS
    // ==========================================

    function addCSSAnimations() {
        const style = document.createElement('style');
        style.textContent = `
            @keyframes slideInRight {
                from {
                    transform: translateX(100%);
                    opacity: 0;
                }
                to {
                    transform: translateX(0);
                    opacity: 1;
                }
            }

            @keyframes slideOutRight {
                from {
                    transform: translateX(0);
                    opacity: 1;
                }
                to {
                    transform: translateX(100%);
                    opacity: 0;
                }
            }

            .skip-to-content:focus {
                outline: 3px solid #FFF;
                outline-offset: 2px;
            }
        `;
        document.head.appendChild(style);
    }

    // ==========================================
    // INITIALIZATION
    // ==========================================

    function init() {
        console.log('%c◆ PROMEXA', 'font-size: 24px; font-weight: bold; color: #0066FF; background: #E6F0FF; padding: 8px 16px; border-radius: 8px;');
        console.log('%cTextile Professionnel Européen', 'color: #4A5568; font-size: 14px;');
        console.log('%c━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━', 'color: #E2E8F0;');
        console.log('✉️  contact@promexa.eu');
        console.log('🌍  Livraison Europe | Devis sous 24h');
        console.log('💰  Garantie Prix -5%');
        console.log('%c━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━', 'color: #E2E8F0;');
        console.log('%c✨ Version 2025 | Design by Claude', 'color: #00D9B8;');

        // Initialize all modules
        initMobileMenu();
        initHeaderScroll();
        initSmoothScroll();
        initBackToTop();
        initForms();
        initScrollAnimations();
        initLazyLoading();
        initTracking();
        initAccessibility();
        addCSSAnimations();
        logPerformance();
    }

    // ==========================================
    // START EVERYTHING
    // ==========================================

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', init);
    } else {
        init();
    }

})();
